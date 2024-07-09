// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cards_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CardsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getCards,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getCards,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getCards,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetCardsEvent value) getCards,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetCardsEvent value)? getCards,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetCardsEvent value)? getCards,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CardsEventCopyWith<$Res> {
  factory $CardsEventCopyWith(
          CardsEvent value, $Res Function(CardsEvent) then) =
      _$CardsEventCopyWithImpl<$Res, CardsEvent>;
}

/// @nodoc
class _$CardsEventCopyWithImpl<$Res, $Val extends CardsEvent>
    implements $CardsEventCopyWith<$Res> {
  _$CardsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$GetCardsEventImplCopyWith<$Res> {
  factory _$$GetCardsEventImplCopyWith(
          _$GetCardsEventImpl value, $Res Function(_$GetCardsEventImpl) then) =
      __$$GetCardsEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetCardsEventImplCopyWithImpl<$Res>
    extends _$CardsEventCopyWithImpl<$Res, _$GetCardsEventImpl>
    implements _$$GetCardsEventImplCopyWith<$Res> {
  __$$GetCardsEventImplCopyWithImpl(
      _$GetCardsEventImpl _value, $Res Function(_$GetCardsEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetCardsEventImpl implements GetCardsEvent {
  const _$GetCardsEventImpl();

  @override
  String toString() {
    return 'CardsEvent.getCards()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetCardsEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getCards,
  }) {
    return getCards();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getCards,
  }) {
    return getCards?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getCards,
    required TResult orElse(),
  }) {
    if (getCards != null) {
      return getCards();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetCardsEvent value) getCards,
  }) {
    return getCards(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetCardsEvent value)? getCards,
  }) {
    return getCards?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetCardsEvent value)? getCards,
    required TResult orElse(),
  }) {
    if (getCards != null) {
      return getCards(this);
    }
    return orElse();
  }
}

abstract class GetCardsEvent implements CardsEvent {
  const factory GetCardsEvent() = _$GetCardsEventImpl;
}

/// @nodoc
mixin _$CardsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() emptyList,
    required TResult Function(String message) failed,
    required TResult Function(List<CardEntity> cards) success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? emptyList,
    TResult? Function(String message)? failed,
    TResult? Function(List<CardEntity> cards)? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? emptyList,
    TResult Function(String message)? failed,
    TResult Function(List<CardEntity> cards)? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_loadingState value) loading,
    required TResult Function(_emptyListState value) emptyList,
    required TResult Function(_failedState value) failed,
    required TResult Function(_success value) success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_loadingState value)? loading,
    TResult? Function(_emptyListState value)? emptyList,
    TResult? Function(_failedState value)? failed,
    TResult? Function(_success value)? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_loadingState value)? loading,
    TResult Function(_emptyListState value)? emptyList,
    TResult Function(_failedState value)? failed,
    TResult Function(_success value)? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CardsStateCopyWith<$Res> {
  factory $CardsStateCopyWith(
          CardsState value, $Res Function(CardsState) then) =
      _$CardsStateCopyWithImpl<$Res, CardsState>;
}

/// @nodoc
class _$CardsStateCopyWithImpl<$Res, $Val extends CardsState>
    implements $CardsStateCopyWith<$Res> {
  _$CardsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$loadingStateImplCopyWith<$Res> {
  factory _$$loadingStateImplCopyWith(
          _$loadingStateImpl value, $Res Function(_$loadingStateImpl) then) =
      __$$loadingStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$loadingStateImplCopyWithImpl<$Res>
    extends _$CardsStateCopyWithImpl<$Res, _$loadingStateImpl>
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
    return 'CardsState.loading()';
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
    required TResult Function() emptyList,
    required TResult Function(String message) failed,
    required TResult Function(List<CardEntity> cards) success,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? emptyList,
    TResult? Function(String message)? failed,
    TResult? Function(List<CardEntity> cards)? success,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? emptyList,
    TResult Function(String message)? failed,
    TResult Function(List<CardEntity> cards)? success,
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
    required TResult Function(_emptyListState value) emptyList,
    required TResult Function(_failedState value) failed,
    required TResult Function(_success value) success,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_loadingState value)? loading,
    TResult? Function(_emptyListState value)? emptyList,
    TResult? Function(_failedState value)? failed,
    TResult? Function(_success value)? success,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_loadingState value)? loading,
    TResult Function(_emptyListState value)? emptyList,
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

abstract class _loadingState implements CardsState {
  const factory _loadingState() = _$loadingStateImpl;
}

