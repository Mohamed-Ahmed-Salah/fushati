
import 'package:fushati/src/auth/domain/entities/user.dart';

import '../../../../core/utils/typedefs.dart';

abstract class UserInfoRepo {
  ResultFuture<User> getUserInfo();
  ResultFuture<void> deleteProfile({required int id});

  ResultFuture<void> editUserInfo({
    required String email,
    required String name,

  });


}
