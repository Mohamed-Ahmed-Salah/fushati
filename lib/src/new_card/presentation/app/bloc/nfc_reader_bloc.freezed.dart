// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nfc_reader_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$NfcReaderEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() readNfc,
    required TResult Function() resetToScanNewCard,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? readNfc,
    TResult? Function()? resetToScanNewCard,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? readNfc,
    TResult Function()? resetToScanNewCard,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(readCardNfcEvent value) readNfc,
    required TResult Function(resetCardNfcEvent value) resetToScanNewCard,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(readCardNfcEvent value)? readNfc,
    TResult? Function(resetCardNfcEvent value)? resetToScanNewCard,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(readCardNfcEvent value)? readNfc,
    TResult Function(resetCardNfcEvent value)? resetToScanNewCard,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NfcReaderEventCopyWith<$Res> {
  factory $NfcReaderEventCopyWith(
          NfcReaderEvent value, $Res Function(NfcReaderEvent) then) =
      _$NfcReaderEventCopyWithImpl<$Res, NfcReaderEvent>;
}

/// @nodoc
class _$NfcReaderEventCopyWithImpl<$Res, $Val extends NfcReaderEvent>
    implements $NfcReaderEventCopyWith<$Res> {
  _$NfcReaderEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NfcReaderEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$readCardNfcEventImplCopyWith<$Res> {
  factory _$$readCardNfcEventImplCopyWith(_$readCardNfcEventImpl value,
          $Res Function(_$readCardNfcEventImpl) then) =
      __$$readCardNfcEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$readCardNfcEventImplCopyWithImpl<$Res>
    extends _$NfcReaderEventCopyWithImpl<$Res, _$readCardNfcEventImpl>
    implements _$$readCardNfcEventImplCopyWith<$Res> {
  __$$readCardNfcEventImplCopyWithImpl(_$readCardNfcEventImpl _value,
      $Res Function(_$readCardNfcEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of NfcReaderEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$readCardNfcEventImpl implements readCardNfcEvent {
  const _$readCardNfcEventImpl();

  @override
  String toString() {
    return 'NfcReaderEvent.readNfc()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$readCardNfcEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() readNfc,
    required TResult Function() resetToScanNewCard,
  }) {
    return readNfc();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? readNfc,
    TResult? Function()? resetToScanNewCard,
  }) {
    return readNfc?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? readNfc,
    TResult Function()? resetToScanNewCard,
    required TResult orElse(),
  }) {
    if (readNfc != null) {
      return readNfc();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(readCardNfcEvent value) readNfc,
    required TResult Function(resetCardNfcEvent value) resetToScanNewCard,
  }) {
    return readNfc(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(readCardNfcEvent value)? readNfc,
    TResult? Function(resetCardNfcEvent value)? resetToScanNewCard,
  }) {
    return readNfc?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(readCardNfcEvent value)? readNfc,
    TResult Function(resetCardNfcEvent value)? resetToScanNewCard,
    required TResult orElse(),
  }) {
    if (readNfc != null) {
      return readNfc(this);
    }
    return orElse();
  }
}

abstract class readCardNfcEvent implements NfcReaderEvent {
  const factory readCardNfcEvent() = _$readCardNfcEventImpl;
}

/// @nodoc
abstract class _$$resetCardNfcEventImplCopyWith<$Res> {
  factory _$$resetCardNfcEventImplCopyWith(_$resetCardNfcEventImpl value,
          $Res Function(_$resetCardNfcEventImpl) then) =
      __$$resetCardNfcEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$resetCardNfcEventImplCopyWithImpl<$Res>
    extends _$NfcReaderEventCopyWithImpl<$Res, _$resetCardNfcEventImpl>
    implements _$$resetCardNfcEventImplCopyWith<$Res> {
  __$$resetCardNfcEventImplCopyWithImpl(_$resetCardNfcEventImpl _value,
      $Res Function(_$resetCardNfcEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of NfcReaderEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$resetCardNfcEventImpl implements resetCardNfcEvent {
  const _$resetCardNfcEventImpl();

  @override
  String toString() {
    return 'NfcReaderEvent.resetToScanNewCard()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$resetCardNfcEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() readNfc,
    required TResult Function() resetToScanNewCard,
  }) {
    return resetToScanNewCard();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? readNfc,
    TResult? Function()? resetToScanNewCard,
  }) {
    return resetToScanNewCard?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? readNfc,
    TResult Function()? resetToScanNewCard,
    required TResult orElse(),
  }) {
    if (resetToScanNewCard != null) {
      return resetToScanNewCard();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(readCardNfcEvent value) readNfc,
    required TResult Function(resetCardNfcEvent value) resetToScanNewCard,
  }) {
    return resetToScanNewCard(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(readCardNfcEvent value)? readNfc,
    TResult? Function(resetCardNfcEvent value)? resetToScanNewCard,
  }) {
    return resetToScanNewCard?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(readCardNfcEvent value)? readNfc,
    TResult Function(resetCardNfcEvent value)? resetToScanNewCard,
    required TResult orElse(),
  }) {
    if (resetToScanNewCard != null) {
      return resetToScanNewCard(this);
    }
    return orElse();
  }
}

abstract class resetCardNfcEvent implements NfcReaderEvent {
  const factory resetCardNfcEvent() = _$resetCardNfcEventImpl;
}

/// @nodoc
mixin _$NfcReaderState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) failed,
    required TResult Function(String card) success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? failed,
    TResult? Function(String card)? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? failed,
    TResult Function(String card)? success,
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
abstract class $NfcReaderStateCopyWith<$Res> {
  factory $NfcReaderStateCopyWith(
          NfcReaderState value, $Res Function(NfcReaderState) then) =
      _$NfcReaderStateCopyWithImpl<$Res, NfcReaderState>;
}

