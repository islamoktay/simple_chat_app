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
  Future<void> phoneLogin({
    required String phoneNumber,
    required BuildContext context,
  });
}
