

import 'package:equatable/equatable.dart';

import '../../../../core/usecase/usecase.dart';
import '../../../../core/utils/typedefs.dart';
import '../repos/auth_repo.dart';

class LoginOrRegister extends UsecaseWithParams<void, LoginOrRegisterParams> {
  const LoginOrRegister(this._repo);

  final AuthRepo _repo;

  @override
  ResultFuture<void> call(LoginOrRegisterParams params) => _repo.loginOrRegister(
        phone: params.phone,
      );
}

class LoginOrRegisterParams extends Equatable {
  const LoginOrRegisterParams({
    required this.phone,
  });

  final String phone;

  @override
  List<dynamic> get props => [phone];
}