/// @nodoc
class _$NfcReaderStateCopyWithImpl<$Res, $Val extends NfcReaderState>
    implements $NfcReaderStateCopyWith<$Res> {
  _$NfcReaderStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NfcReaderState
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
    extends _$NfcReaderStateCopyWithImpl<$Res, _$initialStateImpl>
    implements _$$initialStateImplCopyWith<$Res> {
  __$$initialStateImplCopyWithImpl(
      _$initialStateImpl _value, $Res Function(_$initialStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of NfcReaderState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$initialStateImpl implements _initialState {
  const _$initialStateImpl();

  @override
  String toString() {
    return 'NfcReaderState.initial()';
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
    required TResult Function(String card) success,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? failed,
    TResult? Function(String card)? success,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? failed,
    TResult Function(String card)? success,
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

abstract class _initialState implements NfcReaderState {
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
    extends _$NfcReaderStateCopyWithImpl<$Res, _$loadingStateImpl>
    implements _$$loadingStateImplCopyWith<$Res> {
  __$$loadingStateImplCopyWithImpl(
      _$loadingStateImpl _value, $Res Function(_$loadingStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of NfcReaderState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$loadingStateImpl implements _loadingState {
  const _$loadingStateImpl();

  @override
  String toString() {
    return 'NfcReaderState.loading()';
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
    required TResult Function(String card) success,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? failed,
    TResult? Function(String card)? success,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? failed,
    TResult Function(String card)? success,
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

abstract class _loadingState implements NfcReaderState {
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
    extends _$NfcReaderStateCopyWithImpl<$Res, _$failedStateImpl>
    implements _$$failedStateImplCopyWith<$Res> {
  __$$failedStateImplCopyWithImpl(
      _$failedStateImpl _value, $Res Function(_$failedStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of NfcReaderState
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
    return 'NfcReaderState.failed(message: $message)';
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

  /// Create a copy of NfcReaderState
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
    required TResult Function(String card) success,
  }) {
    return failed(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? failed,
    TResult? Function(String card)? success,
  }) {
    return failed?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? failed,
    TResult Function(String card)? success,
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

abstract class _failedState implements NfcReaderState {
  const factory _failedState(final String message) = _$failedStateImpl;

  String get message;

  /// Create a copy of NfcReaderState
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
  @useResult
  $Res call({String card});
}

/// @nodoc
class __$$successImplCopyWithImpl<$Res>
    extends _$NfcReaderStateCopyWithImpl<$Res, _$successImpl>
    implements _$$successImplCopyWith<$Res> {
  __$$successImplCopyWithImpl(
      _$successImpl _value, $Res Function(_$successImpl) _then)
      : super(_value, _then);

  /// Create a copy of NfcReaderState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? card = null,
  }) {
    return _then(_$successImpl(
      null == card
          ? _value.card
          : card // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$successImpl implements _success {
  const _$successImpl(this.card);

  @override
  final String card;

  @override
  String toString() {
    return 'NfcReaderState.success(card: $card)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$successImpl &&
            (identical(other.card, card) || other.card == card));
  }

  @override
  int get hashCode => Object.hash(runtimeType, card);

  /// Create a copy of NfcReaderState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$successImplCopyWith<_$successImpl> get copyWith =>
      __$$successImplCopyWithImpl<_$successImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) failed,
    required TResult Function(String card) success,
  }) {
    return success(card);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? failed,
    TResult? Function(String card)? success,
  }) {
    return success?.call(card);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? failed,
    TResult Function(String card)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(card);
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

abstract class _success implements NfcReaderState {
  const factory _success(final String card) = _$successImpl;

  String get card;

  /// Create a copy of NfcReaderState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$successImplCopyWith<_$successImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
