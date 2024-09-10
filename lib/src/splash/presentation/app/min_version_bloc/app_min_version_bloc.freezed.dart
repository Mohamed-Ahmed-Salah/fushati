// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_min_version_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AppMinVersionEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BuildContext context) getAppVersion,
    required TResult Function() updateApp,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BuildContext context)? getAppVersion,
    TResult? Function()? updateApp,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BuildContext context)? getAppVersion,
    TResult Function()? updateApp,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetAppVersionEvent value) getAppVersion,
    required TResult Function(UpdateAppEvent value) updateApp,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetAppVersionEvent value)? getAppVersion,
    TResult? Function(UpdateAppEvent value)? updateApp,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetAppVersionEvent value)? getAppVersion,
    TResult Function(UpdateAppEvent value)? updateApp,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppMinVersionEventCopyWith<$Res> {
  factory $AppMinVersionEventCopyWith(
          AppMinVersionEvent value, $Res Function(AppMinVersionEvent) then) =
      _$AppMinVersionEventCopyWithImpl<$Res, AppMinVersionEvent>;
}

/// @nodoc
class _$AppMinVersionEventCopyWithImpl<$Res, $Val extends AppMinVersionEvent>
    implements $AppMinVersionEventCopyWith<$Res> {
  _$AppMinVersionEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppMinVersionEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$GetAppVersionEventImplCopyWith<$Res> {
  factory _$$GetAppVersionEventImplCopyWith(_$GetAppVersionEventImpl value,
          $Res Function(_$GetAppVersionEventImpl) then) =
      __$$GetAppVersionEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({BuildContext context});
}

/// @nodoc
class __$$GetAppVersionEventImplCopyWithImpl<$Res>
    extends _$AppMinVersionEventCopyWithImpl<$Res, _$GetAppVersionEventImpl>
    implements _$$GetAppVersionEventImplCopyWith<$Res> {
  __$$GetAppVersionEventImplCopyWithImpl(_$GetAppVersionEventImpl _value,
      $Res Function(_$GetAppVersionEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppMinVersionEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? context = null,
  }) {
    return _then(_$GetAppVersionEventImpl(
      context: null == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
    ));
  }
}

/// @nodoc

class _$GetAppVersionEventImpl implements GetAppVersionEvent {
  const _$GetAppVersionEventImpl({required this.context});

  @override
  final BuildContext context;

  @override
  String toString() {
    return 'AppMinVersionEvent.getAppVersion(context: $context)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetAppVersionEventImpl &&
            (identical(other.context, context) || other.context == context));
  }

  @override
  int get hashCode => Object.hash(runtimeType, context);

  /// Create a copy of AppMinVersionEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetAppVersionEventImplCopyWith<_$GetAppVersionEventImpl> get copyWith =>
      __$$GetAppVersionEventImplCopyWithImpl<_$GetAppVersionEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BuildContext context) getAppVersion,
    required TResult Function() updateApp,
  }) {
    return getAppVersion(context);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BuildContext context)? getAppVersion,
    TResult? Function()? updateApp,
  }) {
    return getAppVersion?.call(context);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BuildContext context)? getAppVersion,
    TResult Function()? updateApp,
    required TResult orElse(),
  }) {
    if (getAppVersion != null) {
      return getAppVersion(context);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetAppVersionEvent value) getAppVersion,
    required TResult Function(UpdateAppEvent value) updateApp,
  }) {
    return getAppVersion(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetAppVersionEvent value)? getAppVersion,
    TResult? Function(UpdateAppEvent value)? updateApp,
  }) {
    return getAppVersion?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetAppVersionEvent value)? getAppVersion,
    TResult Function(UpdateAppEvent value)? updateApp,
    required TResult orElse(),
  }) {
    if (getAppVersion != null) {
      return getAppVersion(this);
    }
    return orElse();
  }
}

abstract class GetAppVersionEvent implements AppMinVersionEvent {
  const factory GetAppVersionEvent({required final BuildContext context}) =
      _$GetAppVersionEventImpl;

  BuildContext get context;

