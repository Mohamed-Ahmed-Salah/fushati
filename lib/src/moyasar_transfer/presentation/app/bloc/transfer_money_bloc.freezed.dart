// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transfer_money_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TransferMoneyEvent {
  int get amount => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int amount) addWallet,
    required TResult Function(
            dynamic result, BuildContext context, String cardNumber, int amount)
        addingAmount,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int amount)? addWallet,
    TResult? Function(dynamic result, BuildContext context, String cardNumber,
            int amount)?
        addingAmount,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int amount)? addWallet,
    TResult Function(dynamic result, BuildContext context, String cardNumber,
            int amount)?
        addingAmount,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AddWalletEvent value) addWallet,
    required TResult Function(AddingAmountEvent value) addingAmount,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AddWalletEvent value)? addWallet,
    TResult? Function(AddingAmountEvent value)? addingAmount,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AddWalletEvent value)? addWallet,
    TResult Function(AddingAmountEvent value)? addingAmount,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of TransferMoneyEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TransferMoneyEventCopyWith<TransferMoneyEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransferMoneyEventCopyWith<$Res> {
  factory $TransferMoneyEventCopyWith(
          TransferMoneyEvent value, $Res Function(TransferMoneyEvent) then) =
      _$TransferMoneyEventCopyWithImpl<$Res, TransferMoneyEvent>;
  @useResult
  $Res call({int amount});
}

/// @nodoc
class _$TransferMoneyEventCopyWithImpl<$Res, $Val extends TransferMoneyEvent>
    implements $TransferMoneyEventCopyWith<$Res> {
  _$TransferMoneyEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TransferMoneyEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = null,
  }) {
    return _then(_value.copyWith(
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AddWalletEventImplCopyWith<$Res>
    implements $TransferMoneyEventCopyWith<$Res> {
  factory _$$AddWalletEventImplCopyWith(_$AddWalletEventImpl value,
          $Res Function(_$AddWalletEventImpl) then) =
      __$$AddWalletEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int amount});
}

/// @nodoc
class __$$AddWalletEventImplCopyWithImpl<$Res>
    extends _$TransferMoneyEventCopyWithImpl<$Res, _$AddWalletEventImpl>
    implements _$$AddWalletEventImplCopyWith<$Res> {
  __$$AddWalletEventImplCopyWithImpl(
      _$AddWalletEventImpl _value, $Res Function(_$AddWalletEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of TransferMoneyEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = null,
  }) {
    return _then(_$AddWalletEventImpl(
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$AddWalletEventImpl implements AddWalletEvent {
  const _$AddWalletEventImpl({required this.amount});

  @override
  final int amount;

  @override
  String toString() {
    return 'TransferMoneyEvent.addWallet(amount: $amount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddWalletEventImpl &&
            (identical(other.amount, amount) || other.amount == amount));
  }

  @override
  int get hashCode => Object.hash(runtimeType, amount);

  /// Create a copy of TransferMoneyEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddWalletEventImplCopyWith<_$AddWalletEventImpl> get copyWith =>
      __$$AddWalletEventImplCopyWithImpl<_$AddWalletEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int amount) addWallet,
    required TResult Function(
            dynamic result, BuildContext context, String cardNumber, int amount)
        addingAmount,
  }) {
    return addWallet(amount);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int amount)? addWallet,
    TResult? Function(dynamic result, BuildContext context, String cardNumber,
            int amount)?
        addingAmount,
  }) {
    return addWallet?.call(amount);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int amount)? addWallet,
    TResult Function(dynamic result, BuildContext context, String cardNumber,
            int amount)?
        addingAmount,
    required TResult orElse(),
  }) {
    if (addWallet != null) {
      return addWallet(amount);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AddWalletEvent value) addWallet,
    required TResult Function(AddingAmountEvent value) addingAmount,
  }) {
    return addWallet(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AddWalletEvent value)? addWallet,
    TResult? Function(AddingAmountEvent value)? addingAmount,
  }) {
    return addWallet?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AddWalletEvent value)? addWallet,
    TResult Function(AddingAmountEvent value)? addingAmount,
    required TResult orElse(),
  }) {
    if (addWallet != null) {
      return addWallet(this);
    }
    return orElse();
  }
}

