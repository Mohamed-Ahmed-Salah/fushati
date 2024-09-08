// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_transaction_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProfileTransactionEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getUserTransactions,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getUserTransactions,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getUserTransactions,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetUserTransactionsEvent value)
        getUserTransactions,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetUserTransactionsEvent value)? getUserTransactions,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetUserTransactionsEvent value)? getUserTransactions,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileTransactionEventCopyWith<$Res> {
  factory $ProfileTransactionEventCopyWith(ProfileTransactionEvent value,
          $Res Function(ProfileTransactionEvent) then) =
      _$ProfileTransactionEventCopyWithImpl<$Res, ProfileTransactionEvent>;
}

/// @nodoc
class _$ProfileTransactionEventCopyWithImpl<$Res,
        $Val extends ProfileTransactionEvent>
    implements $ProfileTransactionEventCopyWith<$Res> {
  _$ProfileTransactionEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$GetUserTransactionsEventImplCopyWith<$Res> {
  factory _$$GetUserTransactionsEventImplCopyWith(
          _$GetUserTransactionsEventImpl value,
          $Res Function(_$GetUserTransactionsEventImpl) then) =
      __$$GetUserTransactionsEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetUserTransactionsEventImplCopyWithImpl<$Res>
    extends _$ProfileTransactionEventCopyWithImpl<$Res,
        _$GetUserTransactionsEventImpl>
    implements _$$GetUserTransactionsEventImplCopyWith<$Res> {
  __$$GetUserTransactionsEventImplCopyWithImpl(
      _$GetUserTransactionsEventImpl _value,
      $Res Function(_$GetUserTransactionsEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetUserTransactionsEventImpl implements GetUserTransactionsEvent {
  const _$GetUserTransactionsEventImpl();

  @override
  String toString() {
    return 'ProfileTransactionEvent.getUserTransactions()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetUserTransactionsEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getUserTransactions,
  }) {
    return getUserTransactions();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getUserTransactions,
  }) {
    return getUserTransactions?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getUserTransactions,
    required TResult orElse(),
  }) {
    if (getUserTransactions != null) {
      return getUserTransactions();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetUserTransactionsEvent value)
        getUserTransactions,
  }) {
    return getUserTransactions(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetUserTransactionsEvent value)? getUserTransactions,
  }) {
    return getUserTransactions?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetUserTransactionsEvent value)? getUserTransactions,
    required TResult orElse(),
  }) {
    if (getUserTransactions != null) {
      return getUserTransactions(this);
    }
    return orElse();
  }
}

abstract class GetUserTransactionsEvent implements ProfileTransactionEvent {
  const factory GetUserTransactionsEvent() = _$GetUserTransactionsEventImpl;
}

/// @nodoc
mixin _$ProfileTransactionState {
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
abstract class $ProfileTransactionStateCopyWith<$Res> {
  factory $ProfileTransactionStateCopyWith(ProfileTransactionState value,
          $Res Function(ProfileTransactionState) then) =
      _$ProfileTransactionStateCopyWithImpl<$Res, ProfileTransactionState>;
}

/// @nodoc
class _$ProfileTransactionStateCopyWithImpl<$Res,
        $Val extends ProfileTransactionState>
    implements $ProfileTransactionStateCopyWith<$Res> {
  _$ProfileTransactionStateCopyWithImpl(this._value, this._then);

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
    extends _$ProfileTransactionStateCopyWithImpl<$Res, _$initialStateImpl>
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
    return 'ProfileTransactionState.initial()';
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

abstract class _initialState implements ProfileTransactionState {
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
    extends _$ProfileTransactionStateCopyWithImpl<$Res, _$loadingStateImpl>
    implements _$$loadingStateImplCopyWith<$Res> {
  __$$loadingStateImplCopyWithImpl(
      _$loadingStateImpl _value, $Res Function(_$loadingStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProfileTransactionState
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
    return 'ProfileTransactionState.loading(transactions: $transactions, currentPage: $currentPage, maxPage: $maxPage)';
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

  /// Create a copy of ProfileTransactionState
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

abstract class _loadingState implements ProfileTransactionState {
  const factory _loadingState(
      {required final List<Transaction> transactions,
      required final int currentPage,
      required final int maxPage}) = _$loadingStateImpl;

  List<Transaction> get transactions;
  int get currentPage;
  int get maxPage;

  /// Create a copy of ProfileTransactionState
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
    extends _$ProfileTransactionStateCopyWithImpl<$Res, _$failedStateImpl>
    implements _$$failedStateImplCopyWith<$Res> {
  __$$failedStateImplCopyWithImpl(
      _$failedStateImpl _value, $Res Function(_$failedStateImpl) _then)
      : super(_value, _then);

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
    return 'ProfileTransactionState.failed(message: $message, transactions: $transactions, currentPage: $currentPage, maxPage: $maxPage)';
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

  @JsonKey(ignore: true)
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

abstract class _failedState implements ProfileTransactionState {
  const factory _failedState(
      {required final String message,
      required final List<Transaction> transactions,
      required final int currentPage,
      required final int maxPage}) = _$failedStateImpl;

  String get message;
  List<Transaction> get transactions;
  int get currentPage;
  int get maxPage;
  @JsonKey(ignore: true)
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
    extends _$ProfileTransactionStateCopyWithImpl<$Res, _$successStateImpl>
    implements _$$successStateImplCopyWith<$Res> {
  __$$successStateImplCopyWithImpl(
      _$successStateImpl _value, $Res Function(_$successStateImpl) _then)
      : super(_value, _then);

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
    return 'ProfileTransactionState.success(transactions: $transactions, currentPage: $currentPage, maxPage: $maxPage)';
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

  @JsonKey(ignore: true)
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

abstract class _successState implements ProfileTransactionState {
  const factory _successState(
      {required final List<Transaction> transactions,
      required final int currentPage,
      required final int maxPage}) = _$successStateImpl;

  List<Transaction> get transactions;
  int get currentPage;
  int get maxPage;
  @JsonKey(ignore: true)
  _$$successStateImplCopyWith<_$successStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
