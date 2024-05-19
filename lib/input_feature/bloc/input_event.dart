// input/bloc/input_event.dart

import 'package:equatable/equatable.dart';

abstract class InputEvent extends Equatable {
  const InputEvent();

  @override
  List<Object> get props => [];
}

class NameSubmitted extends InputEvent {
  final String name;

  const NameSubmitted(this.name);

  @override
  List<Object> get props => [name];
}
