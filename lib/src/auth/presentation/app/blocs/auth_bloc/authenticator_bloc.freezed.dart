// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'authenticator_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AuthenticatorEvent {
  String get phone => throw _privateConstructorUsedError;
  BuildContext get context => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String phone, BuildContext context)
        loginOrRegister,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String phone, BuildContext context)? loginOrRegister,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phone, BuildContext context)? loginOrRegister,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthLoginOrRegister value) loginOrRegister,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthLoginOrRegister value)? loginOrRegister,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthLoginOrRegister value)? loginOrRegister,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AuthenticatorEventCopyWith<AuthenticatorEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthenticatorEventCopyWith<$Res> {
  factory $AuthenticatorEventCopyWith(
          AuthenticatorEvent value, $Res Function(AuthenticatorEvent) then) =
      _$AuthenticatorEventCopyWithImpl<$Res, AuthenticatorEvent>;
  @useResult
  $Res call({String phone, BuildContext context});
}

/// @nodoc
class _$AuthenticatorEventCopyWithImpl<$Res, $Val extends AuthenticatorEvent>
    implements $AuthenticatorEventCopyWith<$Res> {
  _$AuthenticatorEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phone = null,
    Object? context = null,
  }) {
    return _then(_value.copyWith(
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      context: null == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AuthLoginOrRegisterImplCopyWith<$Res>
    implements $AuthenticatorEventCopyWith<$Res> {
  factory _$$AuthLoginOrRegisterImplCopyWith(_$AuthLoginOrRegisterImpl value,
          $Res Function(_$AuthLoginOrRegisterImpl) then) =
      __$$AuthLoginOrRegisterImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String phone, BuildContext context});
}

/// @nodoc
class __$$AuthLoginOrRegisterImplCopyWithImpl<$Res>
    extends _$AuthenticatorEventCopyWithImpl<$Res, _$AuthLoginOrRegisterImpl>
    implements _$$AuthLoginOrRegisterImplCopyWith<$Res> {
  __$$AuthLoginOrRegisterImplCopyWithImpl(_$AuthLoginOrRegisterImpl _value,
      $Res Function(_$AuthLoginOrRegisterImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phone = null,
    Object? context = null,
  }) {
    return _then(_$AuthLoginOrRegisterImpl(
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      context: null == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
    ));
  }
}

/// @nodoc

class _$AuthLoginOrRegisterImpl implements AuthLoginOrRegister {
  const _$AuthLoginOrRegisterImpl({required this.phone, required this.context});

  @override
  final String phone;
  @override
  final BuildContext context;

  @override
  String toString() {
    return 'AuthenticatorEvent.loginOrRegister(phone: $phone, context: $context)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthLoginOrRegisterImpl &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.context, context) || other.context == context));
  }

  @override
  int get hashCode => Object.hash(runtimeType, phone, context);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthLoginOrRegisterImplCopyWith<_$AuthLoginOrRegisterImpl> get copyWith =>
      __$$AuthLoginOrRegisterImplCopyWithImpl<_$AuthLoginOrRegisterImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String phone, BuildContext context)
        loginOrRegister,
  }) {
    return loginOrRegister(phone, context);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String phone, BuildContext context)? loginOrRegister,
  }) {
    return loginOrRegister?.call(phone, context);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phone, BuildContext context)? loginOrRegister,
    required TResult orElse(),
  }) {
    if (loginOrRegister != null) {
      return loginOrRegister(phone, context);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthLoginOrRegister value) loginOrRegister,
  }) {
    return loginOrRegister(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthLoginOrRegister value)? loginOrRegister,
  }) {
    return loginOrRegister?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthLoginOrRegister value)? loginOrRegister,
    required TResult orElse(),
  }) {
    if (loginOrRegister != null) {
      return loginOrRegister(this);
    }
    return orElse();
  }
}

abstract class AuthLoginOrRegister implements AuthenticatorEvent {
  const factory AuthLoginOrRegister(
      {required final String phone,
      required final BuildContext context}) = _$AuthLoginOrRegisterImpl;

