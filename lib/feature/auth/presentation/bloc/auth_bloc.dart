import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:simple_chat_app/core/constants/app_content_texts.dart';
import 'package:simple_chat_app/core/dependency_injection/di.dart';
import 'package:simple_chat_app/core/router/route_management.gr.dart';
import 'package:simple_chat_app/core/theme/app_colors.dart';
import 'package:simple_chat_app/core/theme/custom_text_styles.dart';
import 'package:simple_chat_app/core/utils/snack_bar/show_snack_bar.dart';
import 'package:simple_chat_app/feature/auth/domain/repo/auth_repo.dart';
import 'package:simple_chat_app/feature/home/presentation/bloc/home_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(this.authRepo) : super(const _Initial()) {
    on<_EmitUser>(_onEmitUser);
    on<_RegisterEmail>(_onRegisterEmail);
    on<_SignInEmail>(_onSignInEmail);
    on<_SignInAnonymously>(_onSignInAnonymously);
    on<_SignInPhone>(_onSignInPhone);
    on<_SignInGoogle>(_onSignInGoogle);
    on<_SignInFacebook>(_onSignInFacebook);
    on<_SignInApple>(_onSignInApple);
    on<_AuthStateChanges>(_onAuthStateChanges);
    on<_Logout>(_onLogout);
  }

  final AuthRepo authRepo;

  final TextEditingController signInMailController = TextEditingController();
  final TextEditingController signInPasswordController =
      TextEditingController();
  final TextEditingController registerMailController = TextEditingController();
  final TextEditingController registerPasswordController =
      TextEditingController();
  final TextEditingController registerPasswordVerifierController =
      TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController otpController = TextEditingController();

  List<Widget> returnPersistentList({
    required String textOne,
    required String textTwo,
    required VoidCallback onTap,
  }) {
    return [
      InkWell(
        onTap: onTap,
        child: Text(
          textOne,
          style: CustomTextStyles.smallText,
        ),
      ),
      InkWell(
        onTap: onTap,
        child: Text(
          textTwo,
          style: CustomTextStyles.smallText
              .copyWith(color: AppColors.darkPurpleColor),
        ),
      ),
    ];
  }

  FutureOr<void> _onSignInAnonymously(
    _SignInAnonymously event,
    Emitter<AuthState> emit,
  ) async {
    try {
      final user = await authRepo.anonymousLogin();
      emit(
        state.copyWith(
          uid: user.user?.uid,
        ),
      );
      await navigateAccordingToUserModel();
    } on FirebaseAuthException catch (e) {
      customSnackBar(
        content: e.message ?? AppContentTexts.wentWrong,
      );
    }
  }

  FutureOr<void> _onSignInPhone(
    _SignInPhone event,
    Emitter<AuthState> emit,
  ) async {
    try {
      await authRepo.phoneLogin(
        phoneNumber: phoneNumberController.text,
        context: event.context,
      );
    } on FirebaseAuthException catch (e) {
      customSnackBar(
        content: e.message ?? AppContentTexts.wentWrong,
      );
    }
  }

  FutureOr<void> _onEmitUser(_EmitUser event, Emitter<AuthState> emit) async =>
      emit(
        state.copyWith(
          uid: event.user.user?.uid,
        ),
      );

  FutureOr<void> _onRegisterEmail(
    _RegisterEmail event,
    Emitter<AuthState> emit,
  ) async {
    try {
      final password = registerPasswordController.text;
      final passwordVerifier = registerPasswordVerifierController.text;
      if (password == passwordVerifier) {
        final user = await authRepo.registerUser(
          email: registerMailController.text,
          password: registerPasswordController.text,
        );
        emit(
          state.copyWith(
            uid: user.user?.uid,
          ),
        );
        await navigateAccordingToUserModel();
      } else {
        customSnackBar(
          content: AppContentTexts.registerPassword,
        );
      }
    } on FirebaseAuthException catch (e) {
      customSnackBar(
        content: e.message ?? AppContentTexts.wentWrong,
      );
    }
  }

  FutureOr<void> _onSignInEmail(
    _SignInEmail event,
    Emitter<AuthState> emit,
  ) async {
    try {
      final user = await authRepo.emailLogin(
        email: signInMailController.text,
        password: signInPasswordController.text,
      );
      emit(
        state.copyWith(
          uid: user.user?.uid,
        ),
      );
      await navigateAccordingToUserModel();
    } on FirebaseAuthException catch (e) {
      customSnackBar(
        content: e.message ?? AppContentTexts.wentWrong,
      );
    }
  }

  Future<FutureOr<void>> _onSignInGoogle(
    _SignInGoogle event,
    Emitter<AuthState> emit,
  ) async {
    try {
      final user = await authRepo.googleLogin();
      emit(
        state.copyWith(
          uid: user.user?.uid,
        ),
      );
      await navigateAccordingToUserModel();
    } on FirebaseAuthException catch (e) {
      customSnackBar(
        content: e.message ?? AppContentTexts.wentWrong,
      );
    }
  }

  FutureOr<void> _onSignInFacebook(
    _SignInFacebook event,
    Emitter<AuthState> emit,
  ) async {
    try {
      final user = await authRepo.facebookLogin();
      emit(
        state.copyWith(
          uid: user.user?.uid,
        ),
      );
      await navigateAccordingToUserModel();
    } on FirebaseAuthException catch (e) {
      customSnackBar(
        content: e.message ?? AppContentTexts.wentWrong,
      );
    }
  }

  FutureOr<void> _onSignInApple(
    _SignInApple event,
    Emitter<AuthState> emit,
  ) async {
    try {
      final user = await authRepo.appleLogin();
      emit(
        state.copyWith(
          uid: user.user?.uid,
        ),
      );
      await navigateAccordingToUserModel();
    } on FirebaseAuthException catch (e) {
      customSnackBar(
        content: e.message ?? AppContentTexts.wentWrong,
      );
    }
  }

  FutureOr<void> _onAuthStateChanges(
    _AuthStateChanges event,
    Emitter<AuthState> emit,
  ) async {
    FirebaseAuth.instance.authStateChanges().listen((User? user) async {
      if (user == null) {
        await sl<AppRouter>().replaceAll([const LoginRoute()]);
      } else {
        emit(
          state.copyWith(
            uid: user.uid,
          ),
        );
        await navigateAccordingToUserModel();
      }
    });
  }

  FutureOr<void> _onLogout(_Logout event, Emitter<AuthState> emit) async {
    try {
      await authRepo.logout();
      emit(const _Initial());
      await sl<AppRouter>().replaceAll([const LoginRoute()]);
    } on FirebaseAuthException catch (e) {
      customSnackBar(
        content: e.message ?? AppContentTexts.wentWrong,
      );
    }
  }

  Future<void> navigateAccordingToUserModel() async {
    sl<HomeBloc>().add(const HomeEvent.getUserModel());
    final userModel = sl<HomeBloc>().state.userModel;
    if (userModel != null) {
      await sl<AppRouter>().replaceAll([const HomeRoute()]);
    } else {
      await sl<AppRouter>().replaceAll([const CreateUserRoute()]);
    }
  }
}
