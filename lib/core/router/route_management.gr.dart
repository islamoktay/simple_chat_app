// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;

import '../../feature/auth/presentation/view/login_view.dart' as _i3;
import '../../feature/auth/presentation/view/register_view.dart' as _i2;
import '../../feature/splash/presentation/view/splash_view.dart' as _i1;

class AppRouter extends _i4.RootStackRouter {
  AppRouter([_i5.GlobalKey<_i5.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.SplashView(),
      );
    },
    RegisterRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.RegisterView(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.LoginView(),
      );
    },
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig(
          SplashRoute.name,
          path: '/splashView',
        ),
        _i4.RouteConfig(
          RegisterRoute.name,
          path: '/registerView',
        ),
        _i4.RouteConfig(
          LoginRoute.name,
          path: '/loginView',
        ),
      ];
}

/// generated route for
/// [_i1.SplashView]
class SplashRoute extends _i4.PageRouteInfo<void> {
  const SplashRoute()
      : super(
          SplashRoute.name,
          path: '/splashView',
        );

  static const String name = 'SplashRoute';
}

/// generated route for
/// [_i2.RegisterView]
class RegisterRoute extends _i4.PageRouteInfo<void> {
  const RegisterRoute()
      : super(
          RegisterRoute.name,
          path: '/registerView',
        );

  static const String name = 'RegisterRoute';
}

/// generated route for
/// [_i3.LoginView]
class LoginRoute extends _i4.PageRouteInfo<void> {
  const LoginRoute()
      : super(
          LoginRoute.name,
          path: '/loginView',
        );

  static const String name = 'LoginRoute';
}
