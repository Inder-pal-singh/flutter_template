import 'package:flutter/material.dart';

import '../../utils/responsive_utils.dart';
import '../../utils/theme_config.dart';

class AppTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String? label;
  final String hint;
  final bool? enabled;
  final bool? readOnly;
  final int? minLines;
  final int? maxLines;
  final int? maxLength;
  final bool? autofocus;
  final TextInputType? keyboardType;
  final Iterable<String>? autofillHints;
  final void Function(String)? onChanged;
  final AutovalidateMode? autovalidateMode;
  final void Function()? onTap;
  final String? initialValue;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool? isObscure;
  final bool showLabel;
  const AppTextFormField(
      {super.key,
      this.controller,
      this.label,
      required this.hint,
      this.validator,
      this.enabled,
      this.readOnly,
      this.onTap,
      this.minLines,
      this.maxLines,
      this.autofocus,
      this.keyboardType,
      this.onChanged,
      this.suffixIcon,
      this.isObscure,
      this.autovalidateMode,
      this.maxLength,
      this.initialValue,
      this.autofillHints,
      this.prefixIcon,
      this.showLabel = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null)
          Text(label!,
              style: TextStyle(
                color: const Color(0xff777777),
                fontSize: Sizer.of(context).fontSize(14),
                fontWeight: FontWeight.w700,
              )),
        const SizedBox(height: 9),
        TextFormField(
          controller: controller,
          autofocus: autofocus ?? false,
          minLines: minLines,
          autovalidateMode: autovalidateMode,
          maxLines: maxLines ?? 1,
          initialValue: initialValue,
          maxLength: maxLength,
          obscureText: isObscure ?? false,
          autofillHints: autofillHints,
          decoration: InputDecoration(
            isDense: true,
            counter: const SizedBox(),
            alignLabelWithHint: false,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            labelText: showLabel ? label : null,
            hintText: hint,
            hintStyle: TextStyle(
                color: AppTheme.fontDarkGreyColor,
                fontSize: Sizer.of(context).fontSize(14),
                fontWeight: FontWeight.w600),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
            labelStyle: TextStyle(
                color: Colors.grey.shade500,
                fontSize: Sizer.of(context).fontSize(14),
                fontWeight: FontWeight.w600),
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon,
          ),
          onTap: onTap,
          onChanged: onChanged,
          enabled: enabled,
          keyboardType: keyboardType ?? TextInputType.text,
          textInputAction: TextInputAction.next,
          readOnly: readOnly ?? false,
          validator: validator,
        ),
      ],
    );
  }
}
