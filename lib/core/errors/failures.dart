import 'package:equatable/equatable.dart';

import 'exceptions.dart';

abstract class Failure extends Equatable {
  const Failure({required this.message, required this.statusCode});

  final String message;
  final int statusCode;

  String get errorMessage => '$statusCode Error: $message';

  @override
  List<Object> get props => [message, statusCode];
}

class ServerFailure extends Failure {
  const ServerFailure({required super.message, required super.statusCode});

  ServerFailure.fromException(ServerException e)
      : this(message: e.message, statusCode: e.statusCode);
}
class PaymentFailure extends Failure {
  const PaymentFailure({required super.message, required super.statusCode});

  PaymentFailure.fromException(PaymentException e)
      : this(message: e.message, statusCode: e.statusCode);
}

class CacheFailure extends Failure {
  // 3 - Data not found in cache --> Just custom code I made up
  const CacheFailure({required super.message}) : super(statusCode: 3);

  CacheFailure.fromException(CacheException e) : this(message: e.message);
}

class AuthenticationFailure extends Failure {
  const AuthenticationFailure(
      {required super.message, required super.statusCode});

  AuthenticationFailure.fromException(AuthenticationException e)
      : this(message: e.message, statusCode: e.statusCode);
}



class NoInternetFailure extends Failure {
  const NoInternetFailure(
      {required super.message, required super.statusCode});

  NoInternetFailure.fromException(NoInternetException e)
      : this(message: e.message, statusCode: e.statusCode);
}


class TimeOutFailure extends Failure {
  const TimeOutFailure(
      {required super.message, required super.statusCode});

  TimeOutFailure.fromException(TimeOutException e)
      : this(message: e.message, statusCode: e.statusCode);
}

class CardNotFoundFailure extends Failure {
  const CardNotFoundFailure(
      {required super.message, required super.statusCode});

  CardNotFoundFailure.fromException(CardNotFoundException e)
      : this(message: e.message, statusCode: e.statusCode);
}