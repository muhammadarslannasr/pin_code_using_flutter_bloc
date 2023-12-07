import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_pin_code/view_model/pin_code_bloc.dart';
import 'package:flutter_bloc_pin_code/view_model/pin_code_event.dart';

class PinCodeScreen extends StatefulWidget {
  const PinCodeScreen({Key? key}) : super(key: key);

  @override
  State<PinCodeScreen> createState() => _PinCodeScreenState();
}

class _PinCodeScreenState extends State<PinCodeScreen> {

  /// this widget will be use for each digit
  Widget numButton(int number) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: TextButton(
        onPressed: () {
          context.read<PinCodeBloc>().add(AddPinCodeEvent(number: number));
        },
        child: Text(
          number.toString(),
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          physics: const BouncingScrollPhysics(),
          children: [
            const Center(
              child: Text(
                'Enter Your Pin',
                style: TextStyle(
                  fontSize: 32,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 50),

            /// pin code area
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                4,
                (index) {
                  return Container(
                    margin: const EdgeInsets.all(6.0),
                    width: context.watch<PinCodeBloc>().state.isPinVisible ? 50 : 16,
                    height: context.watch<PinCodeBloc>().state.isPinVisible ? 50 : 16,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6.0),
                      color: index < context.watch<PinCodeBloc>().state.enteredPin.length
                          ? context.watch<PinCodeBloc>().state.isPinVisible
                              ? Colors.green
                              : CupertinoColors.activeBlue
                          : CupertinoColors.activeBlue.withOpacity(0.1),
                    ),
                    child: context.watch<PinCodeBloc>().state.isPinVisible && index < context.watch<PinCodeBloc>().state.enteredPin.length
                        ? Center(
                            child: Text(
                              context.watch<PinCodeBloc>().state.enteredPin[index],
                              style: const TextStyle(
                                fontSize: 17,
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          )
                        : null,
                  );
                },
              ),
            ),

            /// visibility toggle button
            IconButton(
              onPressed: () {
                context.read<PinCodeBloc>().add(PinCodeVisibleInVisibleEvent());
              },
              icon: Icon(
                context.watch<PinCodeBloc>().state.isPinVisible ? Icons.visibility_off : Icons.visibility,
              ),
            ),

            SizedBox(height: context.watch<PinCodeBloc>().state.isPinVisible ? 50.0 : 8.0),

            /// digits
            for (var i = 0; i < 3; i++)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(
                    3,
                    (index) => numButton(1 + 3 * i + index),
                  ).toList(),
                ),
              ),

            /// 0 digit with back remove
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const TextButton(onPressed: null, child: SizedBox()),
                  numButton(0),
                  TextButton(
                    onPressed: () {

                      context.read<PinCodeBloc>().add(BackSpaceRemovePinCodeEvent());
                    },
                    child: const Icon(
                      Icons.backspace,
                      color: Colors.black,
                      size: 24,
                    ),
                  ),
                ],
              ),
            ),

            /// reset button
            TextButton(
              onPressed: () {
                context.read<PinCodeBloc>().add(PinCodeResetEvent());
              },
              child: const Text(
                'Reset',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