  @override
  String get phone;
  @override
  BuildContext get context;
  @override
  @JsonKey(ignore: true)
  _$$AuthLoginOrRegisterImplCopyWith<_$AuthLoginOrRegisterImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AuthenticatorState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) failed,
    required TResult Function(String phone) loggedInSuccessfully,
    required TResult Function() otpVerifiedSuccessfully,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? failed,
    TResult? Function(String phone)? loggedInSuccessfully,
    TResult? Function()? otpVerifiedSuccessfully,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? failed,
    TResult Function(String phone)? loggedInSuccessfully,
    TResult Function()? otpVerifiedSuccessfully,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_initialState value) initial,
    required TResult Function(_loadingState value) loading,
    required TResult Function(_failedState value) failed,
    required TResult Function(_loginSuccessState value) loggedInSuccessfully,
    required TResult Function(_otpSuccessState value) otpVerifiedSuccessfully,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initialState value)? initial,
    TResult? Function(_loadingState value)? loading,
    TResult? Function(_failedState value)? failed,
    TResult? Function(_loginSuccessState value)? loggedInSuccessfully,
    TResult? Function(_otpSuccessState value)? otpVerifiedSuccessfully,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initialState value)? initial,
    TResult Function(_loadingState value)? loading,
    TResult Function(_failedState value)? failed,
    TResult Function(_loginSuccessState value)? loggedInSuccessfully,
    TResult Function(_otpSuccessState value)? otpVerifiedSuccessfully,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthenticatorStateCopyWith<$Res> {
  factory $AuthenticatorStateCopyWith(
          AuthenticatorState value, $Res Function(AuthenticatorState) then) =
      _$AuthenticatorStateCopyWithImpl<$Res, AuthenticatorState>;
}

