import 'package:equatable/equatable.dart';

abstract class PinCodeEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class BackSpaceRemovePinCodeEvent extends PinCodeEvent {}

class AddPinCodeEvent extends PinCodeEvent {
  final int number;
  AddPinCodeEvent({required this.number});

  @override
  // TODO: implement props
  List<Object?> get props => [number];
}

class PinCodeResetEvent extends PinCodeEvent{}

class PinCodeVisibleInVisibleEvent extends PinCodeEvent{}


