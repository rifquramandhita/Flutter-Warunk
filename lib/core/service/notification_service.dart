import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:warunk/app/features/customer/presentation/detail_order/customer_detail_order_screen.dart';
import 'package:warunk/app/features/customer/presentation/product/customer_product_screen.dart';
import 'package:warunk/app/features/merchant/presentation/balance_history/merchant_balance_history_screen.dart';
import 'package:warunk/app/features/merchant/presentation/detail_order/merchant_detail_order_screen.dart';
import 'package:warunk/app/features/merchant/presentation/input_product/merchant_input_product_screen.dart';
import 'package:warunk/core/constants/constant.dart';
import 'package:warunk/core/entity/notification.dart';
import 'package:warunk/core/enum/role.dart';
import 'package:warunk/core/helper/shared_preferences_helper.dart';
import 'package:warunk/main.dart';
import 'package:warunk/core/enum/notification_model_type.dart';
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

    final AndroidFlutterLocalNotificationsPlugin? androidPlatform =
        flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>();
    if (androidPlatform != null) {
      const AndroidNotificationChannel channel = AndroidNotificationChannel(
        'warunk_custom_channel',
        'Warunk Notification',
        description: 'This channel is used for important notifications.',
        importance: Importance.max,
        sound: RawResourceAndroidNotificationSound('notification'),
      );
      await androidPlatform.createNotificationChannel(channel);
    }

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
          notificationDetails: const NotificationDetails(
            android: AndroidNotificationDetails(
              'warunk_custom_channel',
              'Warunk Notification',
              icon: '@drawable/ic_notification',
              sound: RawResourceAndroidNotificationSound('notification'),
              importance: Importance.max,
              priority: Priority.high,
            ),
            iOS: DarwinNotificationDetails(
              sound: 'notification.mp3',
              presentSound: true,
            ),
          ),
          payload: jsonEncode(message.data),
        );
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('Pesan diklik dari background: ${message.data}');
      try {
        final notification = NotificationEntity.fromJson(message.data);

        _handleOpenNotification(notification);
      } catch (e) {
        debugPrint('Error parsing notification data: $e');
      }
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
    try {
      final payload = jsonDecode(payloadString);
      final notification = NotificationEntity.fromJson(payload);

      _handleOpenNotification(notification);
    } catch (e) {
      debugPrint('Error parsing notification payload: $e');
    }
  }
}

void _handleOpenNotification(NotificationEntity notification) async {
  final role = RoleEnum.fromString(
    await SharedPreferencesHelper.getString(PREF_ROLE),
  );
  switch (notification.modelType) {
    case null:
      break;
    case NotificationModelType.order:
      final id = notification.modelId ?? '';
      navigatorKey.currentState?.push(
        MaterialPageRoute(
          builder: (context) => (role == RoleEnum.customer)
              ? CustomerDetailOrderScreen(orderId: id)
              : MerchantDetailOrderScreen(orderId: id),
        ),
      );
    case NotificationModelType.product:
      final id = notification.modelId ?? '';
      navigatorKey.currentState?.push(
        MaterialPageRoute(
          builder: (context) => (role == RoleEnum.customer)
              ? CustomerProductScreen(productId: id)
              : MerchantInputProductScreen(id: id),
        ),
      );
    case NotificationModelType.merchant:
      break;
    case NotificationModelType.promotion:
      break;
    case NotificationModelType.merchantBalanceHistory:
      navigatorKey.currentState?.push(
        MaterialPageRoute(builder: (context) => MerchantBalanceHistoryScreen()),
      );
      break;
    case NotificationModelType.unknown:
      break;
  }
}
