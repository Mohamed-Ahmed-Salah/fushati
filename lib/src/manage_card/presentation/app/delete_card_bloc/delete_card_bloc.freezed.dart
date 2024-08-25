// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'delete_card_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DeleteCardEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id) deleteCard,
    required TResult Function() reset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id)? deleteCard,
    TResult? Function()? reset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id)? deleteCard,
    TResult Function()? reset,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DeleteCardEventClass value) deleteCard,
    required TResult Function(DeleteCardResetEvent value) reset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DeleteCardEventClass value)? deleteCard,
    TResult? Function(DeleteCardResetEvent value)? reset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DeleteCardEventClass value)? deleteCard,
    TResult Function(DeleteCardResetEvent value)? reset,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeleteCardEventCopyWith<$Res> {
  factory $DeleteCardEventCopyWith(
          DeleteCardEvent value, $Res Function(DeleteCardEvent) then) =
      _$DeleteCardEventCopyWithImpl<$Res, DeleteCardEvent>;
}

/// @nodoc
class _$DeleteCardEventCopyWithImpl<$Res, $Val extends DeleteCardEvent>
    implements $DeleteCardEventCopyWith<$Res> {
  _$DeleteCardEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DeleteCardEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$DeleteCardEventClassImplCopyWith<$Res> {
  factory _$$DeleteCardEventClassImplCopyWith(_$DeleteCardEventClassImpl value,
          $Res Function(_$DeleteCardEventClassImpl) then) =
      __$$DeleteCardEventClassImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$$DeleteCardEventClassImplCopyWithImpl<$Res>
    extends _$DeleteCardEventCopyWithImpl<$Res, _$DeleteCardEventClassImpl>
    implements _$$DeleteCardEventClassImplCopyWith<$Res> {
  __$$DeleteCardEventClassImplCopyWithImpl(_$DeleteCardEventClassImpl _value,
      $Res Function(_$DeleteCardEventClassImpl) _then)
      : super(_value, _then);

  /// Create a copy of DeleteCardEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$DeleteCardEventClassImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$DeleteCardEventClassImpl implements DeleteCardEventClass {
  const _$DeleteCardEventClassImpl({required this.id});

  @override
  final int id;

  @override
  String toString() {
    return 'DeleteCardEvent.deleteCard(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteCardEventClassImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  /// Create a copy of DeleteCardEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteCardEventClassImplCopyWith<_$DeleteCardEventClassImpl>
      get copyWith =>
          __$$DeleteCardEventClassImplCopyWithImpl<_$DeleteCardEventClassImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id) deleteCard,
    required TResult Function() reset,
  }) {
    return deleteCard(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id)? deleteCard,
    TResult? Function()? reset,
  }) {
    return deleteCard?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id)? deleteCard,
    TResult Function()? reset,
    required TResult orElse(),
  }) {
    if (deleteCard != null) {
      return deleteCard(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DeleteCardEventClass value) deleteCard,
    required TResult Function(DeleteCardResetEvent value) reset,
  }) {
    return deleteCard(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DeleteCardEventClass value)? deleteCard,
    TResult? Function(DeleteCardResetEvent value)? reset,
  }) {
    return deleteCard?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DeleteCardEventClass value)? deleteCard,
    TResult Function(DeleteCardResetEvent value)? reset,
    required TResult orElse(),
  }) {
    if (deleteCard != null) {
      return deleteCard(this);
    }
    return orElse();
  }
}

abstract class DeleteCardEventClass implements DeleteCardEvent {
  const factory DeleteCardEventClass({required final int id}) =
      _$DeleteCardEventClassImpl;

  int get id;

  /// Create a copy of DeleteCardEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeleteCardEventClassImplCopyWith<_$DeleteCardEventClassImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeleteCardResetEventImplCopyWith<$Res> {
  factory _$$DeleteCardResetEventImplCopyWith(_$DeleteCardResetEventImpl value,
          $Res Function(_$DeleteCardResetEventImpl) then) =
      __$$DeleteCardResetEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DeleteCardResetEventImplCopyWithImpl<$Res>
    extends _$DeleteCardEventCopyWithImpl<$Res, _$DeleteCardResetEventImpl>
    implements _$$DeleteCardResetEventImplCopyWith<$Res> {
  __$$DeleteCardResetEventImplCopyWithImpl(_$DeleteCardResetEventImpl _value,
      $Res Function(_$DeleteCardResetEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of DeleteCardEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$DeleteCardResetEventImpl implements DeleteCardResetEvent {
  const _$DeleteCardResetEventImpl();

  @override
  String toString() {
    return 'DeleteCardEvent.reset()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteCardResetEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id) deleteCard,
    required TResult Function() reset,
  }) {
    return reset();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id)? deleteCard,
    TResult? Function()? reset,
  }) {
    return reset?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id)? deleteCard,
    TResult Function()? reset,
    required TResult orElse(),
  }) {
    if (reset != null) {
      return reset();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DeleteCardEventClass value) deleteCard,
    required TResult Function(DeleteCardResetEvent value) reset,
  }) {
    return reset(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DeleteCardEventClass value)? deleteCard,
    TResult? Function(DeleteCardResetEvent value)? reset,
  }) {
    return reset?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DeleteCardEventClass value)? deleteCard,
    TResult Function(DeleteCardResetEvent value)? reset,
    required TResult orElse(),
  }) {
    if (reset != null) {
      return reset(this);
    }
    return orElse();
  }
}

