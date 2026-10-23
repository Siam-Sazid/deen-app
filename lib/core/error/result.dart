import '../network/api_exception.dart';

/// Outcome of a repository call. Repositories return this instead of
/// throwing, so Cubits handle errors with an exhaustive `switch`.
sealed class Result<T> {
  const Result();
}

final class Success<T> extends Result<T> {
  const Success(this.data);

  final T data;
}

final class Failure<T> extends Result<T> {
  const Failure(this.error);

  final ApiException error;
}

/// Runs [action] and wraps its value or [ApiException] in a [Result].
Future<Result<T>> guard<T>(Future<T> Function() action) async {
  try {
    return Success(await action());
  } on ApiException catch (e) {
    return Failure(e);
  }
}
