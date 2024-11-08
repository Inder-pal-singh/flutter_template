import 'package:app_assets/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/widgets/primary/primary_button.cmp.dart';

import '../../widgets/primary/form_field.cmp.dart';

class LoginView extends StatefulWidget {
  static const routeName = '/login';
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 20),
              Center(
                child: Image.asset(
                  AppAssets.logoOutlined,
                  height: 100,
                ),
              ),
              const SizedBox(height: 40),
              const Text(
                'Login/Signup',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              const AppTextFormField(
                label: 'Email',
                hint: 'Eg: dem',
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: PrimaryButton(
                  child: const Text('Send OTP'),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
