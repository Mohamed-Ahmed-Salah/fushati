
import 'package:fushati/src/auth/domain/entities/user.dart';

import '../../../../core/utils/typedefs.dart';

abstract class UserInfoRepo {
  ResultFuture<User> getUserInfo();
  ResultFuture<void> deleteProfile();

  ResultFuture<void> editUserInfo({
    required String email,
    required String name,

  });


}
