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
          userCredential: user,
        ),
      );
      await sl<AppRouter>().replaceAll([const HomeRoute()]);
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
      emit(state.copyWith(userCredential: event.user));

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
            userCredential: user,
          ),
        );
        await sl<AppRouter>().replaceAll([const HomeRoute()]);
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
          userCredential: user,
        ),
      );
      await sl<AppRouter>().replaceAll([const HomeRoute()]);
    } on FirebaseAuthException catch (e) {
      customSnackBar(
        content: e.message ?? AppContentTexts.wentWrong,
      );
    }
  }
}
