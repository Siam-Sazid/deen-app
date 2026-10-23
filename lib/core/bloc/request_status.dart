/// Shared lifecycle for Cubit states that load or submit something.
enum RequestStatus {
  initial,
  loading,
  success,
  failure;

  bool get isLoading => this == loading;
  bool get isSuccess => this == success;
  bool get isFailure => this == failure;
}
