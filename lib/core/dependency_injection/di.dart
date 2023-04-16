import 'package:get_it/get_it.dart';
import 'package:simple_chat_app/core/router/route_management.gr.dart';
import 'package:simple_chat_app/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:simple_chat_app/feature/splash/presentation/cubit/splash_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl
    //! Lazy Singletons
    //* Utils
    ..registerLazySingleton<AppRouter>(AppRouter.new)

    //* Repos

    //* BLoCs
    ..registerLazySingleton<AuthBloc>(AuthBloc.new)

    //* Cubits
    ..registerLazySingleton<SplashCubit>(SplashCubit.new);
}
