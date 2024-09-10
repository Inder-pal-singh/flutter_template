import 'package:flutter/material.dart';

import '../../utils/responsive_utils.dart';
import '../../utils/theme_config.dart';

class PrimaryButton extends StatelessWidget {
  final Widget child;
  final bool? isLoading;
  final void Function() onPressed;
  final ButtonStyle? style;
  final bool? outline;
  final bool? disabled;

  const PrimaryButton(
      {super.key,
      required this.child,
      required this.onPressed,
      this.isLoading,
      this.style,
      this.outline,
      this.disabled});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed:
            ((isLoading ?? false) || (disabled ?? false)) ? null : onPressed,
        style: style ??
            ButtonStyle(
              side: WidgetStateProperty.all((outline ?? false)
                  ? BorderSide(
                      color: (disabled ?? false)
                          ? Colors.grey.shade300
                          : AppTheme.primaryColor,
                      width: 1.8)
                  : null),
              backgroundColor: WidgetStateProperty.all(
                  (outline ?? false) ? Colors.white : null),
              padding: WidgetStateProperty.all(
                  const EdgeInsets.symmetric(vertical: 16, horizontal: 24)),
              textStyle: WidgetStateProperty.all(TextStyle(
                fontSize: Sizer.of(context).fontSize(16),
                fontWeight: FontWeight.w600,
                color: (outline ?? false)
                    ? (disabled ?? false)
                        ? Colors.grey
                        : AppTheme.primaryColor
                    : Colors.white,
              )),
              foregroundColor: WidgetStateProperty.all((outline ?? false)
                  ? (disabled ?? false)
                      ? Colors.grey
                      : AppTheme.primaryColor
                  : Colors.white),
              elevation: WidgetStateProperty.all(0),
              shape: WidgetStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16))),
            ),
        child: (isLoading ?? false)
            ? SizedBox(
                height: Sizer.of(context).height * 0.02,
                width: Sizer.of(context).height * 0.02,
                child: const CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 2,
                ),
              )
            : child);
  }
}
