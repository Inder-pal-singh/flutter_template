// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get login => 'Login';

  @override
  String get logout => 'Abmelden';

  @override
  String get name => 'Name';

  @override
  String get enter_name => 'Geben Sie Ihren Namen ein';

  @override
  String get name_required => 'Name wird benötigt';

  @override
  String get surname => 'Nachname';

  @override
  String get enter_surname => 'Geben Sie Ihren Nachnamen ein';

  @override
  String get surname_required => 'Nachname wird benötigt';

  @override
  String get email => 'E-Mail';

  @override
  String get enter_email => 'Geben Sie Ihre E-Mail-Adresse ein';

  @override
  String get email_invalid => 'Ungült ige E-Mail-Adresse';

  @override
  String get sendOtp => 'OTP senden';

  @override
  String get register => 'Registrieren';

  @override
  String get dont_have_account => 'Kein Konto? ';

  @override
  String get signUp => 'Registrieren';

  @override
  String get already_have_account => 'Bereits ein Konto? ';

  @override
  String get signIn => 'Anmelden';

  @override
  String get email_required => 'E-Mail wird benötigt';

  @override
  String get invalid_email => 'Ungültige E-Mail';

  @override
  String get privacy_policy => 'Datenschutzbestimmungen ';

  @override
  String get login_in_with_a_unique_otp_code => 'Melden Sie sich mit einem einzigartigen OTP-Code an, der an Ihre E-Mail gesendet wird, kein Passwort erforderlich, was Komfort und Sicherheit gewährleistet.';

  @override
  String get resend_otp_in => 'OTP erneut senden in';

  @override
  String get otp_sent => 'OTP gesendet';

  @override
  String get did_not_receive_otp => 'Kein OTP erhalten? ';

  @override
  String get resend_otp => 'OTP erneut senden';

  @override
  String get verify_otp => 'OTP bestätigen';

  @override
  String get otp_has_been_resent => 'OTP wurde erneut an Ihre E-Mail gesendet';
}
