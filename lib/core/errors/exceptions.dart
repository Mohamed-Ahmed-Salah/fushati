import 'package:equatable/equatable.dart';
import 'package:fushati/core/utils/constants/error_consts.dart';

class ServerException extends Equatable implements Exception {
  const ServerException({required this.message, required this.statusCode});

  final String message;
  final int statusCode;

  @override
  List<Object> get props => [message, statusCode];
}

class CardNotFoundException extends Equatable implements Exception {
  const CardNotFoundException(
      {this.message = ErrorConst.CANNOT_FIND_CARD_EN,
      required this.statusCode});

  final String message;
  final int statusCode;

  @override
  List<Object> get props => [message, statusCode];
}

class AuthenticationException extends Equatable implements Exception {
  const AuthenticationException(
      {required this.message, required this.statusCode});

  final String message;
  final int statusCode;

  @override
  List<Object> get props => [message, statusCode];
}

class CacheException extends Equatable implements Exception {
  const CacheException({required this.message});

  final String message;

  @override
  List<Object> get props => [message];
}

/// Exception thrown when the  user does not have an internet connection
class NoInternetException extends Equatable implements Exception {
  final String message;
  final int statusCode;

  const NoInternetException({required this.message, required this.statusCode});

  // TODO: implement props
  @override
  List<Object?> get props => [message, statusCode];
}

/// Exception thrown when the  user does not have an internet connection
class TimeOutException extends Equatable implements Exception {
  final String message;

  final int statusCode;

  const TimeOutException({required this.message, required this.statusCode});

  // TODO: implement props
  @override
  List<Object?> get props => [message, statusCode];
}

class PaymentException extends Equatable implements Exception {
  final String message;

  final int statusCode;

  const PaymentException({required this.message, required this.statusCode});

  // TODO: implement props
  @override
  List<Object?> get props => [message, statusCode];
}