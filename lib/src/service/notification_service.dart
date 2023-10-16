import 'dart:math';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  static final _localNotification = FlutterLocalNotificationsPlugin();
  final _service = FirebaseMessaging.instance;
  String? token;

  Future<void> requestPermission() async {
    NotificationSettings settings = await _service.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    print('User granted permission: ${settings.authorizationStatus}');
  }

  Future<void> generateToken() async {
    await _service.getToken().then((value) => token = value).onError(
      (error, stackTrace) async{
        await generateToken();
      },
    );
    print("TOOOOOKEEEEN $token");
  }

  Future<void> notificationSettings() async {
    const androidSettings = AndroidInitializationSettings(
      "@mipmap-hdpi/ic_launcher",
    );
    final iosSettings = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
      onDidReceiveLocalNotification: (id, title, body, payload) => print(""),
    );
    final settings = InitializationSettings(
      android: androidSettings,
      iOS: iosSettings,
    );
    await _localNotification.initialize(
      settings,
      onDidReceiveNotificationResponse: (details) => print(details),
    );

    FirebaseMessaging.onMessage.listen(
      (event) async {
        // print("onMessage ${event.notification?.title}");
        // print("onMessage ${event.notification?.body}");
        // print("onMessage ${event.notification?.android}");
      },
    );

    FirebaseMessaging.onMessageOpenedApp.listen((event) async {
      // print("onMessageOpenedApp ${event.notification?.title}");
      // print("onMessageOpenedApp ${event.notification?.body}");
      // print("onMessageOpenedApp ${event.notification?.android}");
    });

    FirebaseMessaging.onBackgroundMessage((event) async {
      // print("onMessageOpenedApp ${event.notification?.title}");
      // print("onMessageOpenedApp ${event.notification?.body}");
      // print("onMessageOpenedApp ${event.notification?.android}");
    });
  }

  Future<void> showNotification(RemoteMessage remoteMessage) async {
    if (remoteMessage.notification != null) {
      const androidPlatform = AndroidNotificationDetails(
        "message_channel_id",
        "Message notification_name",
        importance: Importance.max,
        priority: Priority.high,
        playSound: true,
        // sound: RawResourceAndroidNotificationSound("notification_sound"),
      );
      const platformChannelSpecifics  = NotificationDetails(
        android: androidPlatform,
        iOS: DarwinNotificationDetails()
      );
      final id = Random().nextInt((pow(2, 31) - 1).toInt());
      await _localNotification.show(id, remoteMessage.notification?.title, remoteMessage.notification?.body, platformChannelSpecifics,);
    }
  }
}
