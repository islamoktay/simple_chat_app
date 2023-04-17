// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AuthEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(UserCredential user) emitUser,
    required TResult Function() registerEmail,
    required TResult Function() signInEmail,
    required TResult Function() signInAnonymously,
    required TResult Function(BuildContext context) signInPhone,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(UserCredential user)? emitUser,
    TResult? Function()? registerEmail,
    TResult? Function()? signInEmail,
    TResult? Function()? signInAnonymously,
    TResult? Function(BuildContext context)? signInPhone,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(UserCredential user)? emitUser,
    TResult Function()? registerEmail,
    TResult Function()? signInEmail,
    TResult Function()? signInAnonymously,
    TResult Function(BuildContext context)? signInPhone,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_EmitUser value) emitUser,
    required TResult Function(_RegisterEmail value) registerEmail,
    required TResult Function(_SignInEmail value) signInEmail,
    required TResult Function(_SignInAnonymously value) signInAnonymously,
    required TResult Function(_SignInPhone value) signInPhone,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_EmitUser value)? emitUser,
    TResult? Function(_RegisterEmail value)? registerEmail,
    TResult? Function(_SignInEmail value)? signInEmail,
    TResult? Function(_SignInAnonymously value)? signInAnonymously,
    TResult? Function(_SignInPhone value)? signInPhone,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_EmitUser value)? emitUser,
    TResult Function(_RegisterEmail value)? registerEmail,
    TResult Function(_SignInEmail value)? signInEmail,
    TResult Function(_SignInAnonymously value)? signInAnonymously,
    TResult Function(_SignInPhone value)? signInPhone,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthEventCopyWith<$Res> {
  factory $AuthEventCopyWith(AuthEvent value, $Res Function(AuthEvent) then) =
      _$AuthEventCopyWithImpl<$Res, AuthEvent>;
}

