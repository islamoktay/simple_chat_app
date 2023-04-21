import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:simple_chat_app/core/constants/app_content_texts.dart';
import 'package:simple_chat_app/core/dependency_injection/di.dart';
import 'package:simple_chat_app/core/utils/snack_bar/show_snack_bar.dart';
import 'package:simple_chat_app/core/utils/upload_image_util/upload_image_util.dart';
import 'package:simple_chat_app/feature/auth/domain/repo/auth_repo.dart';
import 'package:simple_chat_app/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:simple_chat_app/feature/auth/presentation/widgets/dialog_for_otp.dart';
import 'package:simple_chat_app/feature/home/domain/repo/home_repo.dart';
import 'package:simple_chat_app/feature/messages/domain/repo/messages_repo.dart';

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
          await sl<AuthBloc>().navigateAccordingToUserModel();
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
              await sl<AuthBloc>().navigateAccordingToUserModel();
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

  @override
  Future<UserCredential> googleLogin() async {
    final googleUser = await GoogleSignIn().signIn();
    final googleAuth = await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    return FirebaseAuth.instance.signInWithCredential(credential);
  }

  @override
  Future<UserCredential> facebookLogin() async {
    final loginResult = await FacebookAuth.instance.login();
    final facebookAuthCredential = FacebookAuthProvider.credential(
      loginResult.accessToken?.token ?? '',
    );
    return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }

  @override
  Future<UserCredential> appleLogin() async {
    final rawNonce = generateNonce();
    final nonce = sha256ofString(rawNonce);

    final appleCredential = await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
      nonce: nonce,
    );
    final oauthCredential = OAuthProvider('apple.com').credential(
      idToken: appleCredential.identityToken,
      rawNonce: rawNonce,
    );
    return FirebaseAuth.instance.signInWithCredential(oauthCredential);
  }

  String generateNonce([int length = 32]) {
    const charset =
        '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
    final random = Random.secure();
    return List.generate(length, (_) => charset[random.nextInt(charset.length)])
        .join();
  }

  String sha256ofString(String input) {
    final bytes = utf8.encode(input);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

  @override
  Future<void> logout() async {
    if (FirebaseAuth.instance.currentUser?.isAnonymous ?? false) {
      await FirebaseAuth.instance.currentUser?.delete();
      await sl<UploadImageUtil>().removeImage();
      await sl<HomeRepo>().deleteUserModel();
      await FirebaseAuth.instance.signOut();
      await sl<MessagesRepo>().deleteMessageDB();
    } else {
      await FirebaseAuth.instance.signOut();
    }
  }
}
