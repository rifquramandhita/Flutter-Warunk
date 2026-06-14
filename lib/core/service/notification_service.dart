import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:warunk/main.dart';
// import 'package:mimicici_cake/app/presentation/detail_order_online/detail_order_online_screen.dart';

class NotificationService {
  static Future<void> init() async {
    NotificationSettings settings = await FirebaseMessaging.instance
        .requestPermission(
          alert: true,
          announcement: false,
          badge: true,
          carPlay: false,
          criticalAlert: false,
          provisional: false,
          sound: true,
        );

    final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();

    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@drawable/ic_notification');

    const DarwinInitializationSettings initializationSettingsIOS =
        DarwinInitializationSettings(
          requestSoundPermission: false,
          requestBadgePermission: false,
          requestAlertPermission: false,
        );
    const InitializationSettings initializationSettings =
        InitializationSettings(
          android: initializationSettingsAndroid,
          iOS: initializationSettingsIOS,
        );

    await flutterLocalNotificationsPlugin.initialize(
      settings: initializationSettings,
      onDidReceiveNotificationResponse: onDidReceiveNotificationResponse,
    );

    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    try {
      final fcmToken = await FirebaseMessaging.instance.getToken();
      print(fcmToken);
    } catch (e) {
      print('Failed to get FCM token: $e');
    }

    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = notification?.android;

      if (notification != null && android != null) {
        flutterLocalNotificationsPlugin.show(
          id: notification.hashCode,
          title: notification.title,
          body: notification.body,
          notificationDetails: NotificationDetails(
            android: AndroidNotificationDetails(
              'channel_id',
              'channel_name',
              icon: '@drawable/ic_notification',
            ),
          ),
          payload: jsonEncode(message.data),
        );
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      // if (message.data['order_id'] != null) {
      //   navigatorKey.currentState?.push(
      //     MaterialPageRoute(
      //       builder: (context) => DetailOrderOnlineScreen(
      //         param1: message.data['order_id'],
      //       ),
      //     ),
      //   );
      // }
    });
  }

  static Future<void> _firebaseMessagingBackgroundHandler(
    RemoteMessage message,
  ) async {
    await Firebase.initializeApp();

    print("Handling a background message: ${message.messageId}");
  }
}

void onDidReceiveNotificationResponse(
  NotificationResponse notificationResponse,
) async {
  final String? payloadString = notificationResponse.payload;
  if (payloadString != null && payloadString.isNotEmpty) {
    final payload = jsonDecode(payloadString);
    if (payload['order_id'] != null) {
      // await navigatorKey.currentState?.push(
      //   MaterialPageRoute(
      //     builder: (context) => DetailOrderOnlineScreen(
      //       param1: payload['order_id'],
      //     ),
      //   ),
      // );
    }
  }
}
