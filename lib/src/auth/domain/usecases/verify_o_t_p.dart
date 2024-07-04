import 'package:equatable/equatable.dart';
import '../../../../core/usecase/usecase.dart';
import '../../../../core/utils/typedefs.dart';
import '../entities/user.dart';
import '../repos/auth_repo.dart';

class VerifyOTP extends UsecaseWithParams<User, VerifyOTPParams> {
  const VerifyOTP(this._repo);

  final AuthRepo _repo;

  @override
  ResultFuture<User> call(VerifyOTPParams params) => _repo.verifyOTP(
        phone: params.phone,
        otp: params.otp,
      );
}

class VerifyOTPParams extends Equatable {
  const VerifyOTPParams({
    required this.phone,
    required this.otp,
  });

  final String phone;
  final String otp;

  @override
  List<dynamic> get props => [phone, otp];
}
