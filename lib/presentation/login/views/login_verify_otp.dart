import 'package:app_authentication/app_authentication.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/utils/enums.dart';

import '../../../widgets/otp_field.dart';
import '../../../widgets/otp_timer.dart';
import '../../../widgets/primary/back_button.dart';
import '../../../widgets/primary/primary_button.cmp.dart';
import '../login.dart';

class LoginVerifyOtp extends StatefulWidget {
  static const routeName = '/login/verify-otp';
  const LoginVerifyOtp({super.key});

  @override
  State<LoginVerifyOtp> createState() => _LoginVerifyOtpState();
}

class _LoginVerifyOtpState extends State<LoginVerifyOtp> {
  TextEditingController otpController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (context) => LoginBloc(
              authenticationRepository:
                  context.read<AuthenticationRepository>()),
          child: BlocBuilder<LoginBloc, LoginState>(
            builder: (context, state) => BlocListener<LoginBloc, LoginState>(
              listener: (context, state) {
                if (state.formStatus.isError) {
                  // showErrorSnack(context, state.error.toString());
                }
              },
              child: Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const KBackButton(),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.03,
                            ),
                            Text(
                              'Verify OTP',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineMedium
                                  ?.copyWith(
                                    color: Colors.blueGrey.shade700,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 50),
                        Text(
                          '',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.grey.shade900,
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 10),
                        OtpField(
                          controller: otpController,
                          onCompleted: (e) {
                            if (_formKey.currentState!.validate()) {
                              context
                                  .read<LoginBloc>()
                                  .add(LoginOtpSubmitted(e));
                            }
                          },
                        ),
                        const SizedBox(height: 16),
                        OtpTimer(onResend: () {
                          context.read<LoginBloc>().add(LoginResendOtp());
                          // showSuccessSnack(
                          //     context,
                          //     AppLocale.of(context)
                          //         .translate
                          //         .otp_has_been_resent);
                        }),
                        const SizedBox(height: 26),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: PrimaryButton(
                            isLoading: state.formStatus.isInProgress,
                            child: const Text('Send OTP'),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                context
                                    .read<LoginBloc>()
                                    .add(LoginOtpSubmitted(otpController.text));
                              }
                            },
                          ),
                        ),
                        const SizedBox(height: 26),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