/// @nodoc
class _$AuthEventCopyWithImpl<$Res, $Val extends AuthEvent>
    implements $AuthEventCopyWith<$Res> {
  _$AuthEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_StartedCopyWith<$Res> {
  factory _$$_StartedCopyWith(
          _$_Started value, $Res Function(_$_Started) then) =
      __$$_StartedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_StartedCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$_Started>
    implements _$$_StartedCopyWith<$Res> {
  __$$_StartedCopyWithImpl(_$_Started _value, $Res Function(_$_Started) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Started implements _Started {
  const _$_Started();

  @override
  String toString() {
    return 'AuthEvent.started()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Started);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(UserCredential user) emitUser,
    required TResult Function() registerEmail,
    required TResult Function() signInEmail,
    required TResult Function() signInAnonymously,
    required TResult Function(BuildContext context) signInPhone,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(UserCredential user)? emitUser,
    TResult? Function()? registerEmail,
    TResult? Function()? signInEmail,
    TResult? Function()? signInAnonymously,
    TResult? Function(BuildContext context)? signInPhone,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(UserCredential user)? emitUser,
    TResult Function()? registerEmail,
    TResult Function()? signInEmail,
    TResult Function()? signInAnonymously,
    TResult Function(BuildContext context)? signInPhone,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_EmitUser value) emitUser,
    required TResult Function(_RegisterEmail value) registerEmail,
    required TResult Function(_SignInEmail value) signInEmail,
    required TResult Function(_SignInAnonymously value) signInAnonymously,
    required TResult Function(_SignInPhone value) signInPhone,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_EmitUser value)? emitUser,
    TResult? Function(_RegisterEmail value)? registerEmail,
    TResult? Function(_SignInEmail value)? signInEmail,
    TResult? Function(_SignInAnonymously value)? signInAnonymously,
    TResult? Function(_SignInPhone value)? signInPhone,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_EmitUser value)? emitUser,
    TResult Function(_RegisterEmail value)? registerEmail,
    TResult Function(_SignInEmail value)? signInEmail,
    TResult Function(_SignInAnonymously value)? signInAnonymously,
    TResult Function(_SignInPhone value)? signInPhone,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements AuthEvent {
  const factory _Started() = _$_Started;
}

/// @nodoc
abstract class _$$_EmitUserCopyWith<$Res> {
  factory _$$_EmitUserCopyWith(
          _$_EmitUser value, $Res Function(_$_EmitUser) then) =
      __$$_EmitUserCopyWithImpl<$Res>;
  @useResult
  $Res call({UserCredential user});
}

/// @nodoc
class __$$_EmitUserCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$_EmitUser>
    implements _$$_EmitUserCopyWith<$Res> {
  __$$_EmitUserCopyWithImpl(
      _$_EmitUser _value, $Res Function(_$_EmitUser) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
  }) {
    return _then(_$_EmitUser(
      null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserCredential,
    ));
  }
}

/// @nodoc

class _$_EmitUser implements _EmitUser {
  const _$_EmitUser(this.user);

  @override
  final UserCredential user;

  @override
  String toString() {
    return 'AuthEvent.emitUser(user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EmitUser &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EmitUserCopyWith<_$_EmitUser> get copyWith =>
      __$$_EmitUserCopyWithImpl<_$_EmitUser>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(UserCredential user) emitUser,
    required TResult Function() registerEmail,
    required TResult Function() signInEmail,
    required TResult Function() signInAnonymously,
    required TResult Function(BuildContext context) signInPhone,
  }) {
    return emitUser(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(UserCredential user)? emitUser,
    TResult? Function()? registerEmail,
    TResult? Function()? signInEmail,
    TResult? Function()? signInAnonymously,
    TResult? Function(BuildContext context)? signInPhone,
  }) {
    return emitUser?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(UserCredential user)? emitUser,
    TResult Function()? registerEmail,
    TResult Function()? signInEmail,
    TResult Function()? signInAnonymously,
    TResult Function(BuildContext context)? signInPhone,
    required TResult orElse(),
  }) {
    if (emitUser != null) {
      return emitUser(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_EmitUser value) emitUser,
    required TResult Function(_RegisterEmail value) registerEmail,
    required TResult Function(_SignInEmail value) signInEmail,
    required TResult Function(_SignInAnonymously value) signInAnonymously,
    required TResult Function(_SignInPhone value) signInPhone,
  }) {
    return emitUser(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_EmitUser value)? emitUser,
    TResult? Function(_RegisterEmail value)? registerEmail,
    TResult? Function(_SignInEmail value)? signInEmail,
    TResult? Function(_SignInAnonymously value)? signInAnonymously,
    TResult? Function(_SignInPhone value)? signInPhone,
  }) {
    return emitUser?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_EmitUser value)? emitUser,
    TResult Function(_RegisterEmail value)? registerEmail,
    TResult Function(_SignInEmail value)? signInEmail,
    TResult Function(_SignInAnonymously value)? signInAnonymously,
    TResult Function(_SignInPhone value)? signInPhone,
    required TResult orElse(),
  }) {
    if (emitUser != null) {
      return emitUser(this);
    }
    return orElse();
  }
}

abstract class _EmitUser implements AuthEvent {
  const factory _EmitUser(final UserCredential user) = _$_EmitUser;

