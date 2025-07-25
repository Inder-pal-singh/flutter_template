// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get login => 'Log In';

  @override
  String get logout => 'Log Out';

  @override
  String get name => 'Name';

  @override
  String get enter_name => 'Enter your name';

  @override
  String get name_required => 'Name is required';

  @override
  String get surname => 'Surname';

  @override
  String get enter_surname => 'Enter your surname';

  @override
  String get surname_required => 'Surname is required';

  @override
  String get email => 'Email';

  @override
  String get enter_email => 'Enter your email';

  @override
  String get email_invalid => 'Invalid email';

  @override
  String get sendOtp => 'Send OTP';

  @override
  String get register => 'Register';

  @override
  String get dont_have_account => 'Don\'t have an account? ';

  @override
  String get signUp => 'Sign Up';

  @override
  String get already_have_account => 'Already have an account? ';

  @override
  String get signIn => 'Sign In';

  @override
  String get email_required => 'Email is required';

  @override
  String get invalid_email => 'Invalid email';

  @override
  String get privacy_policy => 'Privacy Policy';

  @override
  String get login_in_with_a_unique_otp_code => 'Log in with a unique OTP code sent to your email, no password needed, ensuring convenience and security.';

  @override
  String get resend_otp_in => 'Resend OTP in';

  @override
  String get otp_sent => 'OTP sent';

  @override
  String get did_not_receive_otp => 'Didn\'t receive OTP? ';

  @override
  String get resend_otp => 'Resend OTP';

  @override
  String get verify_otp => 'Verify OTP';

  @override
  String get otp_has_been_resent => 'OTP has been resent to your email';
}
