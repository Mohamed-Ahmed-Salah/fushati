
import '../../domain/entities/otp_response.dart';

class OtpResponseModel extends OtpResponse {
  OtpResponseModel({
    required super.token,
  });

  factory OtpResponseModel.fromJson(Map<String, dynamic> json) =>
      OtpResponseModel(
        token: json["token"],
      );

}
