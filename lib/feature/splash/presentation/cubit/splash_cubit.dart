import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:simple_chat_app/core/dependency_injection/di.dart';
import 'package:simple_chat_app/core/router/route_management.gr.dart';
import 'package:simple_chat_app/core/router/router_path.dart';

part 'splash_state.dart';
part 'splash_cubit.freezed.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(const SplashState.initial());
  Future<void> appStartFunctions() async {
    await Future<void>.delayed(const Duration(seconds: 2))
        .whenComplete(() => sl<AppRouter>().pushNamed(RouterPath.loginView));
  }
}
