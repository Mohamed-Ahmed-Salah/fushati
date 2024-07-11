import 'package:equatable/equatable.dart';

import '../../../../core/usecase/usecase.dart';
import '../../../../core/utils/typedefs.dart';
import '../../../profile/domain/repos/user_info_repo.dart';

class EditUserInfo extends UsecaseWithParams<void, EditUserInfoParams> {
  const EditUserInfo(this._repo);

  final UserInfoRepo _repo;

  @override
  ResultFuture<void> call(EditUserInfoParams params) =>
      _repo.editUserInfo(email: params.email, name: params.name,
      );
}

class EditUserInfoParams extends Equatable {
  const EditUserInfoParams( {
     this.email,

    required this.name,
  });

  final String name;
  final String? email;



  @override
  List<dynamic> get props => [name, email,];
}