  UserCredential get user;
  @JsonKey(ignore: true)
  _$$_EmitUserCopyWith<_$_EmitUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_RegisterEmailCopyWith<$Res> {
  factory _$$_RegisterEmailCopyWith(
          _$_RegisterEmail value, $Res Function(_$_RegisterEmail) then) =
      __$$_RegisterEmailCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_RegisterEmailCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$_RegisterEmail>
    implements _$$_RegisterEmailCopyWith<$Res> {
  __$$_RegisterEmailCopyWithImpl(
      _$_RegisterEmail _value, $Res Function(_$_RegisterEmail) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_RegisterEmail implements _RegisterEmail {
  const _$_RegisterEmail();

  @override
  String toString() {
    return 'AuthEvent.registerEmail()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_RegisterEmail);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(UserCredential user) emitUser,
    required TResult Function() registerEmail,
    required TResult Function() signInEmail,
    required TResult Function() signInAnonymously,
    required TResult Function(BuildContext context) signInPhone,
  }) {
    return registerEmail();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(UserCredential user)? emitUser,
    TResult? Function()? registerEmail,
    TResult? Function()? signInEmail,
    TResult? Function()? signInAnonymously,
    TResult? Function(BuildContext context)? signInPhone,
  }) {
    return registerEmail?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(UserCredential user)? emitUser,
    TResult Function()? registerEmail,
    TResult Function()? signInEmail,
    TResult Function()? signInAnonymously,
    TResult Function(BuildContext context)? signInPhone,
    required TResult orElse(),
  }) {
    if (registerEmail != null) {
      return registerEmail();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_EmitUser value) emitUser,
    required TResult Function(_RegisterEmail value) registerEmail,
    required TResult Function(_SignInEmail value) signInEmail,
    required TResult Function(_SignInAnonymously value) signInAnonymously,
    required TResult Function(_SignInPhone value) signInPhone,
  }) {
    return registerEmail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_EmitUser value)? emitUser,
    TResult? Function(_RegisterEmail value)? registerEmail,
    TResult? Function(_SignInEmail value)? signInEmail,
    TResult? Function(_SignInAnonymously value)? signInAnonymously,
    TResult? Function(_SignInPhone value)? signInPhone,
  }) {
    return registerEmail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_EmitUser value)? emitUser,
    TResult Function(_RegisterEmail value)? registerEmail,
    TResult Function(_SignInEmail value)? signInEmail,
    TResult Function(_SignInAnonymously value)? signInAnonymously,
    TResult Function(_SignInPhone value)? signInPhone,
    required TResult orElse(),
  }) {
    if (registerEmail != null) {
      return registerEmail(this);
    }
    return orElse();
  }
}

abstract class _RegisterEmail implements AuthEvent {
  const factory _RegisterEmail() = _$_RegisterEmail;
}

/// @nodoc
abstract class _$$_SignInEmailCopyWith<$Res> {
  factory _$$_SignInEmailCopyWith(
          _$_SignInEmail value, $Res Function(_$_SignInEmail) then) =
      __$$_SignInEmailCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_SignInEmailCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$_SignInEmail>
    implements _$$_SignInEmailCopyWith<$Res> {
  __$$_SignInEmailCopyWithImpl(
      _$_SignInEmail _value, $Res Function(_$_SignInEmail) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_SignInEmail implements _SignInEmail {
  const _$_SignInEmail();

  @override
  String toString() {
    return 'AuthEvent.signInEmail()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_SignInEmail);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(UserCredential user) emitUser,
    required TResult Function() registerEmail,
    required TResult Function() signInEmail,
    required TResult Function() signInAnonymously,
    required TResult Function(BuildContext context) signInPhone,
  }) {
    return signInEmail();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(UserCredential user)? emitUser,
    TResult? Function()? registerEmail,
    TResult? Function()? signInEmail,
    TResult? Function()? signInAnonymously,
    TResult? Function(BuildContext context)? signInPhone,
  }) {
    return signInEmail?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(UserCredential user)? emitUser,
    TResult Function()? registerEmail,
    TResult Function()? signInEmail,
    TResult Function()? signInAnonymously,
    TResult Function(BuildContext context)? signInPhone,
    required TResult orElse(),
  }) {
    if (signInEmail != null) {
      return signInEmail();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_EmitUser value) emitUser,
    required TResult Function(_RegisterEmail value) registerEmail,
    required TResult Function(_SignInEmail value) signInEmail,
    required TResult Function(_SignInAnonymously value) signInAnonymously,
    required TResult Function(_SignInPhone value) signInPhone,
  }) {
    return signInEmail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_EmitUser value)? emitUser,
    TResult? Function(_RegisterEmail value)? registerEmail,
    TResult? Function(_SignInEmail value)? signInEmail,
    TResult? Function(_SignInAnonymously value)? signInAnonymously,
    TResult? Function(_SignInPhone value)? signInPhone,
  }) {
    return signInEmail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_EmitUser value)? emitUser,
    TResult Function(_RegisterEmail value)? registerEmail,
    TResult Function(_SignInEmail value)? signInEmail,
    TResult Function(_SignInAnonymously value)? signInAnonymously,
    TResult Function(_SignInPhone value)? signInPhone,
    required TResult orElse(),
  }) {
    if (signInEmail != null) {
      return signInEmail(this);
    }
    return orElse();
  }
}

