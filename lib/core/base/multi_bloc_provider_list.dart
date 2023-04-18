import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_chat_app/core/dependency_injection/di.dart';
import 'package:simple_chat_app/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:simple_chat_app/feature/home/presentation/bloc/home_bloc.dart';

List<BlocProvider> multiBlocProviderList = [
  BlocProvider.value(value: sl<AuthBloc>()),
  BlocProvider.value(value: sl<HomeBloc>()),
];
