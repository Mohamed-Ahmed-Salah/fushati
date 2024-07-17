import 'package:fushati/src/profile/domain/entities/user.dart';

import '../../../../core/utils/typedefs.dart';

abstract class UserInfoRepo {
  ResultFuture<User> getUserInfo();

  ResultFuture<void> deleteProfile({required int id});

  ResultFuture<void> editUserInfo({
    String? email,
    String? gender,

    required String name,
  });
}
