import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:simple_chat_app/core/dependency_injection/di.dart';
import 'package:simple_chat_app/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:simple_chat_app/feature/home/data/model/user_model.dart';
import 'package:simple_chat_app/feature/home/domain/repo/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  @override
  Future<void> createUserModel(UserModel userModel) async {
    final response = FirebaseFirestore.instance.collection('userModels').doc(
          sl<AuthBloc>().state.uid,
        );
    await response.set(userModel.toJson());
  }

  @override
  Future<void> deleteUserModel() async {
    final response = FirebaseFirestore.instance.collection('userModels').doc(
          sl<AuthBloc>().state.uid,

        );
    await response.delete();
  }

  @override
  Future<void> updateFcmToken() async {
    final response = FirebaseFirestore.instance.collection('userModels').doc(
          sl<AuthBloc>().state.uid,

        );
    final fcmToken = await FirebaseMessaging.instance.getToken();
    await response.update({'fcmToken': '$fcmToken'});
  }

  @override
  Future<UserModel?> getUserModel() async {
    final response = FirebaseFirestore.instance.collection('userModels').doc(
          sl<AuthBloc>().state.uid,

        );
    final responseDoc = await response.get();
    if (responseDoc.exists) {
      final responseData = responseDoc.data();
      return UserModel.fromJson(responseData!);
    } else {
      return null;
    }
  }

  @override
  Future<List<UserModel>?> getUsers() async {
    final response = FirebaseFirestore.instance.collection('userModels');
    final responseData = await response.get();
    final list = responseData.docs;
    final userList = <UserModel>[];
    for (final element in list) {
      userList.add(UserModel.fromJson(element.data()));
    }
    userList.removeWhere((element) =>
        element.uid ==           sl<AuthBloc>().state.uid,
);
    return userList;
  }
}
