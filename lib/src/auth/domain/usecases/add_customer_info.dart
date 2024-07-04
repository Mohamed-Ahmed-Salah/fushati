

import 'package:equatable/equatable.dart';

import '../../../../core/usecase/usecase.dart';
import '../../../../core/utils/typedefs.dart';
import '../repos/auth_repo.dart';

class AddUserInfo extends UsecaseWithParams<void, AddUserInfoParams> {
  const AddUserInfo(this._repo);

  final AuthRepo _repo;

  @override
  ResultFuture<void> call(AddUserInfoParams params) => _repo.addCustomerInfo(
      email: params.email,

      name: params.name,
    );
}

class AddUserInfoParams extends Equatable {
  const AddUserInfoParams({

    required this.name,
    required this.email,
  });

  final String name;
  final String email;


  @override
  List<dynamic> get props => [name, email,];
}