  /// Create a copy of AppMinVersionEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetAppVersionEventImplCopyWith<_$GetAppVersionEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateAppEventImplCopyWith<$Res> {
  factory _$$UpdateAppEventImplCopyWith(_$UpdateAppEventImpl value,
          $Res Function(_$UpdateAppEventImpl) then) =
      __$$UpdateAppEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UpdateAppEventImplCopyWithImpl<$Res>
    extends _$AppMinVersionEventCopyWithImpl<$Res, _$UpdateAppEventImpl>
    implements _$$UpdateAppEventImplCopyWith<$Res> {
  __$$UpdateAppEventImplCopyWithImpl(
      _$UpdateAppEventImpl _value, $Res Function(_$UpdateAppEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppMinVersionEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$UpdateAppEventImpl implements UpdateAppEvent {
  const _$UpdateAppEventImpl();

  @override
  String toString() {
    return 'AppMinVersionEvent.updateApp()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UpdateAppEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BuildContext context) getAppVersion,
    required TResult Function() updateApp,
  }) {
    return updateApp();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BuildContext context)? getAppVersion,
    TResult? Function()? updateApp,
  }) {
    return updateApp?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BuildContext context)? getAppVersion,
    TResult Function()? updateApp,
    required TResult orElse(),
  }) {
    if (updateApp != null) {
      return updateApp();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetAppVersionEvent value) getAppVersion,
    required TResult Function(UpdateAppEvent value) updateApp,
  }) {
    return updateApp(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetAppVersionEvent value)? getAppVersion,
    TResult? Function(UpdateAppEvent value)? updateApp,
  }) {
    return updateApp?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetAppVersionEvent value)? getAppVersion,
    TResult Function(UpdateAppEvent value)? updateApp,
    required TResult orElse(),
  }) {
    if (updateApp != null) {
      return updateApp(this);
    }
    return orElse();
  }
}

abstract class UpdateAppEvent implements AppMinVersionEvent {
  const factory UpdateAppEvent() = _$UpdateAppEventImpl;
}

/// @nodoc
mixin _$AppMinVersionState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(String message) failed,
    required TResult Function(MinVersionResponse response) successShouldUpdate,
    required TResult Function() successNoUpdate,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(String message)? failed,
    TResult? Function(MinVersionResponse response)? successShouldUpdate,
    TResult? Function()? successNoUpdate,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String message)? failed,
    TResult Function(MinVersionResponse response)? successShouldUpdate,
    TResult Function()? successNoUpdate,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_loadingState value) loading,
    required TResult Function(_failedState value) failed,
    required TResult Function(_successShouldUpdateState value)
        successShouldUpdate,
    required TResult Function(_successNoUpdateState value) successNoUpdate,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_loadingState value)? loading,
    TResult? Function(_failedState value)? failed,
    TResult? Function(_successShouldUpdateState value)? successShouldUpdate,
    TResult? Function(_successNoUpdateState value)? successNoUpdate,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_loadingState value)? loading,
    TResult Function(_failedState value)? failed,
    TResult Function(_successShouldUpdateState value)? successShouldUpdate,
    TResult Function(_successNoUpdateState value)? successNoUpdate,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppMinVersionStateCopyWith<$Res> {
  factory $AppMinVersionStateCopyWith(
          AppMinVersionState value, $Res Function(AppMinVersionState) then) =
      _$AppMinVersionStateCopyWithImpl<$Res, AppMinVersionState>;
}

