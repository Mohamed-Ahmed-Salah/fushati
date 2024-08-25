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
  int get id => throw _privateConstructorUsedError;
  String get cardNumber => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            int id, String cardNumber, DateTime createdAt, int page)
        getCardTransaction,
    required TResult Function(int id, String cardNumber, DateTime createdAt)
        getMoreCardTransaction,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id, String cardNumber, DateTime createdAt, int page)?
        getCardTransaction,
    TResult? Function(int id, String cardNumber, DateTime createdAt)?
        getMoreCardTransaction,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id, String cardNumber, DateTime createdAt, int page)?
        getCardTransaction,
    TResult Function(int id, String cardNumber, DateTime createdAt)?
        getMoreCardTransaction,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetCardTransactionEvent value) getCardTransaction,
    required TResult Function(GetMoreCardTransaction value)
        getMoreCardTransaction,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetCardTransactionEvent value)? getCardTransaction,
    TResult? Function(GetMoreCardTransaction value)? getMoreCardTransaction,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetCardTransactionEvent value)? getCardTransaction,
    TResult Function(GetMoreCardTransaction value)? getMoreCardTransaction,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of CardTransactionBlocEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CardTransactionBlocEventCopyWith<CardTransactionBlocEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CardTransactionBlocEventCopyWith<$Res> {
  factory $CardTransactionBlocEventCopyWith(CardTransactionBlocEvent value,
          $Res Function(CardTransactionBlocEvent) then) =
      _$CardTransactionBlocEventCopyWithImpl<$Res, CardTransactionBlocEvent>;
  @useResult
  $Res call({int id, String cardNumber, DateTime createdAt});
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
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? cardNumber = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      cardNumber: null == cardNumber
          ? _value.cardNumber
          : cardNumber // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetCardTransactionEventImplCopyWith<$Res>
    implements $CardTransactionBlocEventCopyWith<$Res> {
  factory _$$GetCardTransactionEventImplCopyWith(
          _$GetCardTransactionEventImpl value,
          $Res Function(_$GetCardTransactionEventImpl) then) =
      __$$GetCardTransactionEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String cardNumber, DateTime createdAt, int page});
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
    Object? id = null,
    Object? cardNumber = null,
    Object? createdAt = null,
    Object? page = null,
  }) {
    return _then(_$GetCardTransactionEventImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      cardNumber: null == cardNumber
          ? _value.cardNumber
          : cardNumber // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$GetCardTransactionEventImpl implements GetCardTransactionEvent {
  const _$GetCardTransactionEventImpl(
      {required this.id,
      required this.cardNumber,
      required this.createdAt,
      required this.page});

  @override
  final int id;
  @override
  final String cardNumber;
  @override
  final DateTime createdAt;
  @override
  final int page;

  @override
  String toString() {
    return 'CardTransactionBlocEvent.getCardTransaction(id: $id, cardNumber: $cardNumber, createdAt: $createdAt, page: $page)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetCardTransactionEventImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.cardNumber, cardNumber) ||
                other.cardNumber == cardNumber) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.page, page) || other.page == page));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, cardNumber, createdAt, page);

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
    required TResult Function(
            int id, String cardNumber, DateTime createdAt, int page)
        getCardTransaction,
    required TResult Function(int id, String cardNumber, DateTime createdAt)
        getMoreCardTransaction,
  }) {
    return getCardTransaction(id, cardNumber, createdAt, page);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id, String cardNumber, DateTime createdAt, int page)?
        getCardTransaction,
    TResult? Function(int id, String cardNumber, DateTime createdAt)?
        getMoreCardTransaction,
  }) {
    return getCardTransaction?.call(id, cardNumber, createdAt, page);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id, String cardNumber, DateTime createdAt, int page)?
        getCardTransaction,
    TResult Function(int id, String cardNumber, DateTime createdAt)?
        getMoreCardTransaction,
    required TResult orElse(),
  }) {
    if (getCardTransaction != null) {
      return getCardTransaction(id, cardNumber, createdAt, page);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetCardTransactionEvent value) getCardTransaction,
    required TResult Function(GetMoreCardTransaction value)
        getMoreCardTransaction,
  }) {
    return getCardTransaction(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetCardTransactionEvent value)? getCardTransaction,
    TResult? Function(GetMoreCardTransaction value)? getMoreCardTransaction,
  }) {
    return getCardTransaction?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetCardTransactionEvent value)? getCardTransaction,
    TResult Function(GetMoreCardTransaction value)? getMoreCardTransaction,
    required TResult orElse(),
  }) {
    if (getCardTransaction != null) {
      return getCardTransaction(this);
    }
    return orElse();
  }
}

abstract class GetCardTransactionEvent implements CardTransactionBlocEvent {
  const factory GetCardTransactionEvent(
      {required final int id,
      required final String cardNumber,
      required final DateTime createdAt,
      required final int page}) = _$GetCardTransactionEventImpl;

  @override
  int get id;
  @override
  String get cardNumber;
  @override
  DateTime get createdAt;
  int get page;

