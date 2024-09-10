import 'package:flutter/widgets.dart';

/// Wrap your root App widget in this widget and call [AppRestart.rebirth] to restart your app.
class AppRestart extends StatefulWidget {
  final Widget child;

  const AppRestart({super.key, required this.child});

  @override
  AppRestartState createState() => AppRestartState();

  static rebirth(BuildContext context) {
    context.findAncestorStateOfType<AppRestartState>()!.restartApp();
  }
}

class AppRestartState extends State<AppRestart> {
  Key _key = UniqueKey();

  void restartApp() {
    setState(() {
      _key = UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    return KeyedSubtree(
      key: _key,
      child: widget.child,
    );
  }
}
