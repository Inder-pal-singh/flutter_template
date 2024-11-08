import 'package:flutter/cupertino.dart';

class KeyboardDismissable extends StatelessWidget {
  final Widget child;
  const KeyboardDismissable({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: child);
  }
}