abstract class AddWalletEvent implements TransferMoneyEvent {
  const factory AddWalletEvent({required final int amount}) =
      _$AddWalletEventImpl;

  @override
  int get amount;

  /// Create a copy of TransferMoneyEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddWalletEventImplCopyWith<_$AddWalletEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AddingAmountEventImplCopyWith<$Res>
    implements $TransferMoneyEventCopyWith<$Res> {
  factory _$$AddingAmountEventImplCopyWith(_$AddingAmountEventImpl value,
          $Res Function(_$AddingAmountEventImpl) then) =
      __$$AddingAmountEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {dynamic result, BuildContext context, String cardNumber, int amount});
}

/// @nodoc
class __$$AddingAmountEventImplCopyWithImpl<$Res>
    extends _$TransferMoneyEventCopyWithImpl<$Res, _$AddingAmountEventImpl>
    implements _$$AddingAmountEventImplCopyWith<$Res> {
  __$$AddingAmountEventImplCopyWithImpl(_$AddingAmountEventImpl _value,
      $Res Function(_$AddingAmountEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of TransferMoneyEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = freezed,
    Object? context = null,
    Object? cardNumber = null,
    Object? amount = null,
  }) {
    return _then(_$AddingAmountEventImpl(
      result: freezed == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as dynamic,
      context: null == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
      cardNumber: null == cardNumber
          ? _value.cardNumber
          : cardNumber // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$AddingAmountEventImpl implements AddingAmountEvent {
  const _$AddingAmountEventImpl(
      {required this.result,
      required this.context,
      required this.cardNumber,
      required this.amount});

  @override
  final dynamic result;
  @override
  final BuildContext context;
  @override
  final String cardNumber;
  @override
  final int amount;

  @override
  String toString() {
    return 'TransferMoneyEvent.addingAmount(result: $result, context: $context, cardNumber: $cardNumber, amount: $amount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddingAmountEventImpl &&
            const DeepCollectionEquality().equals(other.result, result) &&
            (identical(other.context, context) || other.context == context) &&
            (identical(other.cardNumber, cardNumber) ||
                other.cardNumber == cardNumber) &&
            (identical(other.amount, amount) || other.amount == amount));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(result), context, cardNumber, amount);

  /// Create a copy of TransferMoneyEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddingAmountEventImplCopyWith<_$AddingAmountEventImpl> get copyWith =>
      __$$AddingAmountEventImplCopyWithImpl<_$AddingAmountEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int amount) addWallet,
    required TResult Function(
            dynamic result, BuildContext context, String cardNumber, int amount)
        addingAmount,
  }) {
    return addingAmount(result, context, cardNumber, amount);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int amount)? addWallet,
    TResult? Function(dynamic result, BuildContext context, String cardNumber,
            int amount)?
        addingAmount,
  }) {
    return addingAmount?.call(result, context, cardNumber, amount);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int amount)? addWallet,
    TResult Function(dynamic result, BuildContext context, String cardNumber,
            int amount)?
        addingAmount,
    required TResult orElse(),
  }) {
    if (addingAmount != null) {
      return addingAmount(result, context, cardNumber, amount);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AddWalletEvent value) addWallet,
    required TResult Function(AddingAmountEvent value) addingAmount,
  }) {
    return addingAmount(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AddWalletEvent value)? addWallet,
    TResult? Function(AddingAmountEvent value)? addingAmount,
  }) {
    return addingAmount?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AddWalletEvent value)? addWallet,
    TResult Function(AddingAmountEvent value)? addingAmount,
    required TResult orElse(),
  }) {
    if (addingAmount != null) {
      return addingAmount(this);
    }
    return orElse();
  }
}

abstract class AddingAmountEvent implements TransferMoneyEvent {
  const factory AddingAmountEvent(
      {required final dynamic result,
      required final BuildContext context,
      required final String cardNumber,
      required final int amount}) = _$AddingAmountEventImpl;

  dynamic get result;
  BuildContext get context;
  String get cardNumber;
  @override
  int get amount;

