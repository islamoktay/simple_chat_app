import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:simple_chat_app/core/dependency_injection/di.dart';
import 'package:simple_chat_app/core/router/route_management.gr.dart';

class NotificationsUtil {
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  FlutterLocalNotificationsPlugin localNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  late AndroidNotificationChannel channel;
  late NotificationSettings settings;
  Future<void> initNotificationService() async {
    await messaging.setAutoInitEnabled(true);

    settings = await requestNotificationPermission(messaging);
  }

  Future<void> listenerMethods() async {
    FirebaseMessaging.onMessage.listen((message) async {
      if (message.notification != null) {
        if (settings.authorizationStatus == AuthorizationStatus.authorized) {
          await showFlutterNotification(message);
        } else {
          await requestNotificationPermission(messaging);
        }
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen(_handleMessage);
  }

  Future<NotificationSettings> requestNotificationPermission(
    FirebaseMessaging messaging,
  ) async {
    return messaging.requestPermission();
  }

  Future<void> setupNotifications() async {
    channel = const AndroidNotificationChannel(
      'high_importance_channel', // id
      'High Importance Notifications', // title
      description:
          'This channel is used for important notifications.', // description
      importance: Importance.max,
    );

    await localNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    const initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/launcher_icon');

    const initializationSettingsIOS = DarwinInitializationSettings();

    const initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );

    await localNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (details) {},
    );
    await messaging.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
  }

  Future<void> showFlutterNotification(RemoteMessage message) async {
    final android = message.notification?.android;
    final notification = message.notification;
    if (notification != null && android != null) {
      await localNotificationsPlugin.show(
        notification.hashCode,
        notification.title,
        notification.body,
        NotificationDetails(
          android: AndroidNotificationDetails(
            channel.id,
            channel.name,
            channelDescription: channel.description,
            icon: android.smallIcon,
          ),
        ),
        // payload: message.data['payload'],
      );
    }
  }

  Future<void> setupInteractedMessage() async {
    final initialMessage = await messaging.getInitialMessage();

    if (initialMessage != null) {
      await _handleMessage(initialMessage);
    }
  }

  Future<void> _handleMessage(RemoteMessage message) async {
    await onTapNotificationDecider(message);
  }

  Future<void> onTapNotificationDecider(RemoteMessage message) async {
    FirebaseAuth.instance.authStateChanges().listen((User? user) async {
      if (user == null) {
        await sl<AppRouter>().replaceAll([const SplashRoute()]);
      } else {}
    });
  }
}
