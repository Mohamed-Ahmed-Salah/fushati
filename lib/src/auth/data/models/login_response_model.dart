import '../../domain/entities/login_response.dart';

class LoginResponseModel extends LoginResponse {
  LoginResponseModel({
    required super.message,
    required super.verificationCode,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      LoginResponseModel(
        message: json["message"],
        verificationCode: json["verification_code"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "verification_code": verificationCode ?? "",
      };
}