  /// Create a copy of TransferMoneyEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddingAmountEventImplCopyWith<_$AddingAmountEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$TransferMoneyState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int amount) loading,
    required TResult Function(String error) failed,
    required TResult Function(TransactionResponse transaction) successState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int amount)? loading,
    TResult? Function(String error)? failed,
    TResult? Function(TransactionResponse transaction)? successState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int amount)? loading,
    TResult Function(String error)? failed,
    TResult Function(TransactionResponse transaction)? successState,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_loadingState value) loading,
    required TResult Function(_failedState value) failed,
    required TResult Function(_suceessState value) successState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_loadingState value)? loading,
    TResult? Function(_failedState value)? failed,
    TResult? Function(_suceessState value)? successState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_loadingState value)? loading,
    TResult Function(_failedState value)? failed,
    TResult Function(_suceessState value)? successState,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransferMoneyStateCopyWith<$Res> {
  factory $TransferMoneyStateCopyWith(
          TransferMoneyState value, $Res Function(TransferMoneyState) then) =
      _$TransferMoneyStateCopyWithImpl<$Res, TransferMoneyState>;
}

/// @nodoc
class _$TransferMoneyStateCopyWithImpl<$Res, $Val extends TransferMoneyState>
    implements $TransferMoneyStateCopyWith<$Res> {
  _$TransferMoneyStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TransferMoneyState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$loadingStateImplCopyWith<$Res> {
  factory _$$loadingStateImplCopyWith(
          _$loadingStateImpl value, $Res Function(_$loadingStateImpl) then) =
      __$$loadingStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int amount});
}

/// @nodoc
class __$$loadingStateImplCopyWithImpl<$Res>
    extends _$TransferMoneyStateCopyWithImpl<$Res, _$loadingStateImpl>
    implements _$$loadingStateImplCopyWith<$Res> {
  __$$loadingStateImplCopyWithImpl(
      _$loadingStateImpl _value, $Res Function(_$loadingStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of TransferMoneyState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = null,
  }) {
    return _then(_$loadingStateImpl(
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$loadingStateImpl implements _loadingState {
  const _$loadingStateImpl({this.amount = 0});

  @override
  @JsonKey()
  final int amount;

  @override
  String toString() {
    return 'TransferMoneyState.loading(amount: $amount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$loadingStateImpl &&
            (identical(other.amount, amount) || other.amount == amount));
  }

  @override
  int get hashCode => Object.hash(runtimeType, amount);

  /// Create a copy of TransferMoneyState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$loadingStateImplCopyWith<_$loadingStateImpl> get copyWith =>
      __$$loadingStateImplCopyWithImpl<_$loadingStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int amount) loading,
    required TResult Function(String error) failed,
    required TResult Function(TransactionResponse transaction) successState,
  }) {
    return loading(amount);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int amount)? loading,
    TResult? Function(String error)? failed,
    TResult? Function(TransactionResponse transaction)? successState,
  }) {
    return loading?.call(amount);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int amount)? loading,
    TResult Function(String error)? failed,
    TResult Function(TransactionResponse transaction)? successState,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(amount);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_loadingState value) loading,
    required TResult Function(_failedState value) failed,
    required TResult Function(_suceessState value) successState,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_loadingState value)? loading,
    TResult? Function(_failedState value)? failed,
    TResult? Function(_suceessState value)? successState,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_loadingState value)? loading,
    TResult Function(_failedState value)? failed,
    TResult Function(_suceessState value)? successState,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _loadingState implements TransferMoneyState {
  const factory _loadingState({final int amount}) = _$loadingStateImpl;

  int get amount;

  /// Create a copy of TransferMoneyState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$loadingStateImplCopyWith<_$loadingStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$failedStateImplCopyWith<$Res> {
  factory _$$failedStateImplCopyWith(
          _$failedStateImpl value, $Res Function(_$failedStateImpl) then) =
      __$$failedStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$failedStateImplCopyWithImpl<$Res>
    extends _$TransferMoneyStateCopyWithImpl<$Res, _$failedStateImpl>
    implements _$$failedStateImplCopyWith<$Res> {
  __$$failedStateImplCopyWithImpl(
      _$failedStateImpl _value, $Res Function(_$failedStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of TransferMoneyState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$failedStateImpl(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$failedStateImpl implements _failedState {
  const _$failedStateImpl(this.error);

  @override
  final String error;

  @override
  String toString() {
    return 'TransferMoneyState.failed(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$failedStateImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  /// Create a copy of TransferMoneyState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$failedStateImplCopyWith<_$failedStateImpl> get copyWith =>
      __$$failedStateImplCopyWithImpl<_$failedStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int amount) loading,
    required TResult Function(String error) failed,
    required TResult Function(TransactionResponse transaction) successState,
  }) {
    return failed(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int amount)? loading,
    TResult? Function(String error)? failed,
    TResult? Function(TransactionResponse transaction)? successState,
  }) {
    return failed?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int amount)? loading,
    TResult Function(String error)? failed,
    TResult Function(TransactionResponse transaction)? successState,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_loadingState value) loading,
    required TResult Function(_failedState value) failed,
    required TResult Function(_suceessState value) successState,
  }) {
    return failed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_loadingState value)? loading,
    TResult? Function(_failedState value)? failed,
    TResult? Function(_suceessState value)? successState,
  }) {
    return failed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_loadingState value)? loading,
    TResult Function(_failedState value)? failed,
    TResult Function(_suceessState value)? successState,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(this);
    }
    return orElse();
  }
}

