import 'package:flutter/material.dart';

import '../../../widgets/keyboard_dismissable.dart';
import 'login_form.dart';

class LoginView extends StatefulWidget {
  static const routeName = '/login';
  const LoginView({super.key});
  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const LoginView());
  }

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvokedWithResult: (e, d) {
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
      },
      child: const Scaffold(
        body: SafeArea(child: KeyboardDismissable(child: LoginForm())),
      ),
    );
  }
}
