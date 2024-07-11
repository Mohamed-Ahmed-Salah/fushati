import 'package:fushati/src/profile/data/models/user_model.dart';

import '../../../profile/domain/entities/user.dart';

class OtpResponse {
  final User user;
  final String token;

  OtpResponse({
    required this.user,
    required this.token,
  });

}
