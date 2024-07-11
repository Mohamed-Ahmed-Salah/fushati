import '../../../../core/usecase/usecase.dart';
import '../../../../core/utils/typedefs.dart';
import '../repos/user_info_repo.dart';

class DeleteUserInfo extends UsecaseWithParams<void, int> {
  const DeleteUserInfo(this._repo);

  final UserInfoRepo _repo;

  @override
  ResultFuture<void> call(int params) => _repo.deleteProfile(id: params);
}
