import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../utils/responsive_utils.dart';

class OtpField extends StatefulWidget {
  final Function(String)? onCompleted;
  final TextEditingController? controller;
  const OtpField({super.key, this.onCompleted, this.controller});

  @override
  State<OtpField> createState() => _OtpFieldState();
}

class _OtpFieldState extends State<OtpField> {
  @override
  Widget build(BuildContext context) {
    final sizer = Sizer.of(context);
    return Center(
      child: SizedBox(
        child: PinCodeTextField(
          controller: widget.controller,
          appContext: context,
          onCompleted: widget.onCompleted,
          length: 5,
          obscureText: false,
          animationType: AnimationType.fade,
          autoFocus: true,
          validator: (v) {
            if (v!.length < 5) {
              return 'Please enter a valid OTP';
            } else {
              return null;
            }
          },
          errorTextSpace: 29,
          autoDismissKeyboard: false,
          pinTheme: PinTheme(
            shape: PinCodeFieldShape.box,
            borderRadius: BorderRadius.circular(8),
            fieldHeight: sizer.height * 0.07,
            fieldWidth: sizer.width * 0.13,
            fieldOuterPadding: const EdgeInsets.all(8),
            activeFillColor: Colors.white,
            borderWidth: 0.6,
            inactiveColor: Colors.grey.shade400,
            selectedColor: Theme.of(context).colorScheme.secondary,
            activeColor: Theme.of(context).colorScheme.primary,
          ),
          keyboardType: TextInputType.number,
          textStyle: TextStyle(
            fontSize: 20,
            color: Theme.of(context).colorScheme.primary,
          ),
          animationDuration: const Duration(milliseconds: 300),
          enablePinAutofill: true,
        ),
      ),
    );
  }
}
