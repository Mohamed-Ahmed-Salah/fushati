import 'package:fushati/src/splash/domain/repo/notifications_repo.dart';

import '../../../../core/usecase/usecase.dart';
import '../../../../core/utils/typedefs.dart';

class NotificationUsecase extends UsecaseWithParams<void,String> {
  const NotificationUsecase(this._repo);

  final NotificationsRepo _repo;

  @override
  ResultFuture<void> call(String params) => _repo.postFCM(params);
}