abstract class DeleteCardResetEvent implements DeleteCardEvent {
  const factory DeleteCardResetEvent() = _$DeleteCardResetEventImpl;
}

/// @nodoc
mixin _$DeleteCardState {
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
    required TResult Function(_success value) success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initialState value)? initial,
    TResult? Function(_loadingState value)? loading,
    TResult? Function(_failedState value)? failed,
    TResult? Function(_success value)? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initialState value)? initial,
    TResult Function(_loadingState value)? loading,
    TResult Function(_failedState value)? failed,
    TResult Function(_success value)? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeleteCardStateCopyWith<$Res> {
  factory $DeleteCardStateCopyWith(
          DeleteCardState value, $Res Function(DeleteCardState) then) =
      _$DeleteCardStateCopyWithImpl<$Res, DeleteCardState>;
}

/// @nodoc
class _$DeleteCardStateCopyWithImpl<$Res, $Val extends DeleteCardState>
    implements $DeleteCardStateCopyWith<$Res> {
  _$DeleteCardStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DeleteCardState
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
    extends _$DeleteCardStateCopyWithImpl<$Res, _$initialStateImpl>
    implements _$$initialStateImplCopyWith<$Res> {
  __$$initialStateImplCopyWithImpl(
      _$initialStateImpl _value, $Res Function(_$initialStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of DeleteCardState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$initialStateImpl implements _initialState {
  const _$initialStateImpl();

  @override
  String toString() {
    return 'DeleteCardState.initial()';
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
    required TResult Function(_success value) success,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initialState value)? initial,
    TResult? Function(_loadingState value)? loading,
    TResult? Function(_failedState value)? failed,
    TResult? Function(_success value)? success,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initialState value)? initial,
    TResult Function(_loadingState value)? loading,
    TResult Function(_failedState value)? failed,
    TResult Function(_success value)? success,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _initialState implements DeleteCardState {
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
    extends _$DeleteCardStateCopyWithImpl<$Res, _$loadingStateImpl>
    implements _$$loadingStateImplCopyWith<$Res> {
  __$$loadingStateImplCopyWithImpl(
      _$loadingStateImpl _value, $Res Function(_$loadingStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of DeleteCardState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$loadingStateImpl implements _loadingState {
  const _$loadingStateImpl();

  @override
  String toString() {
    return 'DeleteCardState.loading()';
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
    required TResult Function(_success value) success,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initialState value)? initial,
    TResult? Function(_loadingState value)? loading,
    TResult? Function(_failedState value)? failed,
    TResult? Function(_success value)? success,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initialState value)? initial,
    TResult Function(_loadingState value)? loading,
    TResult Function(_failedState value)? failed,
    TResult Function(_success value)? success,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _loadingState implements DeleteCardState {
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
    extends _$DeleteCardStateCopyWithImpl<$Res, _$failedStateImpl>
    implements _$$failedStateImplCopyWith<$Res> {
  __$$failedStateImplCopyWithImpl(
      _$failedStateImpl _value, $Res Function(_$failedStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of DeleteCardState
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
    return 'DeleteCardState.failed(message: $message)';
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

  /// Create a copy of DeleteCardState
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
    required TResult Function(_success value) success,
  }) {
    return failed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initialState value)? initial,
    TResult? Function(_loadingState value)? loading,
    TResult? Function(_failedState value)? failed,
    TResult? Function(_success value)? success,
  }) {
    return failed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initialState value)? initial,
    TResult Function(_loadingState value)? loading,
    TResult Function(_failedState value)? failed,
    TResult Function(_success value)? success,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(this);
    }
    return orElse();
  }
}

abstract class _failedState implements DeleteCardState {
  const factory _failedState(final String message) = _$failedStateImpl;

  String get message;

  /// Create a copy of DeleteCardState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$failedStateImplCopyWith<_$failedStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$successImplCopyWith<$Res> {
  factory _$$successImplCopyWith(
          _$successImpl value, $Res Function(_$successImpl) then) =
      __$$successImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$successImplCopyWithImpl<$Res>
    extends _$DeleteCardStateCopyWithImpl<$Res, _$successImpl>
    implements _$$successImplCopyWith<$Res> {
  __$$successImplCopyWithImpl(
      _$successImpl _value, $Res Function(_$successImpl) _then)
      : super(_value, _then);

  /// Create a copy of DeleteCardState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$successImpl implements _success {
  const _$successImpl();

  @override
  String toString() {
    return 'DeleteCardState.success()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$successImpl);
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
    required TResult Function(_success value) success,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initialState value)? initial,
    TResult? Function(_loadingState value)? loading,
    TResult? Function(_failedState value)? failed,
    TResult? Function(_success value)? success,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initialState value)? initial,
    TResult Function(_loadingState value)? loading,
    TResult Function(_failedState value)? failed,
    TResult Function(_success value)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _success implements DeleteCardState {
  const factory _success() = _$successImpl;
}
