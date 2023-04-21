import 'package:auto_route/auto_route.dart';
import 'package:simple_chat_app/core/router/router_path.dart';
import 'package:simple_chat_app/feature/auth/presentation/view/login_view.dart';
import 'package:simple_chat_app/feature/auth/presentation/view/phone_auth_view.dart';
import 'package:simple_chat_app/feature/auth/presentation/view/register_view.dart';
import 'package:simple_chat_app/feature/discover/presentation/view/discover_view.dart';
import 'package:simple_chat_app/feature/home/presentation/view/create_user_view.dart';
import 'package:simple_chat_app/feature/home/presentation/view/home_view.dart';
import 'package:simple_chat_app/feature/messages/presentation/view/message_detail_view.dart';
import 'package:simple_chat_app/feature/messages/presentation/view/messages_view.dart';
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
    AutoRoute(
      path: RouterPath.phoneAuthView,
      page: PhoneAuthView,
    ),
    AutoRoute(
      path: RouterPath.createUserView,
      page: CreateUserView,
    ),
    AutoRoute(
      path: RouterPath.messageDetailView,
      page: MessageDetailView,
    ),
    AutoRoute(
      path: RouterPath.homeView,
      page: HomeView,
      children: [
        AutoRoute(
          path: RouterPath.discoverView,
          page: DiscoverView,
        ),
        AutoRoute(
          path: RouterPath.messagesView,
          page: MessagesView,
          initial: true,
        ),
      ],
    ),
  ],
)
class $AppRouter {}
