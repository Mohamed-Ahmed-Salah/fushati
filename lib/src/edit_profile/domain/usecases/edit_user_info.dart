import 'package:equatable/equatable.dart';

import '../../../../core/usecase/usecase.dart';
import '../../../../core/utils/typedefs.dart';
import '../../../profile/domain/repos/user_info_repo.dart';

class EditUserInfo extends UsecaseWithParams<void, EditUserInfoParams> {
  const EditUserInfo(this._repo);

  final UserInfoRepo _repo;

  @override
  ResultFuture<void> call(EditUserInfoParams params) => _repo.editUserInfo(
      email: params.email, name: params.name, gender: params.gender);
}

class EditUserInfoParams extends Equatable {
  const EditUserInfoParams({
    this.email,
    this.gender,
    required this.name,
  });

  final String name;
  final String? email;
  final String? gender;

  @override
  List<dynamic> get props => [
        name,
        email,
      ];
}
