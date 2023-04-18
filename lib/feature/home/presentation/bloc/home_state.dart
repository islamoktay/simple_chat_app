part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial({
    UserModel? userModel,
    @Default(<UserModel>[]) List<UserModel> users,
    File? chosenPhoto,
  }) = _Initial;
}
