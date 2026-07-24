import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:warunk/app/features/customer/presentation/cart/customer_cart_screen.dart';
import 'package:warunk/app/features/customer/presentation/chat/customer_chat_webview_screen.dart';
import 'package:warunk/app/features/customer/presentation/detail_order/customer_detail_order_screen.dart';
import 'package:warunk/app/features/customer/presentation/product/customer_product_screen.dart';
import 'package:warunk/app/features/customer/presentation/wishlist/customer_wishlist_screen.dart';
import 'package:warunk/app/features/merchant/presentation/balance_history/merchant_balance_history_screen.dart';
import 'package:warunk/app/features/merchant/presentation/chat/merchant_chat_webview_screen.dart';
import 'package:warunk/app/features/merchant/presentation/detail_order/merchant_detail_order_screen.dart';
import 'package:warunk/app/features/merchant/presentation/input_product/merchant_input_product_screen.dart';
import 'package:warunk/app/features/merchant/presentation/promotion/merchant_promotion_screen.dart';
import 'package:warunk/core/constants/constant.dart';
import 'package:warunk/core/entity/notification.dart';
import 'package:warunk/core/enum/role.dart';
import 'package:warunk/core/helper/shared_preferences_helper.dart';
import 'package:warunk/main.dart';
import 'package:warunk/core/enum/notification_indicator_entity.dart';
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
        flutterLocalNotificationsPlugin
            .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin
            >();
    if (androidPlatform != null) {
      const AndroidNotificationChannel channel = AndroidNotificationChannel(
        'warunk_custom_channel',
        'Warunk Notification',
        description: 'This channel is used for important notifications.',
        importance: Importance.max,
        sound: RawResourceAndroidNotificationSound('notification'),
      );
      await androidPlatform.createNotificationChannel(channel);

      const AndroidNotificationChannel orderChannel =
          AndroidNotificationChannel(
            'warunk_order_channel',
            'Warunk Order Notification',
            description: 'This channel is used for new order notifications.',
            importance: Importance.max,
            sound: RawResourceAndroidNotificationSound(
              'notification_new_order',
            ),
          );
      await androidPlatform.createNotificationChannel(orderChannel);

      const AndroidNotificationChannel chatChannel = AndroidNotificationChannel(
        'warunk_chat_channel',
        'Warunk Chat Notification',
        description: 'This channel is used for new chat messages.',
        importance: Importance.max,
        sound: RawResourceAndroidNotificationSound('notification_chat'),
      );
      await androidPlatform.createNotificationChannel(chatChannel);
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
        NotificationEntity? entity;
        try {
          entity = NotificationEntity.fromJson(message.data);
        } catch (e) {
          debugPrint('Error parsing notification data for sound: $e');
        }

        String channelId = 'warunk_custom_channel';
        String channelName = 'Warunk Notification';
        String androidSound = 'notification';
        String iosSound = 'notification.mp3';

        if (entity?.indicator == NotificationIndicatorEntity.merchantNewOrder) {
          channelId = 'warunk_order_channel';
          channelName = 'Warunk Order Notification';
          androidSound = 'notification_new_order';
          iosSound = 'notification_new_order.mp3';
        } else if (entity?.indicator ==
                NotificationIndicatorEntity.userIncomingChat ||
            entity?.indicator ==
                NotificationIndicatorEntity.merchantIncomingChat) {
          channelId = 'warunk_chat_channel';
          channelName = 'Warunk Chat Notification';
          androidSound = 'notification_chat';
          iosSound = 'notification_chat.mp3';
        }

        flutterLocalNotificationsPlugin.show(
          id: notification.hashCode,
          title: notification.title,
          body: notification.body,
          notificationDetails: NotificationDetails(
            android: AndroidNotificationDetails(
              channelId,
              channelName,
              icon: '@drawable/ic_notification',
              sound: RawResourceAndroidNotificationSound(androidSound),
              importance: Importance.max,
              priority: Priority.high,
            ),
            iOS: DarwinNotificationDetails(sound: iosSound, presentSound: true),
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
  switch (notification.indicator) {
    case null:
      break;
    case NotificationIndicatorEntity.userOrderStatus:
      final id = notification.modelId ?? '';
      navigatorKey.currentState?.push(
        MaterialPageRoute(
          builder: (context) => CustomerDetailOrderScreen(orderId: id),
        ),
      );
    case NotificationIndicatorEntity.merchantNewOrder:
      final id = notification.modelId ?? '';
      navigatorKey.currentState?.push(
        MaterialPageRoute(
          builder: (context) => MerchantDetailOrderScreen(orderId: id),
        ),
      );
    case NotificationIndicatorEntity.userCartRestock:
      navigatorKey.currentState?.push(
        MaterialPageRoute(builder: (context) => CustomerCartScreen()),
      );
    case NotificationIndicatorEntity.userWishlistRestock:
      navigatorKey.currentState?.push(
        MaterialPageRoute(builder: (context) => CustomerWishlistScreen()),
      );
    case NotificationIndicatorEntity.userCartOutOfStock:
      navigatorKey.currentState?.push(
        MaterialPageRoute(builder: (context) => CustomerCartScreen()),
      );
    case NotificationIndicatorEntity.userWishlistOutOfStock:
      navigatorKey.currentState?.push(
        MaterialPageRoute(builder: (context) => CustomerWishlistScreen()),
      );
    case NotificationIndicatorEntity.userProductPromotion:
      final id = notification.modelId ?? '';
      navigatorKey.currentState?.push(
        MaterialPageRoute(
          builder: (context) => CustomerProductScreen(productId: id),
        ),
      );
    case NotificationIndicatorEntity.merchantLowBalance:
    case NotificationIndicatorEntity.merchantTopUpSuccess:
      navigatorKey.currentState?.push(
        MaterialPageRoute(builder: (context) => MerchantBalanceHistoryScreen()),
      );
      break;
    case NotificationIndicatorEntity.userIncomingChat:
      navigatorKey.currentState?.push(
        MaterialPageRoute(builder: (context) => CustomerChatWebviewScreen()),
      );
      break;
    case NotificationIndicatorEntity.merchantIncomingChat:
      navigatorKey.currentState?.push(
        MaterialPageRoute(builder: (context) => MerchantChatWebViewScreen()),
      );
      break;
    case NotificationIndicatorEntity.merchantPromoInvitation:
      navigatorKey.currentState?.push(
        MaterialPageRoute(builder: (context) => MerchantPromotionScreen()),
      );
      break;
    case NotificationIndicatorEntity.userNationalPromotion:
    case NotificationIndicatorEntity.userCheckoutAvailable:
    case NotificationIndicatorEntity.merchantCheckoutBlocked:
    case NotificationIndicatorEntity.merchantSuspended:
    case NotificationIndicatorEntity.unknown:
      break;
  }
}