/// @nodoc
class _$AuthenticatorStateCopyWithImpl<$Res, $Val extends AuthenticatorState>
    implements $AuthenticatorStateCopyWith<$Res> {
  _$AuthenticatorStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$initialStateImplCopyWith<$Res> {
  factory _$$initialStateImplCopyWith(
          _$initialStateImpl value, $Res Function(_$initialStateImpl) then) =
      __$$initialStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$initialStateImplCopyWithImpl<$Res>
    extends _$AuthenticatorStateCopyWithImpl<$Res, _$initialStateImpl>
    implements _$$initialStateImplCopyWith<$Res> {
  __$$initialStateImplCopyWithImpl(
      _$initialStateImpl _value, $Res Function(_$initialStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$initialStateImpl implements _initialState {
  const _$initialStateImpl();

  @override
  String toString() {
    return 'AuthenticatorState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$initialStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) failed,
    required TResult Function(String phone) loggedInSuccessfully,
    required TResult Function() otpVerifiedSuccessfully,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? failed,
    TResult? Function(String phone)? loggedInSuccessfully,
    TResult? Function()? otpVerifiedSuccessfully,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? failed,
    TResult Function(String phone)? loggedInSuccessfully,
    TResult Function()? otpVerifiedSuccessfully,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_initialState value) initial,
    required TResult Function(_loadingState value) loading,
    required TResult Function(_failedState value) failed,
    required TResult Function(_loginSuccessState value) loggedInSuccessfully,
    required TResult Function(_otpSuccessState value) otpVerifiedSuccessfully,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initialState value)? initial,
    TResult? Function(_loadingState value)? loading,
    TResult? Function(_failedState value)? failed,
    TResult? Function(_loginSuccessState value)? loggedInSuccessfully,
    TResult? Function(_otpSuccessState value)? otpVerifiedSuccessfully,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initialState value)? initial,
    TResult Function(_loadingState value)? loading,
    TResult Function(_failedState value)? failed,
    TResult Function(_loginSuccessState value)? loggedInSuccessfully,
    TResult Function(_otpSuccessState value)? otpVerifiedSuccessfully,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _initialState implements AuthenticatorState {
  const factory _initialState() = _$initialStateImpl;
}

/// @nodoc
abstract class _$$loadingStateImplCopyWith<$Res> {
  factory _$$loadingStateImplCopyWith(
          _$loadingStateImpl value, $Res Function(_$loadingStateImpl) then) =
      __$$loadingStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$loadingStateImplCopyWithImpl<$Res>
    extends _$AuthenticatorStateCopyWithImpl<$Res, _$loadingStateImpl>
    implements _$$loadingStateImplCopyWith<$Res> {
  __$$loadingStateImplCopyWithImpl(
      _$loadingStateImpl _value, $Res Function(_$loadingStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$loadingStateImpl implements _loadingState {
  const _$loadingStateImpl();

  @override
  String toString() {
    return 'AuthenticatorState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$loadingStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) failed,
    required TResult Function(String phone) loggedInSuccessfully,
    required TResult Function() otpVerifiedSuccessfully,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? failed,
    TResult? Function(String phone)? loggedInSuccessfully,
    TResult? Function()? otpVerifiedSuccessfully,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? failed,
    TResult Function(String phone)? loggedInSuccessfully,
    TResult Function()? otpVerifiedSuccessfully,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_initialState value) initial,
    required TResult Function(_loadingState value) loading,
    required TResult Function(_failedState value) failed,
    required TResult Function(_loginSuccessState value) loggedInSuccessfully,
    required TResult Function(_otpSuccessState value) otpVerifiedSuccessfully,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initialState value)? initial,
    TResult? Function(_loadingState value)? loading,
    TResult? Function(_failedState value)? failed,
    TResult? Function(_loginSuccessState value)? loggedInSuccessfully,
    TResult? Function(_otpSuccessState value)? otpVerifiedSuccessfully,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initialState value)? initial,
    TResult Function(_loadingState value)? loading,
    TResult Function(_failedState value)? failed,
    TResult Function(_loginSuccessState value)? loggedInSuccessfully,
    TResult Function(_otpSuccessState value)? otpVerifiedSuccessfully,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _loadingState implements AuthenticatorState {
  const factory _loadingState() = _$loadingStateImpl;
}

/// @nodoc
abstract class _$$failedStateImplCopyWith<$Res> {
  factory _$$failedStateImplCopyWith(
          _$failedStateImpl value, $Res Function(_$failedStateImpl) then) =
      __$$failedStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$failedStateImplCopyWithImpl<$Res>
    extends _$AuthenticatorStateCopyWithImpl<$Res, _$failedStateImpl>
    implements _$$failedStateImplCopyWith<$Res> {
  __$$failedStateImplCopyWithImpl(
      _$failedStateImpl _value, $Res Function(_$failedStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$failedStateImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$failedStateImpl implements _failedState {
  const _$failedStateImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'AuthenticatorState.failed(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$failedStateImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$failedStateImplCopyWith<_$failedStateImpl> get copyWith =>
      __$$failedStateImplCopyWithImpl<_$failedStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) failed,
    required TResult Function(String phone) loggedInSuccessfully,
    required TResult Function() otpVerifiedSuccessfully,
  }) {
    return failed(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? failed,
    TResult? Function(String phone)? loggedInSuccessfully,
    TResult? Function()? otpVerifiedSuccessfully,
  }) {
    return failed?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? failed,
    TResult Function(String phone)? loggedInSuccessfully,
    TResult Function()? otpVerifiedSuccessfully,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_initialState value) initial,
    required TResult Function(_loadingState value) loading,
    required TResult Function(_failedState value) failed,
    required TResult Function(_loginSuccessState value) loggedInSuccessfully,
    required TResult Function(_otpSuccessState value) otpVerifiedSuccessfully,
  }) {
    return failed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initialState value)? initial,
    TResult? Function(_loadingState value)? loading,
    TResult? Function(_failedState value)? failed,
    TResult? Function(_loginSuccessState value)? loggedInSuccessfully,
    TResult? Function(_otpSuccessState value)? otpVerifiedSuccessfully,
  }) {
    return failed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initialState value)? initial,
    TResult Function(_loadingState value)? loading,
    TResult Function(_failedState value)? failed,
    TResult Function(_loginSuccessState value)? loggedInSuccessfully,
    TResult Function(_otpSuccessState value)? otpVerifiedSuccessfully,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(this);
    }
    return orElse();
  }
}

abstract class _failedState implements AuthenticatorState {
  const factory _failedState(final String message) = _$failedStateImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$failedStateImplCopyWith<_$failedStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$loginSuccessStateImplCopyWith<$Res> {
  factory _$$loginSuccessStateImplCopyWith(_$loginSuccessStateImpl value,
          $Res Function(_$loginSuccessStateImpl) then) =
      __$$loginSuccessStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String phone});
}

/// @nodoc
class __$$loginSuccessStateImplCopyWithImpl<$Res>
    extends _$AuthenticatorStateCopyWithImpl<$Res, _$loginSuccessStateImpl>
    implements _$$loginSuccessStateImplCopyWith<$Res> {
  __$$loginSuccessStateImplCopyWithImpl(_$loginSuccessStateImpl _value,
      $Res Function(_$loginSuccessStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phone = null,
  }) {
    return _then(_$loginSuccessStateImpl(
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$loginSuccessStateImpl implements _loginSuccessState {
  const _$loginSuccessStateImpl({required this.phone});

  @override
  final String phone;

  @override
  String toString() {
    return 'AuthenticatorState.loggedInSuccessfully(phone: $phone)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$loginSuccessStateImpl &&
            (identical(other.phone, phone) || other.phone == phone));
  }

  @override
  int get hashCode => Object.hash(runtimeType, phone);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$loginSuccessStateImplCopyWith<_$loginSuccessStateImpl> get copyWith =>
      __$$loginSuccessStateImplCopyWithImpl<_$loginSuccessStateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) failed,
    required TResult Function(String phone) loggedInSuccessfully,
    required TResult Function() otpVerifiedSuccessfully,
  }) {
    return loggedInSuccessfully(phone);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? failed,
    TResult? Function(String phone)? loggedInSuccessfully,
    TResult? Function()? otpVerifiedSuccessfully,
  }) {
    return loggedInSuccessfully?.call(phone);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? failed,
    TResult Function(String phone)? loggedInSuccessfully,
    TResult Function()? otpVerifiedSuccessfully,
    required TResult orElse(),
  }) {
    if (loggedInSuccessfully != null) {
      return loggedInSuccessfully(phone);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_initialState value) initial,
    required TResult Function(_loadingState value) loading,
    required TResult Function(_failedState value) failed,
    required TResult Function(_loginSuccessState value) loggedInSuccessfully,
    required TResult Function(_otpSuccessState value) otpVerifiedSuccessfully,
  }) {
    return loggedInSuccessfully(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initialState value)? initial,
    TResult? Function(_loadingState value)? loading,
    TResult? Function(_failedState value)? failed,
    TResult? Function(_loginSuccessState value)? loggedInSuccessfully,
    TResult? Function(_otpSuccessState value)? otpVerifiedSuccessfully,
  }) {
    return loggedInSuccessfully?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initialState value)? initial,
    TResult Function(_loadingState value)? loading,
    TResult Function(_failedState value)? failed,
    TResult Function(_loginSuccessState value)? loggedInSuccessfully,
    TResult Function(_otpSuccessState value)? otpVerifiedSuccessfully,
    required TResult orElse(),
  }) {
    if (loggedInSuccessfully != null) {
      return loggedInSuccessfully(this);
    }
    return orElse();
  }
}

