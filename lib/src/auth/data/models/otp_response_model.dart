import 'package:fushati/src/auth/data/models/user_model.dart';

import '../../domain/entities/otp_response.dart';
import '../../domain/entities/user.dart';

class OtpResponseModel extends OtpResponse {
  OtpResponseModel({
    required super.user,
    required super.token,
  });

  factory OtpResponseModel.fromJson(Map<String, dynamic> json) =>
      OtpResponseModel(
        user: UserModel.fromJson(json["user"]),
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "user": user.toJson(),
        "token": token,
      };
}
