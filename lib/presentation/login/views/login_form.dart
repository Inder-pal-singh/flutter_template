import 'package:app_assets/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_template/utils/enums.dart';
import 'package:flutter_template/utils/string_extensions.dart';

import '../../../utils/responsive_utils.dart';
import '../../../widgets/primary/form_field.cmp.dart';
import '../../../widgets/primary/primary_button.cmp.dart';
import '../../../widgets/privacy_policy_sheet.dart';
import '../login.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  TextEditingController emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final sizer = Sizer.of(context);
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state.formStatus.isServerError) {
          // showDialog(
          //     context: context,
          //     builder: (context) => ErrorDialog(
          //           title: AppLocale.of(context).translate.something_went_wrong,
          //           message: AppLocale.of(context).translate.there_was_an_issue,
          //           onTryAgain: (lm) {
          //             // contextmk
          //             //     .read<LoginBloc>()
          //             //     .add(LoginEmailSubmitted(emailController.text));
          //             Navigator.of(context).pop();
          //           },
          //         ));
        }
        if (state.formStatus.isError) {
          // showErrorSnack(context, state.error.toString());
        }
        if (state.formStatus.isFormSubmitted) {
          Navigator.of(context).pushNamed(LoginVerifyOtp.routeName);
        }
      },
      child: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                  bottom: Sizer.of(context).mq.viewInsets.bottom),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  Center(child: Image.asset(AppAssets.logoOutlined)),
                  const SizedBox(height: 16),
                  Text(
                    "Welcome",
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                          color: Colors.blueGrey.shade700,
                          fontWeight: FontWeight.w600,
                          fontSize: sizer.fontSize(24),
                        ),
                  ),
                  const SizedBox(height: 30),
                  _EmailInput(
                    emailController: emailController,
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: sizer.width,
                    child: _LoginButton(
                      onSubmit: () {
                        if (_formKey.currentState!.validate()) {
                          context
                              .read<LoginBloc>()
                              .add(LoginEmailSubmitted(emailController.text));
                        }
                      },
                    ),
                  ),
                  SizedBox(height: Sizer.of(context).height * 0.03),
                  SizedBox(height: Sizer.of(context).height * 0.01),
                  const PrivacyPolicySheet(),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _EmailInput extends StatelessWidget {
  final TextEditingController emailController;
  const _EmailInput({required this.emailController});

  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
      label: 'Email',
      hint: 'Email',
      controller: emailController,
      autofocus: true,
      prefixIcon: Padding(
        padding: const EdgeInsets.all(14.0),
        child: SvgPicture.asset(
          AppAssets.smsIcon,
          width: 16,
          height: 12,
        ),
      ),
      autofillHints: const [AutofillHints.email],
      showLabel: false,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Email is required';
        }
        if (value.isEmail == false) {
          return 'Invalid email';
        }
        return null;
      },
      keyboardType: TextInputType.emailAddress,
    );
  }
}

class _LoginButton extends StatelessWidget {
  final void Function() onSubmit;
  const _LoginButton({required this.onSubmit});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return PrimaryButton(
            isLoading: state.formStatus.isInProgress,
            onPressed: onSubmit,
            child: const Text('Send OTP',
                style: TextStyle(color: Colors.white, fontSize: 17)));
      },
    );
  }
}
