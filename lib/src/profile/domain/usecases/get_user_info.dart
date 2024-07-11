import 'package:fushati/src/profile/domain/entities/user.dart';

import '../../../../core/usecase/usecase.dart';
import '../../../../core/utils/typedefs.dart';
import '../repos/user_info_repo.dart';

class GetUserInfo extends UsecaseWithoutParams<User> {
  const GetUserInfo(this._repo);

  final UserInfoRepo _repo;

  @override
  ResultFuture<User> call() => _repo.getUserInfo();
}
