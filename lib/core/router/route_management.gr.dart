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
import 'package:auto_route/auto_route.dart' as _i8;
import 'package:flutter/material.dart' as _i9;

import '../../feature/auth/presentation/view/login_view.dart' as _i3;
import '../../feature/auth/presentation/view/phone_auth_view.dart' as _i4;
import '../../feature/auth/presentation/view/register_view.dart' as _i2;
import '../../feature/discover/presentation/view/discover_view.dart' as _i6;
import '../../feature/home/presentation/view/home_view.dart' as _i5;
import '../../feature/messages/presentation/view/messages_view.dart' as _i7;
import '../../feature/splash/presentation/view/splash_view.dart' as _i1;

class AppRouter extends _i8.RootStackRouter {
  AppRouter([_i9.GlobalKey<_i9.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i8.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.SplashView(),
      );
    },
    RegisterRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.RegisterView(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.LoginView(),
      );
    },
    PhoneAuthRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.PhoneAuthView(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.HomeView(),
      );
    },
    DiscoverRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i6.DiscoverView(),
      );
    },
    MessagesRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i7.MessagesView(),
      );
    },
  };

  @override
  List<_i8.RouteConfig> get routes => [
        _i8.RouteConfig(
          SplashRoute.name,
          path: '/splashView',
        ),
        _i8.RouteConfig(
          RegisterRoute.name,
          path: '/registerView',
        ),
        _i8.RouteConfig(
          LoginRoute.name,
          path: '/loginView',
        ),
        _i8.RouteConfig(
          PhoneAuthRoute.name,
          path: '/phoneAuthView',
        ),
        _i8.RouteConfig(
          HomeRoute.name,
          path: '/',
          children: [
            _i8.RouteConfig(
              '#redirect',
              path: '',
              parent: HomeRoute.name,
              redirectTo: 'messagesView',
              fullMatch: true,
            ),
            _i8.RouteConfig(
              DiscoverRoute.name,
              path: 'discoverView',
              parent: HomeRoute.name,
            ),
            _i8.RouteConfig(
              MessagesRoute.name,
              path: 'messagesView',
              parent: HomeRoute.name,
            ),
          ],
        ),
      ];
}

/// generated route for
/// [_i1.SplashView]
class SplashRoute extends _i8.PageRouteInfo<void> {
  const SplashRoute()
      : super(
          SplashRoute.name,
          path: '/splashView',
        );

  static const String name = 'SplashRoute';
}

/// generated route for
/// [_i2.RegisterView]
class RegisterRoute extends _i8.PageRouteInfo<void> {
  const RegisterRoute()
      : super(
          RegisterRoute.name,
          path: '/registerView',
        );

  static const String name = 'RegisterRoute';
}

/// generated route for
/// [_i3.LoginView]
class LoginRoute extends _i8.PageRouteInfo<void> {
  const LoginRoute()
      : super(
          LoginRoute.name,
          path: '/loginView',
        );

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i4.PhoneAuthView]
class PhoneAuthRoute extends _i8.PageRouteInfo<void> {
  const PhoneAuthRoute()
      : super(
          PhoneAuthRoute.name,
          path: '/phoneAuthView',
        );

  static const String name = 'PhoneAuthRoute';
}

/// generated route for
/// [_i5.HomeView]
class HomeRoute extends _i8.PageRouteInfo<void> {
  const HomeRoute({List<_i8.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          path: '/',
          initialChildren: children,
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i6.DiscoverView]
class DiscoverRoute extends _i8.PageRouteInfo<void> {
  const DiscoverRoute()
      : super(
          DiscoverRoute.name,
          path: 'discoverView',
        );

  static const String name = 'DiscoverRoute';
}

/// generated route for
/// [_i7.MessagesView]
class MessagesRoute extends _i8.PageRouteInfo<void> {
  const MessagesRoute()
      : super(
          MessagesRoute.name,
          path: 'messagesView',
        );

  static const String name = 'MessagesRoute';
}
