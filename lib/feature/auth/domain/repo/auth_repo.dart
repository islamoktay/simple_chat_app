import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

abstract class AuthRepo {
  Future<UserCredential> registerUser({
    required String email,
    required String password,
  });
  Future<UserCredential> emailLogin({
    required String email,
    required String password,
  });
  Future<UserCredential> anonymousLogin();
  Future<UserCredential> googleLogin();
  Future<UserCredential> facebookLogin();
  Future<UserCredential> appleLogin();
  Future<void> logout();
  Future<void> phoneLogin({
    required String phoneNumber,
    required BuildContext context,
  });
}