/// @nodoc
abstract class _$$emptyListStateImplCopyWith<$Res> {
  factory _$$emptyListStateImplCopyWith(_$emptyListStateImpl value,
          $Res Function(_$emptyListStateImpl) then) =
      __$$emptyListStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$emptyListStateImplCopyWithImpl<$Res>
    extends _$CardsStateCopyWithImpl<$Res, _$emptyListStateImpl>
    implements _$$emptyListStateImplCopyWith<$Res> {
  __$$emptyListStateImplCopyWithImpl(
      _$emptyListStateImpl _value, $Res Function(_$emptyListStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$emptyListStateImpl implements _emptyListState {
  const _$emptyListStateImpl();

  @override
  String toString() {
    return 'CardsState.emptyList()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$emptyListStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() emptyList,
    required TResult Function(String message) failed,
    required TResult Function(List<CardEntity> cards) success,
  }) {
    return emptyList();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? emptyList,
    TResult? Function(String message)? failed,
    TResult? Function(List<CardEntity> cards)? success,
  }) {
    return emptyList?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? emptyList,
    TResult Function(String message)? failed,
    TResult Function(List<CardEntity> cards)? success,
    required TResult orElse(),
  }) {
    if (emptyList != null) {
      return emptyList();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_loadingState value) loading,
    required TResult Function(_emptyListState value) emptyList,
    required TResult Function(_failedState value) failed,
    required TResult Function(_success value) success,
  }) {
    return emptyList(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_loadingState value)? loading,
    TResult? Function(_emptyListState value)? emptyList,
    TResult? Function(_failedState value)? failed,
    TResult? Function(_success value)? success,
  }) {
    return emptyList?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_loadingState value)? loading,
    TResult Function(_emptyListState value)? emptyList,
    TResult Function(_failedState value)? failed,
    TResult Function(_success value)? success,
    required TResult orElse(),
  }) {
    if (emptyList != null) {
      return emptyList(this);
    }
    return orElse();
  }
}

abstract class _emptyListState implements CardsState {
  const factory _emptyListState() = _$emptyListStateImpl;
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
    extends _$CardsStateCopyWithImpl<$Res, _$failedStateImpl>
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
    return 'CardsState.failed(message: $message)';
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
    required TResult Function() loading,
    required TResult Function() emptyList,
    required TResult Function(String message) failed,
    required TResult Function(List<CardEntity> cards) success,
  }) {
    return failed(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? emptyList,
    TResult? Function(String message)? failed,
    TResult? Function(List<CardEntity> cards)? success,
  }) {
    return failed?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? emptyList,
    TResult Function(String message)? failed,
    TResult Function(List<CardEntity> cards)? success,
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
    required TResult Function(_emptyListState value) emptyList,
    required TResult Function(_failedState value) failed,
    required TResult Function(_success value) success,
  }) {
    return failed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_loadingState value)? loading,
    TResult? Function(_emptyListState value)? emptyList,
    TResult? Function(_failedState value)? failed,
    TResult? Function(_success value)? success,
  }) {
    return failed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_loadingState value)? loading,
    TResult Function(_emptyListState value)? emptyList,
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

abstract class _failedState implements CardsState {
  const factory _failedState(final String message) = _$failedStateImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$failedStateImplCopyWith<_$failedStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$successImplCopyWith<$Res> {
  factory _$$successImplCopyWith(
          _$successImpl value, $Res Function(_$successImpl) then) =
      __$$successImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<CardEntity> cards});
}

/// @nodoc
class __$$successImplCopyWithImpl<$Res>
    extends _$CardsStateCopyWithImpl<$Res, _$successImpl>
    implements _$$successImplCopyWith<$Res> {
  __$$successImplCopyWithImpl(
      _$successImpl _value, $Res Function(_$successImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cards = null,
  }) {
    return _then(_$successImpl(
      cards: null == cards
          ? _value._cards
          : cards // ignore: cast_nullable_to_non_nullable
              as List<CardEntity>,
    ));
  }
}

/// @nodoc

class _$successImpl implements _success {
  const _$successImpl({required final List<CardEntity> cards}) : _cards = cards;

  final List<CardEntity> _cards;
  @override
  List<CardEntity> get cards {
    if (_cards is EqualUnmodifiableListView) return _cards;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cards);
  }

  @override
  String toString() {
    return 'CardsState.success(cards: $cards)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$successImpl &&
            const DeepCollectionEquality().equals(other._cards, _cards));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_cards));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$successImplCopyWith<_$successImpl> get copyWith =>
      __$$successImplCopyWithImpl<_$successImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() emptyList,
    required TResult Function(String message) failed,
    required TResult Function(List<CardEntity> cards) success,
  }) {
    return success(cards);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? emptyList,
    TResult? Function(String message)? failed,
    TResult? Function(List<CardEntity> cards)? success,
  }) {
    return success?.call(cards);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? emptyList,
    TResult Function(String message)? failed,
    TResult Function(List<CardEntity> cards)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(cards);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_loadingState value) loading,
    required TResult Function(_emptyListState value) emptyList,
    required TResult Function(_failedState value) failed,
    required TResult Function(_success value) success,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_loadingState value)? loading,
    TResult? Function(_emptyListState value)? emptyList,
    TResult? Function(_failedState value)? failed,
    TResult? Function(_success value)? success,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_loadingState value)? loading,
    TResult Function(_emptyListState value)? emptyList,
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

abstract class _success implements CardsState {
  const factory _success({required final List<CardEntity> cards}) =
      _$successImpl;

  List<CardEntity> get cards;
  @JsonKey(ignore: true)
  _$$successImplCopyWith<_$successImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
