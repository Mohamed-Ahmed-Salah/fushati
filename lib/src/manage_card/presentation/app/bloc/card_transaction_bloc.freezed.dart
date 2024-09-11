// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'card_transaction_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CardTransactionBlocEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String cardNumber) getCardTransaction,
    required TResult Function() resetCardTransaction,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String cardNumber)? getCardTransaction,
    TResult? Function()? resetCardTransaction,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String cardNumber)? getCardTransaction,
    TResult Function()? resetCardTransaction,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetCardTransactionEvent value) getCardTransaction,
    required TResult Function(ResetRecievedCardTransactionsEvent value)
        resetCardTransaction,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetCardTransactionEvent value)? getCardTransaction,
    TResult? Function(ResetRecievedCardTransactionsEvent value)?
        resetCardTransaction,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetCardTransactionEvent value)? getCardTransaction,
    TResult Function(ResetRecievedCardTransactionsEvent value)?
        resetCardTransaction,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CardTransactionBlocEventCopyWith<$Res> {
  factory $CardTransactionBlocEventCopyWith(CardTransactionBlocEvent value,
          $Res Function(CardTransactionBlocEvent) then) =
      _$CardTransactionBlocEventCopyWithImpl<$Res, CardTransactionBlocEvent>;
}

/// @nodoc
class _$CardTransactionBlocEventCopyWithImpl<$Res,
        $Val extends CardTransactionBlocEvent>
    implements $CardTransactionBlocEventCopyWith<$Res> {
  _$CardTransactionBlocEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CardTransactionBlocEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$GetCardTransactionEventImplCopyWith<$Res> {
  factory _$$GetCardTransactionEventImplCopyWith(
          _$GetCardTransactionEventImpl value,
          $Res Function(_$GetCardTransactionEventImpl) then) =
      __$$GetCardTransactionEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String cardNumber});
}

/// @nodoc
class __$$GetCardTransactionEventImplCopyWithImpl<$Res>
    extends _$CardTransactionBlocEventCopyWithImpl<$Res,
        _$GetCardTransactionEventImpl>
    implements _$$GetCardTransactionEventImplCopyWith<$Res> {
  __$$GetCardTransactionEventImplCopyWithImpl(
      _$GetCardTransactionEventImpl _value,
      $Res Function(_$GetCardTransactionEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of CardTransactionBlocEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cardNumber = null,
  }) {
    return _then(_$GetCardTransactionEventImpl(
      cardNumber: null == cardNumber
          ? _value.cardNumber
          : cardNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GetCardTransactionEventImpl implements GetCardTransactionEvent {
  const _$GetCardTransactionEventImpl({required this.cardNumber});

  @override
  final String cardNumber;

  @override
  String toString() {
    return 'CardTransactionBlocEvent.getCardTransaction(cardNumber: $cardNumber)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetCardTransactionEventImpl &&
            (identical(other.cardNumber, cardNumber) ||
                other.cardNumber == cardNumber));
  }

  @override
  int get hashCode => Object.hash(runtimeType, cardNumber);

  /// Create a copy of CardTransactionBlocEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetCardTransactionEventImplCopyWith<_$GetCardTransactionEventImpl>
      get copyWith => __$$GetCardTransactionEventImplCopyWithImpl<
          _$GetCardTransactionEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String cardNumber) getCardTransaction,
    required TResult Function() resetCardTransaction,
  }) {
    return getCardTransaction(cardNumber);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String cardNumber)? getCardTransaction,
    TResult? Function()? resetCardTransaction,
  }) {
    return getCardTransaction?.call(cardNumber);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String cardNumber)? getCardTransaction,
    TResult Function()? resetCardTransaction,
    required TResult orElse(),
  }) {
    if (getCardTransaction != null) {
      return getCardTransaction(cardNumber);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetCardTransactionEvent value) getCardTransaction,
    required TResult Function(ResetRecievedCardTransactionsEvent value)
        resetCardTransaction,
  }) {
    return getCardTransaction(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetCardTransactionEvent value)? getCardTransaction,
    TResult? Function(ResetRecievedCardTransactionsEvent value)?
        resetCardTransaction,
  }) {
    return getCardTransaction?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetCardTransactionEvent value)? getCardTransaction,
    TResult Function(ResetRecievedCardTransactionsEvent value)?
        resetCardTransaction,
    required TResult orElse(),
  }) {
    if (getCardTransaction != null) {
      return getCardTransaction(this);
    }
    return orElse();
  }
}

