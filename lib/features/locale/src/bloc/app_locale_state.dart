part of 'app_locale_bloc.dart';

final class AppLocaleState extends Equatable {
  final Language? language;
  const AppLocaleState({this.language});

  @override
  List<Object?> get props => [language];
}
