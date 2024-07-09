import 'package:meta/meta.dart';
import 'dart:convert';


class LoginResponse {
  final String message;
  final String verificationCode;

  LoginResponse({
    required this.message,
    required this.verificationCode,
  });

}
