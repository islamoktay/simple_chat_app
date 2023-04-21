import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:simple_chat_app/core/base/simple_chat_app.dart';
import 'package:simple_chat_app/core/dependency_injection/di.dart' as di;
import 'package:simple_chat_app/core/utils/notifications/notifications_util.dart';
import 'package:simple_chat_app/firebase_options.dart';

void main() async {
  await _initMethods();
  await di.sl.allReady().then((value) => runApp(const SimpleChatApp()));
}

Future<void> _initMethods() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await di.init();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
}

Future<void> _firebaseNotificationMethods() async {
  await di.sl<NotificationsUtil>().initNotificationService();
  await di.sl<NotificationsUtil>().setupNotifications();
  await di.sl<NotificationsUtil>().setupInteractedMessage();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await di.sl<NotificationsUtil>().listenerMethods();
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await di.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await _firebaseNotificationMethods();
  await di.sl<NotificationsUtil>().showFlutterNotification(message);
}
