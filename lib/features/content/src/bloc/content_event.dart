part of 'content_bloc.dart';

sealed class ContentEvent extends Equatable {
  const ContentEvent();

  @override
  List<Object> get props => [];
}

class ContentInitialEvent extends ContentEvent {
  const ContentInitialEvent();

  @override
  List<Object> get props => [];
}

class ContentFetchLegalEvent extends ContentEvent {
  const ContentFetchLegalEvent();
  @override
  List<Object> get props => [];
}

class ContentFetchCriticalEvent extends ContentEvent {
  const ContentFetchCriticalEvent();
  @override
  List<Object> get props => [];
}

class ContentAppLocaleChangedEvent extends ContentEvent {
  final String locale;
  const ContentAppLocaleChangedEvent(this.locale);
  @override
  List<Object> get props => [locale];
}
