import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:fushati/core/services/firebase_messaging_service.dart';
import 'package:fushati/src/splash/domain/usecases/notification_usecase.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_state.dart';

part 'notification_cubit.freezed.dart';

class NotificationCubit extends Cubit<NotificationState> {
  final NotificationUsecase _notificationUsecase;

  NotificationCubit({required NotificationUsecase notificationUsecase})
      : _notificationUsecase = notificationUsecase,
        super(const NotificationState.initial());

  updateNotification() async {
    final String? fcmToken = await MyFirebaseMessagingService.getFCMToken();
    try {
      if (fcmToken?.isNotEmpty ?? false) {
        final response = _notificationUsecase(fcmToken!);
      }
    } catch (e) {
      debugPrint("ERROR updateNotification ${e.toString()}");
    }
  }
}
