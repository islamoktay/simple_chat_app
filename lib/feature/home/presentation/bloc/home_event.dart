part of 'home_bloc.dart';

@freezed
class HomeEvent with _$HomeEvent {
  const factory HomeEvent.started() = _Started;
  const factory HomeEvent.getUserModel() = _GetUserModel;
  const factory HomeEvent.getUsers() = _GetUsers;
  const factory HomeEvent.choosePhoto(ImageSource imageSource) = _ChoosePhoto;
  const factory HomeEvent.createUserModel() = _CreateUserModel;
}
