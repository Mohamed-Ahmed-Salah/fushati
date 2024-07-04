import 'package:equatable/equatable.dart';

class ServerException extends Equatable implements Exception {
  const ServerException({required this.message, required this.statusCode});

  final String message;
  final int statusCode;

  List<Object> get props => [message, statusCode];
}

class AuthenticationException extends Equatable implements Exception {
  const AuthenticationException(
      {required this.message, required this.statusCode});

  final String message;
  final int statusCode;

  List<Object> get props => [message, statusCode];
}

class CacheException extends Equatable implements Exception {
  const CacheException({required this.message});

  final String message;

  List<Object> get props => [message];
}

/// Exception thrown when the  user does not have an internet connection
class NoInternetException extends Equatable implements Exception {
  final String message;
  final int statusCode;

  const NoInternetException({required this.message, required this.statusCode});

  // TODO: implement props
  List<Object?> get props => [message, statusCode];
}

/// Exception thrown when the  user does not have an internet connection
class TimeOutException extends Equatable implements Exception {
  final String message;

  final int statusCode;

  const TimeOutException({required this.message, required this.statusCode});

  // TODO: implement props
  List<Object?> get props => [message, statusCode];
}
