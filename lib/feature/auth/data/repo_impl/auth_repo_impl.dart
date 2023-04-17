import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:simple_chat_app/core/constants/app_content_texts.dart';
import 'package:simple_chat_app/core/dependency_injection/di.dart';
import 'package:simple_chat_app/core/router/route_management.gr.dart';
import 'package:simple_chat_app/core/utils/snack_bar/show_snack_bar.dart';
import 'package:simple_chat_app/feature/auth/domain/repo/auth_repo.dart';
import 'package:simple_chat_app/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:simple_chat_app/feature/auth/presentation/widgets/dialog_for_otp.dart';

class AuthRepoImpl implements AuthRepo {
  @override
  Future<UserCredential> anonymousLogin() async {
    final user = await FirebaseAuth.instance.signInAnonymously();
    return user;
  }

  @override
  Future<void> phoneLogin({
    required String phoneNumber,
    required BuildContext context,
  }) async {
    final auth = FirebaseAuth.instance;
    await auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (phoneAuthCredential) async {
        try {
          final user = await auth.signInWithCredential(phoneAuthCredential);
          sl<AuthBloc>().add(AuthEvent.emitUser(user));
          await sl<AppRouter>().replaceAll([const HomeRoute()]);
        } on FirebaseAuthException catch (e) {
          customSnackBar(content: e.message ?? AppContentTexts.wentWrong);
        }
      },
      verificationFailed: (error) {
        customSnackBar(content: error.message ?? AppContentTexts.wentWrong);
      },
      codeSent: (verificationId, forceResendingToken) async => showDialog(
        context: context,
        builder: (context) => DialogForOTP(
          onTapOk: () {
            final smsCode = sl<AuthBloc>().otpController.text.trim();
            final credential = PhoneAuthProvider.credential(
              verificationId: verificationId,
              smsCode: smsCode,
            );
            auth.signInWithCredential(credential).then((result) async {
              sl<AuthBloc>().add(AuthEvent.emitUser(result));
              await sl<AppRouter>().replaceAll([const HomeRoute()]);
            }).catchError((e) {
              customSnackBar(content: AppContentTexts.wentWrong);
            });
          },
        ),
      ),
      codeAutoRetrievalTimeout: (verificationId) {
        customSnackBar(content: AppContentTexts.wentWrong);
      },
    );
  }

  @override
  Future<UserCredential> emailLogin({
    required String email,
    required String password,
  }) async {
    final auth = FirebaseAuth.instance;
    final user = await auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return user;
  }

  @override
  Future<UserCredential> registerUser({
    required String email,
    required String password,
  }) async {
    final auth = FirebaseAuth.instance;
    final user = await auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    return user;
  }
}
