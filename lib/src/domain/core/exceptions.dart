// coverage:ignore-file
sealed class AppException implements Exception {
  const AppException();
}

class MessageException extends AppException {
  final String exception;

  const MessageException(this.exception);

  @override
  String toString() => exception;
}

class NetworkException extends AppException {
  const NetworkException();

  @override
  String toString() => 'An error occurred. Please try again';
}

final class EmptyException extends AppException {
  const EmptyException();

  @override
  String toString() => '';
}

class AuthException extends AppException {
  final String message;

  const AuthException(this.message);

  @override
  String toString() => message;
}

class ServerException extends AppException {
  const ServerException();

  @override
  String toString() {
    return 'Server Error';
  }
}