abstract class _failedState implements TransferMoneyState {
  const factory _failedState(final String error) = _$failedStateImpl;

  String get error;

  /// Create a copy of TransferMoneyState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$failedStateImplCopyWith<_$failedStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$suceessStateImplCopyWith<$Res> {
  factory _$$suceessStateImplCopyWith(
          _$suceessStateImpl value, $Res Function(_$suceessStateImpl) then) =
      __$$suceessStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({TransactionResponse transaction});
}

/// @nodoc
class __$$suceessStateImplCopyWithImpl<$Res>
    extends _$TransferMoneyStateCopyWithImpl<$Res, _$suceessStateImpl>
    implements _$$suceessStateImplCopyWith<$Res> {
  __$$suceessStateImplCopyWithImpl(
      _$suceessStateImpl _value, $Res Function(_$suceessStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of TransferMoneyState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transaction = null,
  }) {
    return _then(_$suceessStateImpl(
      transaction: null == transaction
          ? _value.transaction
          : transaction // ignore: cast_nullable_to_non_nullable
              as TransactionResponse,
    ));
  }
}

/// @nodoc

class _$suceessStateImpl implements _suceessState {
  const _$suceessStateImpl({required this.transaction});

  @override
  final TransactionResponse transaction;

  @override
  String toString() {
    return 'TransferMoneyState.successState(transaction: $transaction)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$suceessStateImpl &&
            (identical(other.transaction, transaction) ||
                other.transaction == transaction));
  }

  @override
  int get hashCode => Object.hash(runtimeType, transaction);

  /// Create a copy of TransferMoneyState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$suceessStateImplCopyWith<_$suceessStateImpl> get copyWith =>
      __$$suceessStateImplCopyWithImpl<_$suceessStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int amount) loading,
    required TResult Function(String error) failed,
    required TResult Function(TransactionResponse transaction) successState,
  }) {
    return successState(transaction);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int amount)? loading,
    TResult? Function(String error)? failed,
    TResult? Function(TransactionResponse transaction)? successState,
  }) {
    return successState?.call(transaction);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int amount)? loading,
    TResult Function(String error)? failed,
    TResult Function(TransactionResponse transaction)? successState,
    required TResult orElse(),
  }) {
    if (successState != null) {
      return successState(transaction);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_loadingState value) loading,
    required TResult Function(_failedState value) failed,
    required TResult Function(_suceessState value) successState,
  }) {
    return successState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_loadingState value)? loading,
    TResult? Function(_failedState value)? failed,
    TResult? Function(_suceessState value)? successState,
  }) {
    return successState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_loadingState value)? loading,
    TResult Function(_failedState value)? failed,
    TResult Function(_suceessState value)? successState,
    required TResult orElse(),
  }) {
    if (successState != null) {
      return successState(this);
    }
    return orElse();
  }
}

abstract class _suceessState implements TransferMoneyState {
  const factory _suceessState(
      {required final TransactionResponse transaction}) = _$suceessStateImpl;

  TransactionResponse get transaction;

  /// Create a copy of TransferMoneyState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$suceessStateImplCopyWith<_$suceessStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