/// @nodoc
class _$AppMinVersionStateCopyWithImpl<$Res, $Val extends AppMinVersionState>
    implements $AppMinVersionStateCopyWith<$Res> {
  _$AppMinVersionStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppMinVersionState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$loadingStateImplCopyWith<$Res> {
  factory _$$loadingStateImplCopyWith(
          _$loadingStateImpl value, $Res Function(_$loadingStateImpl) then) =
      __$$loadingStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$loadingStateImplCopyWithImpl<$Res>
    extends _$AppMinVersionStateCopyWithImpl<$Res, _$loadingStateImpl>
    implements _$$loadingStateImplCopyWith<$Res> {
  __$$loadingStateImplCopyWithImpl(
      _$loadingStateImpl _value, $Res Function(_$loadingStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppMinVersionState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$loadingStateImpl implements _loadingState {
  const _$loadingStateImpl();

  @override
  String toString() {
    return 'AppMinVersionState.loading()';
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
    required TResult Function() loading,
    required TResult Function(String message) failed,
    required TResult Function(MinVersionResponse response) successShouldUpdate,
    required TResult Function() successNoUpdate,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(String message)? failed,
    TResult? Function(MinVersionResponse response)? successShouldUpdate,
    TResult? Function()? successNoUpdate,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String message)? failed,
    TResult Function(MinVersionResponse response)? successShouldUpdate,
    TResult Function()? successNoUpdate,
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
    required TResult Function(_loadingState value) loading,
    required TResult Function(_failedState value) failed,
    required TResult Function(_successShouldUpdateState value)
        successShouldUpdate,
    required TResult Function(_successNoUpdateState value) successNoUpdate,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_loadingState value)? loading,
    TResult? Function(_failedState value)? failed,
    TResult? Function(_successShouldUpdateState value)? successShouldUpdate,
    TResult? Function(_successNoUpdateState value)? successNoUpdate,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_loadingState value)? loading,
    TResult Function(_failedState value)? failed,
    TResult Function(_successShouldUpdateState value)? successShouldUpdate,
    TResult Function(_successNoUpdateState value)? successNoUpdate,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _loadingState implements AppMinVersionState {
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
    extends _$AppMinVersionStateCopyWithImpl<$Res, _$failedStateImpl>
    implements _$$failedStateImplCopyWith<$Res> {
  __$$failedStateImplCopyWithImpl(
      _$failedStateImpl _value, $Res Function(_$failedStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppMinVersionState
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
    return 'AppMinVersionState.failed(message: $message)';
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

  /// Create a copy of AppMinVersionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$failedStateImplCopyWith<_$failedStateImpl> get copyWith =>
      __$$failedStateImplCopyWithImpl<_$failedStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(String message) failed,
    required TResult Function(MinVersionResponse response) successShouldUpdate,
    required TResult Function() successNoUpdate,
  }) {
    return failed(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(String message)? failed,
    TResult? Function(MinVersionResponse response)? successShouldUpdate,
    TResult? Function()? successNoUpdate,
  }) {
    return failed?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String message)? failed,
    TResult Function(MinVersionResponse response)? successShouldUpdate,
    TResult Function()? successNoUpdate,
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
    required TResult Function(_loadingState value) loading,
    required TResult Function(_failedState value) failed,
    required TResult Function(_successShouldUpdateState value)
        successShouldUpdate,
    required TResult Function(_successNoUpdateState value) successNoUpdate,
  }) {
    return failed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_loadingState value)? loading,
    TResult? Function(_failedState value)? failed,
    TResult? Function(_successShouldUpdateState value)? successShouldUpdate,
    TResult? Function(_successNoUpdateState value)? successNoUpdate,
  }) {
    return failed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_loadingState value)? loading,
    TResult Function(_failedState value)? failed,
    TResult Function(_successShouldUpdateState value)? successShouldUpdate,
    TResult Function(_successNoUpdateState value)? successNoUpdate,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(this);
    }
    return orElse();
  }
}

abstract class _failedState implements AppMinVersionState {
  const factory _failedState(final String message) = _$failedStateImpl;

  String get message;

  /// Create a copy of AppMinVersionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$failedStateImplCopyWith<_$failedStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$successShouldUpdateStateImplCopyWith<$Res> {
  factory _$$successShouldUpdateStateImplCopyWith(
          _$successShouldUpdateStateImpl value,
          $Res Function(_$successShouldUpdateStateImpl) then) =
      __$$successShouldUpdateStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({MinVersionResponse response});
}

/// @nodoc
class __$$successShouldUpdateStateImplCopyWithImpl<$Res>
    extends _$AppMinVersionStateCopyWithImpl<$Res,
        _$successShouldUpdateStateImpl>
    implements _$$successShouldUpdateStateImplCopyWith<$Res> {
  __$$successShouldUpdateStateImplCopyWithImpl(
      _$successShouldUpdateStateImpl _value,
      $Res Function(_$successShouldUpdateStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppMinVersionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? response = null,
  }) {
    return _then(_$successShouldUpdateStateImpl(
      response: null == response
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as MinVersionResponse,
    ));
  }
}

/// @nodoc

class _$successShouldUpdateStateImpl implements _successShouldUpdateState {
  const _$successShouldUpdateStateImpl({required this.response});

  @override
  final MinVersionResponse response;