  /// Create a copy of CardTransactionBlocEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetCardTransactionEventImplCopyWith<_$GetCardTransactionEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetMoreCardTransactionImplCopyWith<$Res>
    implements $CardTransactionBlocEventCopyWith<$Res> {
  factory _$$GetMoreCardTransactionImplCopyWith(
          _$GetMoreCardTransactionImpl value,
          $Res Function(_$GetMoreCardTransactionImpl) then) =
      __$$GetMoreCardTransactionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String cardNumber, DateTime createdAt});
}

/// @nodoc
class __$$GetMoreCardTransactionImplCopyWithImpl<$Res>
    extends _$CardTransactionBlocEventCopyWithImpl<$Res,
        _$GetMoreCardTransactionImpl>
    implements _$$GetMoreCardTransactionImplCopyWith<$Res> {
  __$$GetMoreCardTransactionImplCopyWithImpl(
      _$GetMoreCardTransactionImpl _value,
      $Res Function(_$GetMoreCardTransactionImpl) _then)
      : super(_value, _then);

  /// Create a copy of CardTransactionBlocEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? cardNumber = null,
    Object? createdAt = null,
  }) {
    return _then(_$GetMoreCardTransactionImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      cardNumber: null == cardNumber
          ? _value.cardNumber
          : cardNumber // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$GetMoreCardTransactionImpl implements GetMoreCardTransaction {
  const _$GetMoreCardTransactionImpl(
      {required this.id, required this.cardNumber, required this.createdAt});

  @override
  final int id;
  @override
  final String cardNumber;
  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'CardTransactionBlocEvent.getMoreCardTransaction(id: $id, cardNumber: $cardNumber, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetMoreCardTransactionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.cardNumber, cardNumber) ||
                other.cardNumber == cardNumber) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, cardNumber, createdAt);

  /// Create a copy of CardTransactionBlocEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetMoreCardTransactionImplCopyWith<_$GetMoreCardTransactionImpl>
      get copyWith => __$$GetMoreCardTransactionImplCopyWithImpl<
          _$GetMoreCardTransactionImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            int id, String cardNumber, DateTime createdAt, int page)
        getCardTransaction,
    required TResult Function(int id, String cardNumber, DateTime createdAt)
        getMoreCardTransaction,
  }) {
    return getMoreCardTransaction(id, cardNumber, createdAt);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id, String cardNumber, DateTime createdAt, int page)?
        getCardTransaction,
    TResult? Function(int id, String cardNumber, DateTime createdAt)?
        getMoreCardTransaction,
  }) {
    return getMoreCardTransaction?.call(id, cardNumber, createdAt);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id, String cardNumber, DateTime createdAt, int page)?
        getCardTransaction,
    TResult Function(int id, String cardNumber, DateTime createdAt)?
        getMoreCardTransaction,
    required TResult orElse(),
  }) {
    if (getMoreCardTransaction != null) {
      return getMoreCardTransaction(id, cardNumber, createdAt);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetCardTransactionEvent value) getCardTransaction,
    required TResult Function(GetMoreCardTransaction value)
        getMoreCardTransaction,
  }) {
    return getMoreCardTransaction(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetCardTransactionEvent value)? getCardTransaction,
    TResult? Function(GetMoreCardTransaction value)? getMoreCardTransaction,
  }) {
    return getMoreCardTransaction?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetCardTransactionEvent value)? getCardTransaction,
    TResult Function(GetMoreCardTransaction value)? getMoreCardTransaction,
    required TResult orElse(),
  }) {
    if (getMoreCardTransaction != null) {
      return getMoreCardTransaction(this);
    }
    return orElse();
  }
}

abstract class GetMoreCardTransaction implements CardTransactionBlocEvent {
  const factory GetMoreCardTransaction(
      {required final int id,
      required final String cardNumber,
      required final DateTime createdAt}) = _$GetMoreCardTransactionImpl;

  @override
  int get id;
  @override
  String get cardNumber;
  @override
  DateTime get createdAt;

  /// Create a copy of CardTransactionBlocEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetMoreCardTransactionImplCopyWith<_$GetMoreCardTransactionImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CardTransactionBlocState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Transaction> transactions) loading,
    required TResult Function(String message) failed,
    required TResult Function(
            List<Transaction> transactions, bool hasMoreRecords)
        success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Transaction> transactions)? loading,
    TResult? Function(String message)? failed,
    TResult? Function(List<Transaction> transactions, bool hasMoreRecords)?
        success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Transaction> transactions)? loading,
    TResult Function(String message)? failed,
    TResult Function(List<Transaction> transactions, bool hasMoreRecords)?
        success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_loadingState value) loading,
    required TResult Function(_failedState value) failed,
    required TResult Function(_successState value) success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_loadingState value)? loading,
    TResult? Function(_failedState value)? failed,
    TResult? Function(_successState value)? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
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
abstract class _$$loadingStateImplCopyWith<$Res> {
  factory _$$loadingStateImplCopyWith(
          _$loadingStateImpl value, $Res Function(_$loadingStateImpl) then) =
      __$$loadingStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Transaction> transactions});
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
  }) {
    return _then(_$loadingStateImpl(
      transactions: null == transactions
          ? _value._transactions
          : transactions // ignore: cast_nullable_to_non_nullable
              as List<Transaction>,
    ));
  }
}