abstract class _loginSuccessState implements AuthenticatorState {
  const factory _loginSuccessState({required final String phone}) =
      _$loginSuccessStateImpl;

  String get phone;
  @JsonKey(ignore: true)
  _$$loginSuccessStateImplCopyWith<_$loginSuccessStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$otpSuccessStateImplCopyWith<$Res> {
  factory _$$otpSuccessStateImplCopyWith(_$otpSuccessStateImpl value,
          $Res Function(_$otpSuccessStateImpl) then) =
      __$$otpSuccessStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$otpSuccessStateImplCopyWithImpl<$Res>
    extends _$AuthenticatorStateCopyWithImpl<$Res, _$otpSuccessStateImpl>
    implements _$$otpSuccessStateImplCopyWith<$Res> {
  __$$otpSuccessStateImplCopyWithImpl(
      _$otpSuccessStateImpl _value, $Res Function(_$otpSuccessStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$otpSuccessStateImpl implements _otpSuccessState {
  const _$otpSuccessStateImpl();

  @override
  String toString() {
    return 'AuthenticatorState.otpVerifiedSuccessfully()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$otpSuccessStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) failed,
    required TResult Function(String phone) loggedInSuccessfully,
    required TResult Function() otpVerifiedSuccessfully,
  }) {
    return otpVerifiedSuccessfully();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? failed,
    TResult? Function(String phone)? loggedInSuccessfully,
    TResult? Function()? otpVerifiedSuccessfully,
  }) {
    return otpVerifiedSuccessfully?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? failed,
    TResult Function(String phone)? loggedInSuccessfully,
    TResult Function()? otpVerifiedSuccessfully,
    required TResult orElse(),
  }) {
    if (otpVerifiedSuccessfully != null) {
      return otpVerifiedSuccessfully();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_initialState value) initial,
    required TResult Function(_loadingState value) loading,
    required TResult Function(_failedState value) failed,
    required TResult Function(_loginSuccessState value) loggedInSuccessfully,
    required TResult Function(_otpSuccessState value) otpVerifiedSuccessfully,
  }) {
    return otpVerifiedSuccessfully(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initialState value)? initial,
    TResult? Function(_loadingState value)? loading,
    TResult? Function(_failedState value)? failed,
    TResult? Function(_loginSuccessState value)? loggedInSuccessfully,
    TResult? Function(_otpSuccessState value)? otpVerifiedSuccessfully,
  }) {
    return otpVerifiedSuccessfully?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initialState value)? initial,
    TResult Function(_loadingState value)? loading,
    TResult Function(_failedState value)? failed,
    TResult Function(_loginSuccessState value)? loggedInSuccessfully,
    TResult Function(_otpSuccessState value)? otpVerifiedSuccessfully,
    required TResult orElse(),
  }) {
    if (otpVerifiedSuccessfully != null) {
      return otpVerifiedSuccessfully(this);
    }
    return orElse();
  }
}

abstract class _otpSuccessState implements AuthenticatorState {
  const factory _otpSuccessState() = _$otpSuccessStateImpl;
}
