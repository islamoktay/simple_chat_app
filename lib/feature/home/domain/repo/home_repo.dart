import 'package:simple_chat_app/feature/home/data/model/user_model.dart';

abstract class HomeRepo {
  Future<UserModel?> getUserModel();
  Future<List<UserModel>?> getUsers();
  Future<void> createUserModel(UserModel userModel);
  Future<void> deleteUserModel();
  Future<void> updateFcmToken();
}
