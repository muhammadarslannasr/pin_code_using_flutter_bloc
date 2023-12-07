import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_pin_code/view_model/pin_code_event.dart';
import 'package:flutter_bloc_pin_code/view_model/pin_code_state.dart';

class PinCodeBloc extends Bloc<PinCodeEvent, PinCodeState> {
  PinCodeBloc()
      : super(
          PinCodeState(),
        ) {
    on<PinCodeEvent>(
      _pinCodeEvent,
    );
  }
  FutureOr<void> _pinCodeEvent(PinCodeEvent event, Emitter<PinCodeState> emit) {
    if (event is BackSpaceRemovePinCodeEvent) {
      if (state.enteredPin.isNotEmpty) {
        emit(
          PinCodeState(
            enteredPin: state.enteredPin.substring(
              0,
              state.enteredPin.length - 1,
            ),
            isPinVisible: state.isPinVisible,
          ),
        );
      }
    } else if (event is AddPinCodeEvent) {
      if (state.enteredPin.length < 4) {
        String merge = state.enteredPin;
        merge += event.number.toString();
        emit(
          PinCodeState(
            enteredPin: merge,
            isPinVisible: state.isPinVisible,
          ),
        );
      }
    } else if (event is PinCodeResetEvent) {
      emit(PinCodeState(enteredPin: ''));
    } else if (event is PinCodeVisibleInVisibleEvent) {
      emit(PinCodeState(
          enteredPin: state.enteredPin, isPinVisible: !state.isPinVisible));
    }
  }
}