abstract class GetCardTransactionEvent implements CardTransactionBlocEvent {
  const factory GetCardTransactionEvent({required final String cardNumber}) =
      _$GetCardTransactionEventImpl;

  String get cardNumber;

  /// Create a copy of CardTransactionBlocEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetCardTransactionEventImplCopyWith<_$GetCardTransactionEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ResetRecievedCardTransactionsEventImplCopyWith<$Res> {
  factory _$$ResetRecievedCardTransactionsEventImplCopyWith(
          _$ResetRecievedCardTransactionsEventImpl value,
          $Res Function(_$ResetRecievedCardTransactionsEventImpl) then) =
      __$$ResetRecievedCardTransactionsEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ResetRecievedCardTransactionsEventImplCopyWithImpl<$Res>
    extends _$CardTransactionBlocEventCopyWithImpl<$Res,
        _$ResetRecievedCardTransactionsEventImpl>
    implements _$$ResetRecievedCardTransactionsEventImplCopyWith<$Res> {
  __$$ResetRecievedCardTransactionsEventImplCopyWithImpl(
      _$ResetRecievedCardTransactionsEventImpl _value,
      $Res Function(_$ResetRecievedCardTransactionsEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of CardTransactionBlocEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ResetRecievedCardTransactionsEventImpl
    implements ResetRecievedCardTransactionsEvent {
  const _$ResetRecievedCardTransactionsEventImpl();

  @override
  String toString() {
    return 'CardTransactionBlocEvent.resetCardTransaction()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResetRecievedCardTransactionsEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String cardNumber) getCardTransaction,
    required TResult Function() resetCardTransaction,
  }) {
    return resetCardTransaction();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String cardNumber)? getCardTransaction,
    TResult? Function()? resetCardTransaction,
  }) {
    return resetCardTransaction?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String cardNumber)? getCardTransaction,
    TResult Function()? resetCardTransaction,
    required TResult orElse(),
  }) {
    if (resetCardTransaction != null) {
      return resetCardTransaction();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetCardTransactionEvent value) getCardTransaction,
    required TResult Function(ResetRecievedCardTransactionsEvent value)
        resetCardTransaction,
  }) {
    return resetCardTransaction(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetCardTransactionEvent value)? getCardTransaction,
    TResult? Function(ResetRecievedCardTransactionsEvent value)?
        resetCardTransaction,
  }) {
    return resetCardTransaction?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetCardTransactionEvent value)? getCardTransaction,
    TResult Function(ResetRecievedCardTransactionsEvent value)?
        resetCardTransaction,
    required TResult orElse(),
  }) {
    if (resetCardTransaction != null) {
      return resetCardTransaction(this);
    }
    return orElse();
  }
}

abstract class ResetRecievedCardTransactionsEvent
    implements CardTransactionBlocEvent {
  const factory ResetRecievedCardTransactionsEvent() =
      _$ResetRecievedCardTransactionsEventImpl;
}

/// @nodoc
mixin _$CardTransactionBlocState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(
            List<Transaction> transactions, int currentPage, int maxPage)
        loading,
    required TResult Function(String message, List<Transaction> transactions,
            int currentPage, int maxPage)
        failed,
    required TResult Function(
            List<Transaction> transactions, int currentPage, int maxPage)
        success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(
            List<Transaction> transactions, int currentPage, int maxPage)?
        loading,
    TResult? Function(String message, List<Transaction> transactions,
            int currentPage, int maxPage)?
        failed,
    TResult? Function(
            List<Transaction> transactions, int currentPage, int maxPage)?
        success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(
            List<Transaction> transactions, int currentPage, int maxPage)?
        loading,
    TResult Function(String message, List<Transaction> transactions,
            int currentPage, int maxPage)?
        failed,
    TResult Function(
            List<Transaction> transactions, int currentPage, int maxPage)?
        success,
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
abstract class $CardTransactionBlocStateCopyWith<$Res> {
  factory $CardTransactionBlocStateCopyWith(CardTransactionBlocState value,
          $Res Function(CardTransactionBlocState) then) =
      _$CardTransactionBlocStateCopyWithImpl<$Res, CardTransactionBlocState>;
}

