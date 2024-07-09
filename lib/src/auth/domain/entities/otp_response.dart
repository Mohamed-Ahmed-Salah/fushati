import 'package:fushati/src/auth/data/models/user_model.dart';

import '../../domain/entities/user.dart';

class OtpResponse {
  final User user;
  final String token;

  OtpResponse({
    required this.user,
    required this.token,
  });

}