abstract class _SignInEmail implements AuthEvent {
  const factory _SignInEmail() = _$_SignInEmail;
}

/// @nodoc
abstract class _$$_SignInAnonymouslyCopyWith<$Res> {
  factory _$$_SignInAnonymouslyCopyWith(_$_SignInAnonymously value,
          $Res Function(_$_SignInAnonymously) then) =
      __$$_SignInAnonymouslyCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_SignInAnonymouslyCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$_SignInAnonymously>
    implements _$$_SignInAnonymouslyCopyWith<$Res> {
  __$$_SignInAnonymouslyCopyWithImpl(
      _$_SignInAnonymously _value, $Res Function(_$_SignInAnonymously) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_SignInAnonymously implements _SignInAnonymously {
  const _$_SignInAnonymously();

  @override
  String toString() {
    return 'AuthEvent.signInAnonymously()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_SignInAnonymously);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(UserCredential user) emitUser,
    required TResult Function() registerEmail,
    required TResult Function() signInEmail,
    required TResult Function() signInAnonymously,
    required TResult Function(BuildContext context) signInPhone,
  }) {
    return signInAnonymously();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(UserCredential user)? emitUser,
    TResult? Function()? registerEmail,
    TResult? Function()? signInEmail,
    TResult? Function()? signInAnonymously,
    TResult? Function(BuildContext context)? signInPhone,
  }) {
    return signInAnonymously?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(UserCredential user)? emitUser,
    TResult Function()? registerEmail,
    TResult Function()? signInEmail,
    TResult Function()? signInAnonymously,
    TResult Function(BuildContext context)? signInPhone,
    required TResult orElse(),
  }) {
    if (signInAnonymously != null) {
      return signInAnonymously();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_EmitUser value) emitUser,
    required TResult Function(_RegisterEmail value) registerEmail,
    required TResult Function(_SignInEmail value) signInEmail,
    required TResult Function(_SignInAnonymously value) signInAnonymously,
    required TResult Function(_SignInPhone value) signInPhone,
  }) {
    return signInAnonymously(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_EmitUser value)? emitUser,
    TResult? Function(_RegisterEmail value)? registerEmail,
    TResult? Function(_SignInEmail value)? signInEmail,
    TResult? Function(_SignInAnonymously value)? signInAnonymously,
    TResult? Function(_SignInPhone value)? signInPhone,
  }) {
    return signInAnonymously?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_EmitUser value)? emitUser,
    TResult Function(_RegisterEmail value)? registerEmail,
    TResult Function(_SignInEmail value)? signInEmail,
    TResult Function(_SignInAnonymously value)? signInAnonymously,
    TResult Function(_SignInPhone value)? signInPhone,
    required TResult orElse(),
  }) {
    if (signInAnonymously != null) {
      return signInAnonymously(this);
    }
    return orElse();
  }
}

abstract class _SignInAnonymously implements AuthEvent {
  const factory _SignInAnonymously() = _$_SignInAnonymously;
}

/// @nodoc
abstract class _$$_SignInPhoneCopyWith<$Res> {
  factory _$$_SignInPhoneCopyWith(
          _$_SignInPhone value, $Res Function(_$_SignInPhone) then) =
      __$$_SignInPhoneCopyWithImpl<$Res>;
  @useResult
  $Res call({BuildContext context});
}

/// @nodoc
class __$$_SignInPhoneCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$_SignInPhone>
    implements _$$_SignInPhoneCopyWith<$Res> {
  __$$_SignInPhoneCopyWithImpl(
      _$_SignInPhone _value, $Res Function(_$_SignInPhone) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? context = null,
  }) {
    return _then(_$_SignInPhone(
      context: null == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
    ));
  }
}

/// @nodoc

class _$_SignInPhone implements _SignInPhone {
  const _$_SignInPhone({required this.context});

  @override
  final BuildContext context;

