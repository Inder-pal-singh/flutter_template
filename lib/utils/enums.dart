enum FormStatus {
  unknown,
  formSubmitted,
  otpSubmitted,
  error,
  inProgress,
  serverError
}

extension FormStatusX on FormStatus {
  bool get isUnknown => this == FormStatus.unknown;
  bool get isFormSubmitted => this == FormStatus.formSubmitted;
  bool get isOtpSubmitted => this == FormStatus.otpSubmitted;
  bool get isError => this == FormStatus.error;
  bool get isInProgress => this == FormStatus.inProgress;
  bool get isServerError => this == FormStatus.serverError;
}
