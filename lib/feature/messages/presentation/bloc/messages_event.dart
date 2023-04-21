part of 'messages_bloc.dart';

@freezed
class MessagesEvent with _$MessagesEvent {
  const factory MessagesEvent.started() = _Started;
  const factory MessagesEvent.sendMessage({required UserModel user}) =
      _SendMessage;
}
