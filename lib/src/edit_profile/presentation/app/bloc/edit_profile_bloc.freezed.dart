// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edit_profile_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$EditProfileEvent {
  BuildContext get context => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String? get gender => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            BuildContext context, String name, String email, String? gender)
        editUserProfile,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            BuildContext context, String name, String email, String? gender)?
        editUserProfile,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            BuildContext context, String name, String email, String? gender)?
        editUserProfile,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EditUserAccountProfileEvent value)
        editUserProfile,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EditUserAccountProfileEvent value)? editUserProfile,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EditUserAccountProfileEvent value)? editUserProfile,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of EditProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EditProfileEventCopyWith<EditProfileEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditProfileEventCopyWith<$Res> {
  factory $EditProfileEventCopyWith(
          EditProfileEvent value, $Res Function(EditProfileEvent) then) =
      _$EditProfileEventCopyWithImpl<$Res, EditProfileEvent>;
  @useResult
  $Res call({BuildContext context, String name, String email, String? gender});
}

/// @nodoc
class _$EditProfileEventCopyWithImpl<$Res, $Val extends EditProfileEvent>
    implements $EditProfileEventCopyWith<$Res> {
  _$EditProfileEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EditProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? context = null,
    Object? name = null,
    Object? email = null,
    Object? gender = freezed,
  }) {
    return _then(_value.copyWith(
      context: null == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EditUserAccountProfileEventImplCopyWith<$Res>
    implements $EditProfileEventCopyWith<$Res> {
  factory _$$EditUserAccountProfileEventImplCopyWith(
          _$EditUserAccountProfileEventImpl value,
          $Res Function(_$EditUserAccountProfileEventImpl) then) =
      __$$EditUserAccountProfileEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({BuildContext context, String name, String email, String? gender});
}

/// @nodoc
class __$$EditUserAccountProfileEventImplCopyWithImpl<$Res>
    extends _$EditProfileEventCopyWithImpl<$Res,
        _$EditUserAccountProfileEventImpl>
    implements _$$EditUserAccountProfileEventImplCopyWith<$Res> {
  __$$EditUserAccountProfileEventImplCopyWithImpl(
      _$EditUserAccountProfileEventImpl _value,
      $Res Function(_$EditUserAccountProfileEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of EditProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? context = null,
    Object? name = null,
    Object? email = null,
    Object? gender = freezed,
  }) {
    return _then(_$EditUserAccountProfileEventImpl(
      context: null == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$EditUserAccountProfileEventImpl implements EditUserAccountProfileEvent {
  const _$EditUserAccountProfileEventImpl(
      {required this.context,
      required this.name,
      required this.email,
      this.gender});

  @override
  final BuildContext context;
  @override
  final String name;
  @override
  final String email;
  @override
  final String? gender;

  @override
  String toString() {
    return 'EditProfileEvent.editUserProfile(context: $context, name: $name, email: $email, gender: $gender)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EditUserAccountProfileEventImpl &&
            (identical(other.context, context) || other.context == context) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.gender, gender) || other.gender == gender));
  }

  @override
  int get hashCode => Object.hash(runtimeType, context, name, email, gender);

  /// Create a copy of EditProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EditUserAccountProfileEventImplCopyWith<_$EditUserAccountProfileEventImpl>
      get copyWith => __$$EditUserAccountProfileEventImplCopyWithImpl<
          _$EditUserAccountProfileEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            BuildContext context, String name, String email, String? gender)
        editUserProfile,
  }) {
    return editUserProfile(context, name, email, gender);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            BuildContext context, String name, String email, String? gender)?
        editUserProfile,
  }) {
    return editUserProfile?.call(context, name, email, gender);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            BuildContext context, String name, String email, String? gender)?
        editUserProfile,
    required TResult orElse(),
  }) {
    if (editUserProfile != null) {
      return editUserProfile(context, name, email, gender);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EditUserAccountProfileEvent value)
        editUserProfile,
  }) {
    return editUserProfile(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EditUserAccountProfileEvent value)? editUserProfile,
  }) {
    return editUserProfile?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EditUserAccountProfileEvent value)? editUserProfile,
    required TResult orElse(),
  }) {
    if (editUserProfile != null) {
      return editUserProfile(this);
    }
    return orElse();
  }
}

abstract class EditUserAccountProfileEvent implements EditProfileEvent {
  const factory EditUserAccountProfileEvent(
      {required final BuildContext context,
      required final String name,
      required final String email,
      final String? gender}) = _$EditUserAccountProfileEventImpl;

  @override
  BuildContext get context;
  @override
  String get name;
  @override
  String get email;
  @override
  String? get gender;

  /// Create a copy of EditProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EditUserAccountProfileEventImplCopyWith<_$EditUserAccountProfileEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$EditProfileState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) failed,
    required TResult Function() success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? failed,
    TResult? Function()? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? failed,
    TResult Function()? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_initialState value) initial,
    required TResult Function(_loadingState value) loading,
    required TResult Function(_failedState value) failed,
    required TResult Function(_successState value) success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initialState value)? initial,
    TResult? Function(_loadingState value)? loading,
    TResult? Function(_failedState value)? failed,
    TResult? Function(_successState value)? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initialState value)? initial,
    TResult Function(_loadingState value)? loading,
    TResult Function(_failedState value)? failed,
    TResult Function(_successState value)? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditProfileStateCopyWith<$Res> {
  factory $EditProfileStateCopyWith(
          EditProfileState value, $Res Function(EditProfileState) then) =
      _$EditProfileStateCopyWithImpl<$Res, EditProfileState>;
}