/// @nodoc
class _$CardTransactionBlocStateCopyWithImpl<$Res,
        $Val extends CardTransactionBlocState>
    implements $CardTransactionBlocStateCopyWith<$Res> {
  _$CardTransactionBlocStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CardTransactionBlocState
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
    extends _$CardTransactionBlocStateCopyWithImpl<$Res, _$initialStateImpl>
    implements _$$initialStateImplCopyWith<$Res> {
  __$$initialStateImplCopyWithImpl(
      _$initialStateImpl _value, $Res Function(_$initialStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of CardTransactionBlocState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$initialStateImpl implements _initialState {
  const _$initialStateImpl();

  @override
  String toString() {
    return 'CardTransactionBlocState.initial()';
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
    required TResult Function(
            List<Transaction> transactions, int currentPage, int maxPage)
        loading,
    required TResult Function(String message, List<Transaction> transactions,
            int currentPage, int maxPage)
        failed,
    required TResult Function(
            List<Transaction> transactions, int currentPage, int maxPage)
        success,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(
            List<Transaction> transactions, int currentPage, int maxPage)?
        loading,
    TResult? Function(String message, List<Transaction> transactions,
            int currentPage, int maxPage)?
        failed,
    TResult? Function(
            List<Transaction> transactions, int currentPage, int maxPage)?
        success,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(
            List<Transaction> transactions, int currentPage, int maxPage)?
        loading,
    TResult Function(String message, List<Transaction> transactions,
            int currentPage, int maxPage)?
        failed,
    TResult Function(
            List<Transaction> transactions, int currentPage, int maxPage)?
        success,
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

abstract class _initialState implements CardTransactionBlocState {
  const factory _initialState() = _$initialStateImpl;
}

/// @nodoc
abstract class _$$loadingStateImplCopyWith<$Res> {
  factory _$$loadingStateImplCopyWith(
          _$loadingStateImpl value, $Res Function(_$loadingStateImpl) then) =
      __$$loadingStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Transaction> transactions, int currentPage, int maxPage});
}

/// @nodoc
class __$$loadingStateImplCopyWithImpl<$Res>
    extends _$CardTransactionBlocStateCopyWithImpl<$Res, _$loadingStateImpl>
    implements _$$loadingStateImplCopyWith<$Res> {
  __$$loadingStateImplCopyWithImpl(
      _$loadingStateImpl _value, $Res Function(_$loadingStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of CardTransactionBlocState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactions = null,
    Object? currentPage = null,
    Object? maxPage = null,
  }) {
    return _then(_$loadingStateImpl(
      transactions: null == transactions
          ? _value._transactions
          : transactions // ignore: cast_nullable_to_non_nullable
              as List<Transaction>,
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      maxPage: null == maxPage
          ? _value.maxPage
          : maxPage // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$loadingStateImpl implements _loadingState {
  const _$loadingStateImpl(
      {required final List<Transaction> transactions,
      required this.currentPage,
      required this.maxPage})
      : _transactions = transactions;

  final List<Transaction> _transactions;
  @override
  List<Transaction> get transactions {
    if (_transactions is EqualUnmodifiableListView) return _transactions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_transactions);
  }

  @override
  final int currentPage;
  @override
  final int maxPage;

  @override
  String toString() {
    return 'CardTransactionBlocState.loading(transactions: $transactions, currentPage: $currentPage, maxPage: $maxPage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$loadingStateImpl &&
            const DeepCollectionEquality()
                .equals(other._transactions, _transactions) &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.maxPage, maxPage) || other.maxPage == maxPage));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_transactions), currentPage, maxPage);

  /// Create a copy of CardTransactionBlocState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$loadingStateImplCopyWith<_$loadingStateImpl> get copyWith =>
      __$$loadingStateImplCopyWithImpl<_$loadingStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(
            List<Transaction> transactions, int currentPage, int maxPage)
        loading,
    required TResult Function(String message, List<Transaction> transactions,
            int currentPage, int maxPage)
        failed,
    required TResult Function(
            List<Transaction> transactions, int currentPage, int maxPage)
        success,
  }) {
    return loading(transactions, currentPage, maxPage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(
            List<Transaction> transactions, int currentPage, int maxPage)?
        loading,
    TResult? Function(String message, List<Transaction> transactions,
            int currentPage, int maxPage)?
        failed,
    TResult? Function(
            List<Transaction> transactions, int currentPage, int maxPage)?
        success,
  }) {
    return loading?.call(transactions, currentPage, maxPage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(
            List<Transaction> transactions, int currentPage, int maxPage)?
        loading,
    TResult Function(String message, List<Transaction> transactions,
            int currentPage, int maxPage)?
        failed,
    TResult Function(
            List<Transaction> transactions, int currentPage, int maxPage)?
        success,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(transactions, currentPage, maxPage);
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

abstract class _loadingState implements CardTransactionBlocState {
  const factory _loadingState(
      {required final List<Transaction> transactions,
      required final int currentPage,
      required final int maxPage}) = _$loadingStateImpl;

  List<Transaction> get transactions;
  int get currentPage;
  int get maxPage;

  /// Create a copy of CardTransactionBlocState
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
  $Res call(
      {String message,
      List<Transaction> transactions,
      int currentPage,
      int maxPage});
}

/// @nodoc
class __$$failedStateImplCopyWithImpl<$Res>
    extends _$CardTransactionBlocStateCopyWithImpl<$Res, _$failedStateImpl>
    implements _$$failedStateImplCopyWith<$Res> {
  __$$failedStateImplCopyWithImpl(
      _$failedStateImpl _value, $Res Function(_$failedStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of CardTransactionBlocState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? transactions = null,
    Object? currentPage = null,
    Object? maxPage = null,
  }) {
    return _then(_$failedStateImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      transactions: null == transactions
          ? _value._transactions
          : transactions // ignore: cast_nullable_to_non_nullable
              as List<Transaction>,
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      maxPage: null == maxPage
          ? _value.maxPage
          : maxPage // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$failedStateImpl implements _failedState {
  const _$failedStateImpl(
      {required this.message,
      required final List<Transaction> transactions,
      required this.currentPage,
      required this.maxPage})
      : _transactions = transactions;

  @override
  final String message;
  final List<Transaction> _transactions;
  @override
  List<Transaction> get transactions {
    if (_transactions is EqualUnmodifiableListView) return _transactions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_transactions);
  }

  @override
  final int currentPage;
  @override
  final int maxPage;

  @override
  String toString() {
    return 'CardTransactionBlocState.failed(message: $message, transactions: $transactions, currentPage: $currentPage, maxPage: $maxPage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$failedStateImpl &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality()
                .equals(other._transactions, _transactions) &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.maxPage, maxPage) || other.maxPage == maxPage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message,
      const DeepCollectionEquality().hash(_transactions), currentPage, maxPage);

  /// Create a copy of CardTransactionBlocState
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
    required TResult Function(
            List<Transaction> transactions, int currentPage, int maxPage)
        loading,
    required TResult Function(String message, List<Transaction> transactions,
            int currentPage, int maxPage)
        failed,
    required TResult Function(
            List<Transaction> transactions, int currentPage, int maxPage)
        success,
  }) {
    return failed(message, transactions, currentPage, maxPage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(
            List<Transaction> transactions, int currentPage, int maxPage)?
        loading,
    TResult? Function(String message, List<Transaction> transactions,
            int currentPage, int maxPage)?
        failed,
    TResult? Function(
            List<Transaction> transactions, int currentPage, int maxPage)?
        success,
  }) {
    return failed?.call(message, transactions, currentPage, maxPage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(
            List<Transaction> transactions, int currentPage, int maxPage)?
        loading,
    TResult Function(String message, List<Transaction> transactions,
            int currentPage, int maxPage)?
        failed,
    TResult Function(
            List<Transaction> transactions, int currentPage, int maxPage)?
        success,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(message, transactions, currentPage, maxPage);
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

abstract class _failedState implements CardTransactionBlocState {
  const factory _failedState(
      {required final String message,
      required final List<Transaction> transactions,
      required final int currentPage,
      required final int maxPage}) = _$failedStateImpl;

  String get message;
  List<Transaction> get transactions;
  int get currentPage;
  int get maxPage;

  /// Create a copy of CardTransactionBlocState
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
  @useResult
  $Res call({List<Transaction> transactions, int currentPage, int maxPage});
}

/// @nodoc
class __$$successStateImplCopyWithImpl<$Res>
    extends _$CardTransactionBlocStateCopyWithImpl<$Res, _$successStateImpl>
    implements _$$successStateImplCopyWith<$Res> {
  __$$successStateImplCopyWithImpl(
      _$successStateImpl _value, $Res Function(_$successStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of CardTransactionBlocState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactions = null,
    Object? currentPage = null,
    Object? maxPage = null,
  }) {
    return _then(_$successStateImpl(
      transactions: null == transactions
          ? _value._transactions
          : transactions // ignore: cast_nullable_to_non_nullable
              as List<Transaction>,
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      maxPage: null == maxPage
          ? _value.maxPage
          : maxPage // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$successStateImpl implements _successState {
  const _$successStateImpl(
      {required final List<Transaction> transactions,
      required this.currentPage,
      required this.maxPage})
      : _transactions = transactions;

  final List<Transaction> _transactions;
  @override
  List<Transaction> get transactions {
    if (_transactions is EqualUnmodifiableListView) return _transactions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_transactions);
  }

  @override
  final int currentPage;
  @override
  final int maxPage;

  @override
  String toString() {
    return 'CardTransactionBlocState.success(transactions: $transactions, currentPage: $currentPage, maxPage: $maxPage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$successStateImpl &&
            const DeepCollectionEquality()
                .equals(other._transactions, _transactions) &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.maxPage, maxPage) || other.maxPage == maxPage));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_transactions), currentPage, maxPage);

  /// Create a copy of CardTransactionBlocState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$successStateImplCopyWith<_$successStateImpl> get copyWith =>
      __$$successStateImplCopyWithImpl<_$successStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(
            List<Transaction> transactions, int currentPage, int maxPage)
        loading,
    required TResult Function(String message, List<Transaction> transactions,
            int currentPage, int maxPage)
        failed,
    required TResult Function(
            List<Transaction> transactions, int currentPage, int maxPage)
        success,
  }) {
    return success(transactions, currentPage, maxPage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(
            List<Transaction> transactions, int currentPage, int maxPage)?
        loading,
    TResult? Function(String message, List<Transaction> transactions,
            int currentPage, int maxPage)?
        failed,
    TResult? Function(
            List<Transaction> transactions, int currentPage, int maxPage)?
        success,
  }) {
    return success?.call(transactions, currentPage, maxPage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(
            List<Transaction> transactions, int currentPage, int maxPage)?
        loading,
    TResult Function(String message, List<Transaction> transactions,
            int currentPage, int maxPage)?
        failed,
    TResult Function(
            List<Transaction> transactions, int currentPage, int maxPage)?
        success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(transactions, currentPage, maxPage);
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

abstract class _successState implements CardTransactionBlocState {
  const factory _successState(
      {required final List<Transaction> transactions,
      required final int currentPage,
      required final int maxPage}) = _$successStateImpl;

  List<Transaction> get transactions;
  int get currentPage;
  int get maxPage;

  /// Create a copy of CardTransactionBlocState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$successStateImplCopyWith<_$successStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
