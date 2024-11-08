import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../app_locale.dart';

part 'app_locale_event.dart';
part 'app_locale_state.dart';

class AppLocaleBloc extends Bloc<AppLocaleEvent, AppLocaleState> {
  final AppLocaleRepository appLocaleRepository;
  late StreamSubscription<Language> _languageSubscription;

  AppLocaleBloc({required this.appLocaleRepository})
      : super(const AppLocaleState()) {
    on<AppLocaleChangedEvent>((event, emit) {
      emit(AppLocaleState(language: event.locale));
    });

    _languageSubscription = appLocaleRepository.status.listen((language) {
      add(AppLocaleChangedEvent(locale: language));
    });
  }

  @override
  Future<void> close() {
    _languageSubscription.cancel();
    return super.close();
  }
}
