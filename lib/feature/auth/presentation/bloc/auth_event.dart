part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.started() = _Started;
  const factory AuthEvent.emitUser(UserCredential user) = _EmitUser;
  const factory AuthEvent.registerEmail() = _RegisterEmail;
  const factory AuthEvent.signInEmail() = _SignInEmail;
  const factory AuthEvent.signInAnonymously() = _SignInAnonymously;
  const factory AuthEvent.signInPhone({
    required BuildContext context,
  }) = _SignInPhone;
}