/// @nodoc

class _$loadingStateImpl implements _loadingState {
  const _$loadingStateImpl({final List<Transaction> transactions = const []})
      : _transactions = transactions;

  final List<Transaction> _transactions;
  @override
  @JsonKey()
  List<Transaction> get transactions {
    if (_transactions is EqualUnmodifiableListView) return _transactions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_transactions);
  }

  @override
  String toString() {
    return 'CardTransactionBlocState.loading(transactions: $transactions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$loadingStateImpl &&
            const DeepCollectionEquality()
                .equals(other._transactions, _transactions));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_transactions));

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
    required TResult Function(List<Transaction> transactions) loading,
    required TResult Function(String message) failed,
    required TResult Function(
            List<Transaction> transactions, bool hasMoreRecords)
        success,
  }) {
    return loading(transactions);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Transaction> transactions)? loading,
    TResult? Function(String message)? failed,
    TResult? Function(List<Transaction> transactions, bool hasMoreRecords)?
        success,
  }) {
    return loading?.call(transactions);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Transaction> transactions)? loading,
    TResult Function(String message)? failed,
    TResult Function(List<Transaction> transactions, bool hasMoreRecords)?
        success,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(transactions);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_loadingState value) loading,
    required TResult Function(_failedState value) failed,
    required TResult Function(_successState value) success,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_loadingState value)? loading,
    TResult? Function(_failedState value)? failed,
    TResult? Function(_successState value)? success,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
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
  const factory _loadingState({final List<Transaction> transactions}) =
      _$loadingStateImpl;

  List<Transaction> get transactions;

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
  $Res call({String message});
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
    return 'CardTransactionBlocState.failed(message: $message)';
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
    required TResult Function(List<Transaction> transactions) loading,
    required TResult Function(String message) failed,
    required TResult Function(
            List<Transaction> transactions, bool hasMoreRecords)
        success,
  }) {
    return failed(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Transaction> transactions)? loading,
    TResult? Function(String message)? failed,
    TResult? Function(List<Transaction> transactions, bool hasMoreRecords)?
        success,
  }) {
    return failed?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Transaction> transactions)? loading,
    TResult Function(String message)? failed,
    TResult Function(List<Transaction> transactions, bool hasMoreRecords)?
        success,
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
    required TResult Function(_successState value) success,
  }) {
    return failed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_loadingState value)? loading,
    TResult? Function(_failedState value)? failed,
    TResult? Function(_successState value)? success,
  }) {
    return failed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
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
  const factory _failedState(final String message) = _$failedStateImpl;

  String get message;

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
  $Res call({List<Transaction> transactions, bool hasMoreRecords});
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
    Object? hasMoreRecords = null,
  }) {
    return _then(_$successStateImpl(
      transactions: null == transactions
          ? _value._transactions
          : transactions // ignore: cast_nullable_to_non_nullable
              as List<Transaction>,
      hasMoreRecords: null == hasMoreRecords
          ? _value.hasMoreRecords
          : hasMoreRecords // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$successStateImpl implements _successState {
  const _$successStateImpl(
      {required final List<Transaction> transactions,
      required this.hasMoreRecords})
      : _transactions = transactions;

  final List<Transaction> _transactions;
  @override
  List<Transaction> get transactions {
    if (_transactions is EqualUnmodifiableListView) return _transactions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_transactions);
  }

  @override
  final bool hasMoreRecords;

  @override
  String toString() {
    return 'CardTransactionBlocState.success(transactions: $transactions, hasMoreRecords: $hasMoreRecords)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$successStateImpl &&
            const DeepCollectionEquality()
                .equals(other._transactions, _transactions) &&
            (identical(other.hasMoreRecords, hasMoreRecords) ||
                other.hasMoreRecords == hasMoreRecords));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_transactions), hasMoreRecords);

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
    required TResult Function(List<Transaction> transactions) loading,
    required TResult Function(String message) failed,
    required TResult Function(
            List<Transaction> transactions, bool hasMoreRecords)
        success,
  }) {
    return success(transactions, hasMoreRecords);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Transaction> transactions)? loading,
    TResult? Function(String message)? failed,
    TResult? Function(List<Transaction> transactions, bool hasMoreRecords)?
        success,
  }) {
    return success?.call(transactions, hasMoreRecords);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Transaction> transactions)? loading,
    TResult Function(String message)? failed,
    TResult Function(List<Transaction> transactions, bool hasMoreRecords)?
        success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(transactions, hasMoreRecords);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_loadingState value) loading,
    required TResult Function(_failedState value) failed,
    required TResult Function(_successState value) success,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_loadingState value)? loading,
    TResult? Function(_failedState value)? failed,
    TResult? Function(_successState value)? success,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
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
      required final bool hasMoreRecords}) = _$successStateImpl;

  List<Transaction> get transactions;
  bool get hasMoreRecords;

  /// Create a copy of CardTransactionBlocState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$successStateImplCopyWith<_$successStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
