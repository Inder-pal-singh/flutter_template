part of 'content_bloc.dart';

enum BlocStatus { initial, loading, loaded, error }

final class ContentState extends Equatable {
  const ContentState({
    this.privacyPolicy,
    this.termsAndConditions,
    this.aboutUs,
    this.genders = const [],
    this.relationships = const [],
    this.status = BlocStatus.initial,
    this.locale = 'en',
    this.queries = const [],
    this.faqs = const [],
  });
  final Content? privacyPolicy;
  final Content? termsAndConditions;
  final Content? aboutUs;
  final List<Content> genders;
  final List<Content> relationships;
  final List<Content> queries;
  final List<Content> faqs;
  final BlocStatus status;
  final String locale;

  bool get hasData =>
      privacyPolicy != null && termsAndConditions != null && aboutUs != null;
  @override
  List<Object?> get props => [
        privacyPolicy,
        termsAndConditions,
        aboutUs,
        hasData,
        genders,
        relationships,
        status,
        locale,
        queries,
        faqs,
      ];

  // copyWith method
  ContentState copyWith({
    Content? privacyPolicy,
    Content? termsAndConditions,
    Content? aboutUs,
    List<Content>? genders,
    List<Content>? relationships,
    List<Content>? queries,
    List<Content>? faqs,
    BlocStatus? status,
    String? locale,
  }) {
    return ContentState(
      privacyPolicy: privacyPolicy ?? this.privacyPolicy,
      termsAndConditions: termsAndConditions ?? this.termsAndConditions,
      aboutUs: aboutUs ?? this.aboutUs,
      genders: genders ?? this.genders,
      relationships: relationships ?? this.relationships,
      queries: queries ?? this.queries,
      faqs: faqs ?? this.faqs,
      status: status ?? this.status,
      locale: locale ?? this.locale,
    );
  }
}
