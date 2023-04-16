import 'package:auto_route/auto_route.dart';
import 'package:simple_chat_app/core/router/router_path.dart';
import 'package:simple_chat_app/feature/auth/presentation/view/login_view.dart';
import 'package:simple_chat_app/feature/auth/presentation/view/register_view.dart';
import 'package:simple_chat_app/feature/splash/presentation/view/splash_view.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'View,Route',
  routes: <AutoRoute>[
    AutoRoute(
      path: RouterPath.splashView,
      page: SplashView,
    ),
    AutoRoute(
      path: RouterPath.registerView,
      page: RegisterView,
    ),
    AutoRoute(
      path: RouterPath.loginView,
      page: LoginView,
    ),
  ],
)
class $AppRouter {}
