import 'package:get_it/get_it.dart';
import 'package:simple_chat_app/core/router/route_management.gr.dart';
import 'package:simple_chat_app/core/utils/dates/date_util.dart';
import 'package:simple_chat_app/core/utils/notifications/notifications_util.dart';
import 'package:simple_chat_app/core/utils/pick_image/pick_image_util.dart';
import 'package:simple_chat_app/core/utils/upload_image_util/upload_image_util.dart';
import 'package:simple_chat_app/feature/auth/data/repo_impl/auth_repo_impl.dart';
import 'package:simple_chat_app/feature/auth/domain/repo/auth_repo.dart';
import 'package:simple_chat_app/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:simple_chat_app/feature/home/data/repo_impl/home_repo_impl.dart';
import 'package:simple_chat_app/feature/home/domain/repo/home_repo.dart';
import 'package:simple_chat_app/feature/home/presentation/bloc/home_bloc.dart';
import 'package:simple_chat_app/feature/messages/data/repo_impl/messages_repo_impl.dart';
import 'package:simple_chat_app/feature/messages/domain/repo/messages_repo.dart';
import 'package:simple_chat_app/feature/messages/presentation/bloc/messages_bloc.dart';
import 'package:simple_chat_app/feature/splash/presentation/cubit/splash_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl
    //! Lazy Singletons
    //* Utils
    ..registerLazySingleton<AppRouter>(AppRouter.new)
    ..registerLazySingleton<PickImageUtil>(PickImageUtil.new)
    ..registerLazySingleton<UploadImageUtil>(UploadImageUtil.new)
    ..registerLazySingleton<NotificationsUtil>(NotificationsUtil.new)
    ..registerLazySingleton<DateUtil>(DateUtil.new)

    //* Repos
    ..registerLazySingleton<AuthRepo>(AuthRepoImpl.new)
    ..registerLazySingleton<HomeRepo>(HomeRepoImpl.new)
    ..registerLazySingleton<MessagesRepo>(MessagesRepoImpl.new)

    //* BLoCs
    ..registerLazySingleton<AuthBloc>(() => AuthBloc(sl(), sl()))
    ..registerLazySingleton<HomeBloc>(() => HomeBloc(sl()))
    ..registerLazySingleton<MessagesBloc>(() => MessagesBloc(sl()))

    //* Cubits
    ..registerLazySingleton<SplashCubit>(SplashCubit.new);
}