  @override
  String toString() {
    return 'AuthEvent.signInPhone(context: $context)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SignInPhone &&
            (identical(other.context, context) || other.context == context));
  }

  @override
  int get hashCode => Object.hash(runtimeType, context);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SignInPhoneCopyWith<_$_SignInPhone> get copyWith =>
      __$$_SignInPhoneCopyWithImpl<_$_SignInPhone>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(UserCredential user) emitUser,
    required TResult Function() registerEmail,
    required TResult Function() signInEmail,
    required TResult Function() signInAnonymously,
    required TResult Function(BuildContext context) signInPhone,
  }) {
    return signInPhone(context);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(UserCredential user)? emitUser,
    TResult? Function()? registerEmail,
    TResult? Function()? signInEmail,
    TResult? Function()? signInAnonymously,
    TResult? Function(BuildContext context)? signInPhone,
  }) {
    return signInPhone?.call(context);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(UserCredential user)? emitUser,
    TResult Function()? registerEmail,
    TResult Function()? signInEmail,
    TResult Function()? signInAnonymously,
    TResult Function(BuildContext context)? signInPhone,
    required TResult orElse(),
  }) {
    if (signInPhone != null) {
      return signInPhone(context);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_EmitUser value) emitUser,
    required TResult Function(_RegisterEmail value) registerEmail,
    required TResult Function(_SignInEmail value) signInEmail,
    required TResult Function(_SignInAnonymously value) signInAnonymously,
    required TResult Function(_SignInPhone value) signInPhone,
  }) {
    return signInPhone(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_EmitUser value)? emitUser,
    TResult? Function(_RegisterEmail value)? registerEmail,
    TResult? Function(_SignInEmail value)? signInEmail,
    TResult? Function(_SignInAnonymously value)? signInAnonymously,
    TResult? Function(_SignInPhone value)? signInPhone,
  }) {
    return signInPhone?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_EmitUser value)? emitUser,
    TResult Function(_RegisterEmail value)? registerEmail,
    TResult Function(_SignInEmail value)? signInEmail,
    TResult Function(_SignInAnonymously value)? signInAnonymously,
    TResult Function(_SignInPhone value)? signInPhone,
    required TResult orElse(),
  }) {
    if (signInPhone != null) {
      return signInPhone(this);
    }
    return orElse();
  }
}

abstract class _SignInPhone implements AuthEvent {
  const factory _SignInPhone({required final BuildContext context}) =
      _$_SignInPhone;

  BuildContext get context;
  @JsonKey(ignore: true)
  _$$_SignInPhoneCopyWith<_$_SignInPhone> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AuthState {
  UserCredential? get userCredential => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(UserCredential? userCredential) initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(UserCredential? userCredential)? initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UserCredential? userCredential)? initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AuthStateCopyWith<AuthState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res, AuthState>;
  @useResult
  $Res call({UserCredential? userCredential});
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res, $Val extends AuthState>
    implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userCredential = freezed,
  }) {
    return _then(_value.copyWith(
      userCredential: freezed == userCredential
          ? _value.userCredential
          : userCredential // ignore: cast_nullable_to_non_nullable
              as UserCredential?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_InitialCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({UserCredential? userCredential});
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$_Initial>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userCredential = freezed,
  }) {
    return _then(_$_Initial(
      userCredential: freezed == userCredential
          ? _value.userCredential
          : userCredential // ignore: cast_nullable_to_non_nullable
              as UserCredential?,
    ));
  }
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial({this.userCredential});

  @override
  final UserCredential? userCredential;

  @override
  String toString() {
    return 'AuthState.initial(userCredential: $userCredential)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Initial &&
            (identical(other.userCredential, userCredential) ||
                other.userCredential == userCredential));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userCredential);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      __$$_InitialCopyWithImpl<_$_Initial>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(UserCredential? userCredential) initial,
  }) {
    return initial(userCredential);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(UserCredential? userCredential)? initial,
  }) {
    return initial?.call(userCredential);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UserCredential? userCredential)? initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(userCredential);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements AuthState {
  const factory _Initial({final UserCredential? userCredential}) = _$_Initial;

  @override
  UserCredential? get userCredential;
  @override
  @JsonKey(ignore: true)
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      throw _privateConstructorUsedError;
}
