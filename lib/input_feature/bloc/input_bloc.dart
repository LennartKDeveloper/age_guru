

import 'package:age_guru/input_feature/repository/guessAgeApi.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'input_event.dart';
import 'input_state.dart';

class InputBloc extends Bloc<InputEvent, InputState> {
  final GuessAgeApi ageApi;

  InputBloc({required this.ageApi}) : super(InputInitial()) {
    on<NameSubmitted>(_onNameSubmitted);
  }

  void _onNameSubmitted(NameSubmitted event, Emitter<InputState> emit) async {
    emit(InputLoading());
    try {
      final age = await ageApi.guessAge(name: event.name);
      emit(InputSuccess(age));
    } catch (e) {
      emit (const InputFailure());
    }
  }
}

