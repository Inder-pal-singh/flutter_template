import 'package:app_logger/app_logger.dart';
import 'package:app_storage/app_storage.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/content_repository.dart';
import '../models/content.model.dart';

part 'content_event.dart';
part 'content_state.dart';

class ContentBloc extends Bloc<ContentEvent, ContentState> {
  final ContentRepository repositoryProvider;
  ContentBloc({required this.repositoryProvider})
      : super(const ContentState()) {
    on<ContentInitialEvent>((event, emit) {
      AppStorage storage = AppStorage();
      add(ContentAppLocaleChangedEvent(storage.appLanguage));
    });

    on<ContentFetchLegalEvent>((event, emit) async {
      if (state.privacyPolicy != null) return;
      emit(state.copyWith(status: BlocStatus.loading));
      final privacy = await repositoryProvider.getSingleContent('privacy');
      final about = await repositoryProvider.getSingleContent('about');
      final tnc = await repositoryProvider.getSingleContent('tnc');

      emit(state.copyWith(
        privacyPolicy: privacy,
        aboutUs: about,
        status: BlocStatus.loaded,
        termsAndConditions: tnc,
      ));
    });
    on<ContentFetchCriticalEvent>(_onFetchCritical);
    on<ContentAppLocaleChangedEvent>((event, emit) {
      emit(state.copyWith(locale: event.locale));
      logger.i("Locale changed to ${event.locale}, Triggering fetch");
      add(const ContentFetchCriticalEvent());
    });
    add(const ContentInitialEvent());
  }

  Future<void> _onFetchCritical(
      ContentFetchCriticalEvent event, Emitter<ContentState> emit) async {
    emit(state.copyWith(status: BlocStatus.loading));
    final genders = await repositoryProvider.getContent('gender');
    final relationships = await repositoryProvider.getContent('relationship');
    emit(state.copyWith(
        genders: genders,
        relationships: relationships,
        status: BlocStatus.loaded));

    // other not-so-critical data
    final queries = await repositoryProvider.getContent('query');
    final faq = await repositoryProvider.getContent('faq');
    emit(state.copyWith(queries: queries, faqs: faq));
  }
}