/// @nodoc
class _$EditProfileStateCopyWithImpl<$Res, $Val extends EditProfileState>
    implements $EditProfileStateCopyWith<$Res> {
  _$EditProfileStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EditProfileState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$initialStateImplCopyWith<$Res> {
  factory _$$initialStateImplCopyWith(
          _$initialStateImpl value, $Res Function(_$initialStateImpl) then) =
      __$$initialStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$initialStateImplCopyWithImpl<$Res>
    extends _$EditProfileStateCopyWithImpl<$Res, _$initialStateImpl>
    implements _$$initialStateImplCopyWith<$Res> {
  __$$initialStateImplCopyWithImpl(
      _$initialStateImpl _value, $Res Function(_$initialStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of EditProfileState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$initialStateImpl implements _initialState {
  const _$initialStateImpl();

  @override
  String toString() {
    return 'EditProfileState.initial()';
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
    required TResult Function() success,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? failed,
    TResult? Function()? success,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? failed,
    TResult Function()? success,
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
    required TResult Function(_successState value) success,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initialState value)? initial,
    TResult? Function(_loadingState value)? loading,
    TResult? Function(_failedState value)? failed,
    TResult? Function(_successState value)? success,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initialState value)? initial,
    TResult Function(_loadingState value)? loading,
    TResult Function(_failedState value)? failed,
    TResult Function(_successState value)? success,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _initialState implements EditProfileState {
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
    extends _$EditProfileStateCopyWithImpl<$Res, _$loadingStateImpl>
    implements _$$loadingStateImplCopyWith<$Res> {
  __$$loadingStateImplCopyWithImpl(
      _$loadingStateImpl _value, $Res Function(_$loadingStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of EditProfileState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$loadingStateImpl implements _loadingState {
  const _$loadingStateImpl();

  @override
  String toString() {
    return 'EditProfileState.loading()';
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
    required TResult Function() success,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? failed,
    TResult? Function()? success,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? failed,
    TResult Function()? success,
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
    required TResult Function(_successState value) success,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initialState value)? initial,
    TResult? Function(_loadingState value)? loading,
    TResult? Function(_failedState value)? failed,
    TResult? Function(_successState value)? success,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initialState value)? initial,
    TResult Function(_loadingState value)? loading,
    TResult Function(_failedState value)? failed,
    TResult Function(_successState value)? success,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _loadingState implements EditProfileState {
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
    extends _$EditProfileStateCopyWithImpl<$Res, _$failedStateImpl>
    implements _$$failedStateImplCopyWith<$Res> {
  __$$failedStateImplCopyWithImpl(
      _$failedStateImpl _value, $Res Function(_$failedStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of EditProfileState
  /// with the given fields replaced by the non-null parameter values.
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
    return 'EditProfileState.failed(message: $message)';
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

  /// Create a copy of EditProfileState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
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
    required TResult Function() success,
  }) {
    return failed(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? failed,
    TResult? Function()? success,
  }) {
    return failed?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? failed,
    TResult Function()? success,
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
    required TResult Function(_successState value) success,
  }) {
    return failed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initialState value)? initial,
    TResult? Function(_loadingState value)? loading,
    TResult? Function(_failedState value)? failed,
    TResult? Function(_successState value)? success,
  }) {
    return failed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initialState value)? initial,
    TResult Function(_loadingState value)? loading,
    TResult Function(_failedState value)? failed,
    TResult Function(_successState value)? success,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(this);
    }
    return orElse();
  }
}

abstract class _failedState implements EditProfileState {
  const factory _failedState(final String message) = _$failedStateImpl;

  String get message;

  /// Create a copy of EditProfileState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$failedStateImplCopyWith<_$failedStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$successStateImplCopyWith<$Res> {
  factory _$$successStateImplCopyWith(
          _$successStateImpl value, $Res Function(_$successStateImpl) then) =
      __$$successStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$successStateImplCopyWithImpl<$Res>
    extends _$EditProfileStateCopyWithImpl<$Res, _$successStateImpl>
    implements _$$successStateImplCopyWith<$Res> {
  __$$successStateImplCopyWithImpl(
      _$successStateImpl _value, $Res Function(_$successStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of EditProfileState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$successStateImpl implements _successState {
  const _$successStateImpl();

  @override
  String toString() {
    return 'EditProfileState.success()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$successStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) failed,
    required TResult Function() success,
  }) {
    return success();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? failed,
    TResult? Function()? success,
  }) {
    return success?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? failed,
    TResult Function()? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_initialState value) initial,
    required TResult Function(_loadingState value) loading,
    required TResult Function(_failedState value) failed,
    required TResult Function(_successState value) success,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initialState value)? initial,
    TResult? Function(_loadingState value)? loading,
    TResult? Function(_failedState value)? failed,
    TResult? Function(_successState value)? success,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initialState value)? initial,
    TResult Function(_loadingState value)? loading,
    TResult Function(_failedState value)? failed,
    TResult Function(_successState value)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _successState implements EditProfileState {
  const factory _successState() = _$successStateImpl;
}
