// /bloc/input_state.dart

import 'package:equatable/equatable.dart';

abstract class InputState extends Equatable {
  const InputState();

  @override
  List<Object> get props => [];
}

class InputInitial extends InputState {}

class InputLoading extends InputState {}

class InputSuccess extends InputState {
  final int age;

  const InputSuccess(this.age);

  @override
  List<Object> get props => [age];
}

class InputFailure extends InputState {
  

  const InputFailure();

  @override
  List<Object> get props => [];
}
