import 'dart:developer';
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:simple_chat_app/core/dependency_injection/di.dart';
import 'package:simple_chat_app/feature/auth/presentation/bloc/auth_bloc.dart';

class UploadImageUtil {
  Future<String?> uploadImage({required File photoFile}) async {
    try {
      final storageRef = FirebaseStorage.instance.ref();
      final profileRef = storageRef.child(sl<AuthBloc>().state.uid ?? '');
      final spacesRef = profileRef.child('profilePhoto');
      await spacesRef.putFile(photoFile);
      return spacesRef.getDownloadURL();
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  Future<void> removeImage() async {
    final storageRef = FirebaseStorage.instance.ref();
    final profileRef = storageRef.child(sl<AuthBloc>().state.uid ?? '');
    final spacesRef = profileRef.child('profilePhoto');
    await spacesRef.delete();
  }
}
