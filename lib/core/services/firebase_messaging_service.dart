import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:fushati/core/services/notification_service.dart';
import 'package:fushati/src/splash/presentation/app/notification_cubit/notification_cubit.dart';
import 'package:get_it/get_it.dart';

class MyFirebaseMessagingService {
  MyFirebaseMessagingService._();

  static final FirebaseMessaging messaging = FirebaseMessaging.instance;

  static Future<String?> getFCMToken() async {
    final String? fcmToken = await messaging.getToken();
    return fcmToken;
  }

  static Future<void> handleBackgroundMessage(RemoteMessage message) async {
    if (message.notification != null) {
      debugPrint('Notification Title: ${message.notification?.title}');
      debugPrint('Notification Body: ${message.notification?.body}');
    }
    if (message.data.isNotEmpty) {
      debugPrint('Data Payload: ${message.data}');
    }
  }

  // Start listening for foreground messages
  static foregroundListening() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      debugPrint('Got a message whilst in the foreground!');
      debugPrint('Message data: ${message.data}');

      if (message.notification != null) {
        debugPrint(
            'Message also contained a notification: ${message.notification?.toMap()}');
        /// Show the notification when the app is in the foreground
        NotificationService.instance.showNotification(
          0, // Notification ID
          message.notification?.title ?? 'No Title',
          message.notification?.body ?? 'No Body',
        );
      }
    });
  }

  static Future<void> initNotifications() async {
    await NotificationService.instance
        .initializeNotifications(); // Initialize notifications
    final fcmToken = await getFCMToken();
    debugPrint("fcmToken= $fcmToken");
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
    foregroundListening();

    FirebaseMessaging.instance.onTokenRefresh.listen((fcmToken) {
      debugPrint("FCM token Refreshed! $fcmToken");
      GetIt.instance.get<NotificationCubit>().updateNotification(fcmToken);
    }).onError((err) {
      debugPrint("Error when listening to  FirebaseMessaging.instance.onTokenRefresh");
      // Error getting token.
    });
  }

  // Request user permission for notifications (iOS and Android 13+)
  static Future<void> requestPermission() async {
    NotificationSettings settings = await messaging.requestPermission();
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      debugPrint('User granted permission');
    } else {
      debugPrint('User declined or has not accepted permission');
    }
  }
}
