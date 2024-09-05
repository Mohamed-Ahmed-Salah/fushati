// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nfc_scanner_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$NfcScannerState {
  bool get isNfcAvailable => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isNfcAvailable) initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isNfcAvailable)? initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isNfcAvailable)? initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_initialState value) initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initialState value)? initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initialState value)? initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of NfcScannerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NfcScannerStateCopyWith<NfcScannerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NfcScannerStateCopyWith<$Res> {
  factory $NfcScannerStateCopyWith(
          NfcScannerState value, $Res Function(NfcScannerState) then) =
      _$NfcScannerStateCopyWithImpl<$Res, NfcScannerState>;
  @useResult
  $Res call({bool isNfcAvailable});
}

/// @nodoc
class _$NfcScannerStateCopyWithImpl<$Res, $Val extends NfcScannerState>
    implements $NfcScannerStateCopyWith<$Res> {
  _$NfcScannerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NfcScannerState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isNfcAvailable = null,
  }) {
    return _then(_value.copyWith(
      isNfcAvailable: null == isNfcAvailable
          ? _value.isNfcAvailable
          : isNfcAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$initialStateImplCopyWith<$Res>
    implements $NfcScannerStateCopyWith<$Res> {
  factory _$$initialStateImplCopyWith(
          _$initialStateImpl value, $Res Function(_$initialStateImpl) then) =
      __$$initialStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isNfcAvailable});
}

/// @nodoc
class __$$initialStateImplCopyWithImpl<$Res>
    extends _$NfcScannerStateCopyWithImpl<$Res, _$initialStateImpl>
    implements _$$initialStateImplCopyWith<$Res> {
  __$$initialStateImplCopyWithImpl(
      _$initialStateImpl _value, $Res Function(_$initialStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of NfcScannerState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isNfcAvailable = null,
  }) {
    return _then(_$initialStateImpl(
      isNfcAvailable: null == isNfcAvailable
          ? _value.isNfcAvailable
          : isNfcAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$initialStateImpl implements _initialState {
  const _$initialStateImpl({required this.isNfcAvailable});

  @override
  final bool isNfcAvailable;

  @override
  String toString() {
    return 'NfcScannerState.initial(isNfcAvailable: $isNfcAvailable)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$initialStateImpl &&
            (identical(other.isNfcAvailable, isNfcAvailable) ||
                other.isNfcAvailable == isNfcAvailable));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isNfcAvailable);

  /// Create a copy of NfcScannerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$initialStateImplCopyWith<_$initialStateImpl> get copyWith =>
      __$$initialStateImplCopyWithImpl<_$initialStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isNfcAvailable) initial,
  }) {
    return initial(isNfcAvailable);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isNfcAvailable)? initial,
  }) {
    return initial?.call(isNfcAvailable);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isNfcAvailable)? initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(isNfcAvailable);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_initialState value) initial,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initialState value)? initial,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initialState value)? initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _initialState implements NfcScannerState {
  const factory _initialState({required final bool isNfcAvailable}) =
      _$initialStateImpl;

  @override
  bool get isNfcAvailable;

  /// Create a copy of NfcScannerState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$initialStateImplCopyWith<_$initialStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
