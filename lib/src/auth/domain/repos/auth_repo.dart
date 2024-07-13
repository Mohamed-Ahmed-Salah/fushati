
import '../../../../core/utils/typedefs.dart';
import '../entities/otp_response.dart';

abstract class AuthRepo {
  ResultFuture<void> loginOrRegister({
    required String phone,
  });

  ResultFuture<OtpResponse> verifyOTP({
    required String phone,
    required String otp,
  });

  ResultFuture<void> addCustomerInfo({
    required String email,

    required String name,

  });
}
