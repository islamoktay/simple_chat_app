import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:simple_chat_app/core/constants/app_content_texts.dart';
import 'package:simple_chat_app/core/dependency_injection/di.dart';
import 'package:simple_chat_app/core/router/route_management.gr.dart';
import 'package:simple_chat_app/core/utils/pick_image/pick_image_util.dart';
import 'package:simple_chat_app/core/utils/snack_bar/show_snack_bar.dart';
import 'package:simple_chat_app/core/utils/upload_image_util/upload_image_util.dart';
import 'package:simple_chat_app/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:simple_chat_app/feature/home/data/model/user_model.dart';
import 'package:simple_chat_app/feature/home/domain/repo/home_repo.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(this.homeRepo) : super(const _Initial()) {
    on<_GetUsers>(_onGetUsers);
    on<_GetUserModel>(_onGetUserModel);
    on<_ChoosePhoto>(_onChoosePhoto);
    on<_CreateUserModel>(_onCreateUserModel);
  }

  final HomeRepo homeRepo;
  final nameController = TextEditingController();
  FutureOr<void> _onGetUsers(
    _GetUsers event,
    Emitter<HomeState> emit,
  ) async {
    try {
      final users = await homeRepo.getUsers();
      emit(
        state.copyWith(
          users: users ?? [],
        ),
      );
    } on FirebaseException catch (e) {
      customSnackBar(content: e.message ?? AppContentTexts.wentWrong);
    }
  }

  FutureOr<void> _onGetUserModel(
    _GetUserModel event,
    Emitter<HomeState> emit,
  ) async {
    try {
      final user = await homeRepo.getUserModel();
      emit(
        state.copyWith(
          userModel: user,
        ),
      );
    } on FirebaseException catch (e) {
      customSnackBar(content: e.message ?? AppContentTexts.wentWrong);
    }
  }

  FutureOr<void> _onChoosePhoto(
    _ChoosePhoto event,
    Emitter<HomeState> emit,
  ) async {
    try {
      await sl<AppRouter>().pop();
      final file = await sl<PickImageUtil>().pickImage(event.imageSource);
      emit(state.copyWith(chosenPhoto: file));
    } catch (e) {
      customSnackBar(content: AppContentTexts.wentWrong);
    }
  }

  FutureOr<void> _onCreateUserModel(
    _CreateUserModel event,
    Emitter<HomeState> emit,
  ) async {
    try {
      String? photoUrl;
      if (state.chosenPhoto != null) {
        photoUrl = await sl<UploadImageUtil>().uploadImage(
          photoFile: state.chosenPhoto!,
        );
      }
      final fcmToken = await FirebaseMessaging.instance.getToken();
      final user = UserModel(
        fcmToken: fcmToken,
        name: nameController.text,
        photoUrl: photoUrl,
        uid: sl<AuthBloc>().state.uid,
      );
      await homeRepo.createUserModel(user);
      await sl<AppRouter>().replaceAll([const HomeRoute()]);
    } catch (e) {
      customSnackBar(content: AppContentTexts.wentWrong);
    }
  }
}
