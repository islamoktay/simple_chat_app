import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_chat_app/core/dependency_injection/di.dart';
import 'package:simple_chat_app/core/router/route_management.gr.dart';
import 'package:simple_chat_app/core/utils/snack_bar/global_variable.dart';

class SimpleChatApp extends StatelessWidget {
  const SimpleChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, _) {
        return MaterialApp.router(
          title: 'Simple Chat App',
          debugShowCheckedModeBanner: false,
          routerDelegate: sl<AppRouter>().delegate(
            initialRoutes: [
              const SplashRoute(),
            ],
          ),
          routeInformationParser: sl<AppRouter>().defaultRouteParser(),
          scaffoldMessengerKey: GlobalVariable.scaffoldMessengerKey,
        );
      },
    );
  }
}
