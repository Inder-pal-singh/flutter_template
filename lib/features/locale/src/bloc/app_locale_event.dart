part of 'app_locale_bloc.dart';

final class AppLocaleEvent extends Equatable {
  const AppLocaleEvent();

  @override
  List<Object> get props => [];
}

final class AppLocaleChangedEvent extends AppLocaleEvent {
  final Language locale;

  const AppLocaleChangedEvent({required this.locale});

  @override
  List<Object> get props => [locale];
}
