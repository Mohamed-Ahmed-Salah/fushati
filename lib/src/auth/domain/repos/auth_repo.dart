
import '../../../../core/utils/typedefs.dart';
import '../../data/models/user_model.dart';

abstract class AuthRepo {
  ResultFuture<void> loginOrRegister({
    required String phone,
  });

  ResultFuture<UserModel> verifyOTP({
    required String phone,
    required String otp,
  });

  ResultFuture<void> addCustomerInfo({
    required String email,

    required String name,

  });
}
