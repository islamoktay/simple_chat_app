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
import 'package:auto_route/auto_route.dart' as _i10;
import 'package:flutter/material.dart' as _i11;

import '../../feature/auth/presentation/view/login_view.dart' as _i3;
import '../../feature/auth/presentation/view/phone_auth_view.dart' as _i4;
import '../../feature/auth/presentation/view/register_view.dart' as _i2;
import '../../feature/discover/presentation/view/discover_view.dart' as _i8;
import '../../feature/home/data/model/user_model.dart' as _i12;
import '../../feature/home/presentation/view/create_user_view.dart' as _i5;
import '../../feature/home/presentation/view/home_view.dart' as _i7;
import '../../feature/messages/presentation/view/message_detail_view.dart'
    as _i6;
import '../../feature/messages/presentation/view/messages_view.dart' as _i9;
import '../../feature/splash/presentation/view/splash_view.dart' as _i1;

class AppRouter extends _i10.RootStackRouter {
  AppRouter([_i11.GlobalKey<_i11.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i10.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.SplashView(),
      );
    },
    RegisterRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.RegisterView(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.LoginView(),
      );
    },
    PhoneAuthRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.PhoneAuthView(),
      );
    },
    CreateUserRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.CreateUserView(),
      );
    },
    MessageDetailRoute.name: (routeData) {
      final args = routeData.argsAs<MessageDetailRouteArgs>();
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i6.MessageDetailView(
          userModel: args.userModel,
          key: args.key,
        ),
      );
    },
    HomeRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i7.HomeView(),
      );
    },
    DiscoverRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i8.DiscoverView(),
      );
    },
    MessagesRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i9.MessagesView(),
      );
    },
  };

  @override
  List<_i10.RouteConfig> get routes => [
        _i10.RouteConfig(
          SplashRoute.name,
          path: '/splashView',
        ),
        _i10.RouteConfig(
          RegisterRoute.name,
          path: '/registerView',
        ),
        _i10.RouteConfig(
          LoginRoute.name,
          path: '/loginView',
        ),
        _i10.RouteConfig(
          PhoneAuthRoute.name,
          path: '/phoneAuthView',
        ),
        _i10.RouteConfig(
          CreateUserRoute.name,
          path: '/createUserView',
        ),
        _i10.RouteConfig(
          MessageDetailRoute.name,
          path: '/messageDetailView',
        ),
        _i10.RouteConfig(
          HomeRoute.name,
          path: '/',
          children: [
            _i10.RouteConfig(
              '#redirect',
              path: '',
              parent: HomeRoute.name,
              redirectTo: 'messagesView',
              fullMatch: true,
            ),
            _i10.RouteConfig(
              DiscoverRoute.name,
              path: 'discoverView',
              parent: HomeRoute.name,
            ),
            _i10.RouteConfig(
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
class SplashRoute extends _i10.PageRouteInfo<void> {
  const SplashRoute()
      : super(
          SplashRoute.name,
          path: '/splashView',
        );

  static const String name = 'SplashRoute';
}

/// generated route for
/// [_i2.RegisterView]
class RegisterRoute extends _i10.PageRouteInfo<void> {
  const RegisterRoute()
      : super(
          RegisterRoute.name,
          path: '/registerView',
        );

  static const String name = 'RegisterRoute';
}

/// generated route for
/// [_i3.LoginView]
class LoginRoute extends _i10.PageRouteInfo<void> {
  const LoginRoute()
      : super(
          LoginRoute.name,
          path: '/loginView',
        );

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i4.PhoneAuthView]
class PhoneAuthRoute extends _i10.PageRouteInfo<void> {
  const PhoneAuthRoute()
      : super(
          PhoneAuthRoute.name,
          path: '/phoneAuthView',
        );

  static const String name = 'PhoneAuthRoute';
}

/// generated route for
/// [_i5.CreateUserView]
class CreateUserRoute extends _i10.PageRouteInfo<void> {
  const CreateUserRoute()
      : super(
          CreateUserRoute.name,
          path: '/createUserView',
        );

  static const String name = 'CreateUserRoute';
}

/// generated route for
/// [_i6.MessageDetailView]
class MessageDetailRoute extends _i10.PageRouteInfo<MessageDetailRouteArgs> {
  MessageDetailRoute({
    required _i12.UserModel userModel,
    _i11.Key? key,
  }) : super(
          MessageDetailRoute.name,
          path: '/messageDetailView',
          args: MessageDetailRouteArgs(
            userModel: userModel,
            key: key,
          ),
        );

  static const String name = 'MessageDetailRoute';
}

class MessageDetailRouteArgs {
  const MessageDetailRouteArgs({
    required this.userModel,
    this.key,
  });

  final _i12.UserModel userModel;

  final _i11.Key? key;

  @override
  String toString() {
    return 'MessageDetailRouteArgs{userModel: $userModel, key: $key}';
  }
}

/// generated route for
/// [_i7.HomeView]
class HomeRoute extends _i10.PageRouteInfo<void> {
  const HomeRoute({List<_i10.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          path: '/',
          initialChildren: children,
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i8.DiscoverView]
class DiscoverRoute extends _i10.PageRouteInfo<void> {
  const DiscoverRoute()
      : super(
          DiscoverRoute.name,
          path: 'discoverView',
        );

  static const String name = 'DiscoverRoute';
}

/// generated route for
/// [_i9.MessagesView]
class MessagesRoute extends _i10.PageRouteInfo<void> {
  const MessagesRoute()
      : super(
          MessagesRoute.name,
          path: 'messagesView',
        );

  static const String name = 'MessagesRoute';
}
