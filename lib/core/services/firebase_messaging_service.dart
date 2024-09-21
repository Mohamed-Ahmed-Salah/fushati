
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:fushati/core/services/notification_service.dart';

class MyFirebaseMessagingService {
  MyFirebaseMessagingService._();

  static final FirebaseMessaging messaging = FirebaseMessaging.instance;

 static Future<String?> getFCMToken() async {
    final String? fcmToken = await messaging.getToken();
    return fcmToken;
  }

  static Future<void> handleIncomingMessage(RemoteMessage message) async {
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
            'Message also contained a notification: ${message.notification}');
        // Show the notification when the app is in the foreground
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
    FirebaseMessaging.onBackgroundMessage(handleIncomingMessage);
    foregroundListening();

    FirebaseMessaging.instance.onTokenRefresh.listen((fcmToken) {
      // TODO: If necessary send token to application server.

      // Note: This callback is fired at each app startup and whenever a new
      // token is generated.
    }).onError((err) {
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
