import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:simple_chat_app/core/base/simple_chat_app.dart';
import 'package:simple_chat_app/core/dependency_injection/di.dart' as di;
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