  @override
  String toString() {
    return 'AppMinVersionState.successShouldUpdate(response: $response)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$successShouldUpdateStateImpl &&
            (identical(other.response, response) ||
                other.response == response));
  }

  @override
  int get hashCode => Object.hash(runtimeType, response);

  /// Create a copy of AppMinVersionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$successShouldUpdateStateImplCopyWith<_$successShouldUpdateStateImpl>
      get copyWith => __$$successShouldUpdateStateImplCopyWithImpl<
          _$successShouldUpdateStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(String message) failed,
    required TResult Function(MinVersionResponse response) successShouldUpdate,
    required TResult Function() successNoUpdate,
  }) {
    return successShouldUpdate(response);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(String message)? failed,
    TResult? Function(MinVersionResponse response)? successShouldUpdate,
    TResult? Function()? successNoUpdate,
  }) {
    return successShouldUpdate?.call(response);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String message)? failed,
    TResult Function(MinVersionResponse response)? successShouldUpdate,
    TResult Function()? successNoUpdate,
    required TResult orElse(),
  }) {
    if (successShouldUpdate != null) {
      return successShouldUpdate(response);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_loadingState value) loading,
    required TResult Function(_failedState value) failed,
    required TResult Function(_successShouldUpdateState value)
        successShouldUpdate,
    required TResult Function(_successNoUpdateState value) successNoUpdate,
  }) {
    return successShouldUpdate(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_loadingState value)? loading,
    TResult? Function(_failedState value)? failed,
    TResult? Function(_successShouldUpdateState value)? successShouldUpdate,
    TResult? Function(_successNoUpdateState value)? successNoUpdate,
  }) {
    return successShouldUpdate?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_loadingState value)? loading,
    TResult Function(_failedState value)? failed,
    TResult Function(_successShouldUpdateState value)? successShouldUpdate,
    TResult Function(_successNoUpdateState value)? successNoUpdate,
    required TResult orElse(),
  }) {
    if (successShouldUpdate != null) {
      return successShouldUpdate(this);
    }
    return orElse();
  }
}

abstract class _successShouldUpdateState implements AppMinVersionState {
  const factory _successShouldUpdateState(
          {required final MinVersionResponse response}) =
      _$successShouldUpdateStateImpl;

  MinVersionResponse get response;

  /// Create a copy of AppMinVersionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$successShouldUpdateStateImplCopyWith<_$successShouldUpdateStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$successNoUpdateStateImplCopyWith<$Res> {
  factory _$$successNoUpdateStateImplCopyWith(_$successNoUpdateStateImpl value,
          $Res Function(_$successNoUpdateStateImpl) then) =
      __$$successNoUpdateStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$successNoUpdateStateImplCopyWithImpl<$Res>
    extends _$AppMinVersionStateCopyWithImpl<$Res, _$successNoUpdateStateImpl>
    implements _$$successNoUpdateStateImplCopyWith<$Res> {
  __$$successNoUpdateStateImplCopyWithImpl(_$successNoUpdateStateImpl _value,
      $Res Function(_$successNoUpdateStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppMinVersionState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$successNoUpdateStateImpl implements _successNoUpdateState {
  const _$successNoUpdateStateImpl();

  @override
  String toString() {
    return 'AppMinVersionState.successNoUpdate()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$successNoUpdateStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(String message) failed,
    required TResult Function(MinVersionResponse response) successShouldUpdate,
    required TResult Function() successNoUpdate,
  }) {
    return successNoUpdate();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(String message)? failed,
    TResult? Function(MinVersionResponse response)? successShouldUpdate,
    TResult? Function()? successNoUpdate,
  }) {
    return successNoUpdate?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String message)? failed,
    TResult Function(MinVersionResponse response)? successShouldUpdate,
    TResult Function()? successNoUpdate,
    required TResult orElse(),
  }) {
    if (successNoUpdate != null) {
      return successNoUpdate();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_loadingState value) loading,
    required TResult Function(_failedState value) failed,
    required TResult Function(_successShouldUpdateState value)
        successShouldUpdate,
    required TResult Function(_successNoUpdateState value) successNoUpdate,
  }) {
    return successNoUpdate(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_loadingState value)? loading,
    TResult? Function(_failedState value)? failed,
    TResult? Function(_successShouldUpdateState value)? successShouldUpdate,
    TResult? Function(_successNoUpdateState value)? successNoUpdate,
  }) {
    return successNoUpdate?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_loadingState value)? loading,
    TResult Function(_failedState value)? failed,
    TResult Function(_successShouldUpdateState value)? successShouldUpdate,
    TResult Function(_successNoUpdateState value)? successNoUpdate,
    required TResult orElse(),
  }) {
    if (successNoUpdate != null) {
      return successNoUpdate(this);
    }
    return orElse();
  }
}

abstract class _successNoUpdateState implements AppMinVersionState {
  const factory _successNoUpdateState() = _$successNoUpdateStateImpl;
}
