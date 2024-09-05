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
  bool get callFromStart => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool callFromStart) getCards,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool callFromStart)? getCards,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool callFromStart)? getCards,
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

  /// Create a copy of CardsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CardsEventCopyWith<CardsEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CardsEventCopyWith<$Res> {
  factory $CardsEventCopyWith(
          CardsEvent value, $Res Function(CardsEvent) then) =
      _$CardsEventCopyWithImpl<$Res, CardsEvent>;
  @useResult
  $Res call({bool callFromStart});
}

/// @nodoc
class _$CardsEventCopyWithImpl<$Res, $Val extends CardsEvent>
    implements $CardsEventCopyWith<$Res> {
  _$CardsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CardsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? callFromStart = null,
  }) {
    return _then(_value.copyWith(
      callFromStart: null == callFromStart
          ? _value.callFromStart
          : callFromStart // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetCardsEventImplCopyWith<$Res>
    implements $CardsEventCopyWith<$Res> {
  factory _$$GetCardsEventImplCopyWith(
          _$GetCardsEventImpl value, $Res Function(_$GetCardsEventImpl) then) =
      __$$GetCardsEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool callFromStart});
}

/// @nodoc
class __$$GetCardsEventImplCopyWithImpl<$Res>
    extends _$CardsEventCopyWithImpl<$Res, _$GetCardsEventImpl>
    implements _$$GetCardsEventImplCopyWith<$Res> {
  __$$GetCardsEventImplCopyWithImpl(
      _$GetCardsEventImpl _value, $Res Function(_$GetCardsEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of CardsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? callFromStart = null,
  }) {
    return _then(_$GetCardsEventImpl(
      callFromStart: null == callFromStart
          ? _value.callFromStart
          : callFromStart // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$GetCardsEventImpl implements GetCardsEvent {
  const _$GetCardsEventImpl({this.callFromStart = false});

  @override
  @JsonKey()
  final bool callFromStart;

  @override
  String toString() {
    return 'CardsEvent.getCards(callFromStart: $callFromStart)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetCardsEventImpl &&
            (identical(other.callFromStart, callFromStart) ||
                other.callFromStart == callFromStart));
  }

  @override
  int get hashCode => Object.hash(runtimeType, callFromStart);

  /// Create a copy of CardsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetCardsEventImplCopyWith<_$GetCardsEventImpl> get copyWith =>
      __$$GetCardsEventImplCopyWithImpl<_$GetCardsEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool callFromStart) getCards,
  }) {
    return getCards(callFromStart);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool callFromStart)? getCards,
  }) {
    return getCards?.call(callFromStart);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool callFromStart)? getCards,
    required TResult orElse(),
  }) {
    if (getCards != null) {
      return getCards(callFromStart);
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
  const factory GetCardsEvent({final bool callFromStart}) = _$GetCardsEventImpl;

  @override
  bool get callFromStart;

  /// Create a copy of CardsEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetCardsEventImplCopyWith<_$GetCardsEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CardsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(
            List<CardEntity> cards, int currentPage, int maxPage)
        loading,
    required TResult Function() emptyList,
    required TResult Function(String message, List<CardEntity> cards,
            int currentPage, int maxPage)
        failed,
    required TResult Function(
            List<CardEntity> cards, int currentPage, int maxPage)
        success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<CardEntity> cards, int currentPage, int maxPage)?
        loading,
    TResult? Function()? emptyList,
    TResult? Function(String message, List<CardEntity> cards, int currentPage,
            int maxPage)?
        failed,
    TResult? Function(List<CardEntity> cards, int currentPage, int maxPage)?
        success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<CardEntity> cards, int currentPage, int maxPage)?
        loading,
    TResult Function()? emptyList,
    TResult Function(String message, List<CardEntity> cards, int currentPage,
            int maxPage)?
        failed,
    TResult Function(List<CardEntity> cards, int currentPage, int maxPage)?
        success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(initialState value) initial,
    required TResult Function(loadingState value) loading,
    required TResult Function(_emptyListState value) emptyList,
    required TResult Function(_failedState value) failed,
    required TResult Function(_success value) success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(initialState value)? initial,
    TResult? Function(loadingState value)? loading,
    TResult? Function(_emptyListState value)? emptyList,
    TResult? Function(_failedState value)? failed,
    TResult? Function(_success value)? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(initialState value)? initial,
    TResult Function(loadingState value)? loading,
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

  /// Create a copy of CardsState
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
    extends _$CardsStateCopyWithImpl<$Res, _$initialStateImpl>
    implements _$$initialStateImplCopyWith<$Res> {
  __$$initialStateImplCopyWithImpl(
      _$initialStateImpl _value, $Res Function(_$initialStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of CardsState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$initialStateImpl implements initialState {
  const _$initialStateImpl();

  @override
  String toString() {
    return 'CardsState.initial()';
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
            List<CardEntity> cards, int currentPage, int maxPage)
        loading,
    required TResult Function() emptyList,
    required TResult Function(String message, List<CardEntity> cards,
            int currentPage, int maxPage)
        failed,
    required TResult Function(
            List<CardEntity> cards, int currentPage, int maxPage)
        success,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<CardEntity> cards, int currentPage, int maxPage)?
        loading,
    TResult? Function()? emptyList,
    TResult? Function(String message, List<CardEntity> cards, int currentPage,
            int maxPage)?
        failed,
    TResult? Function(List<CardEntity> cards, int currentPage, int maxPage)?
        success,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<CardEntity> cards, int currentPage, int maxPage)?
        loading,
    TResult Function()? emptyList,
    TResult Function(String message, List<CardEntity> cards, int currentPage,
            int maxPage)?
        failed,
    TResult Function(List<CardEntity> cards, int currentPage, int maxPage)?
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
    required TResult Function(initialState value) initial,
    required TResult Function(loadingState value) loading,
    required TResult Function(_emptyListState value) emptyList,
    required TResult Function(_failedState value) failed,
    required TResult Function(_success value) success,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(initialState value)? initial,
    TResult? Function(loadingState value)? loading,
    TResult? Function(_emptyListState value)? emptyList,
    TResult? Function(_failedState value)? failed,
    TResult? Function(_success value)? success,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(initialState value)? initial,
    TResult Function(loadingState value)? loading,
    TResult Function(_emptyListState value)? emptyList,
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

abstract class initialState implements CardsState {
  const factory initialState() = _$initialStateImpl;
}

/// @nodoc
abstract class _$$loadingStateImplCopyWith<$Res> {
  factory _$$loadingStateImplCopyWith(
          _$loadingStateImpl value, $Res Function(_$loadingStateImpl) then) =
      __$$loadingStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<CardEntity> cards, int currentPage, int maxPage});
}

/// @nodoc
class __$$loadingStateImplCopyWithImpl<$Res>
    extends _$CardsStateCopyWithImpl<$Res, _$loadingStateImpl>
    implements _$$loadingStateImplCopyWith<$Res> {
  __$$loadingStateImplCopyWithImpl(
      _$loadingStateImpl _value, $Res Function(_$loadingStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of CardsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cards = null,
    Object? currentPage = null,
    Object? maxPage = null,
  }) {
    return _then(_$loadingStateImpl(
      cards: null == cards
          ? _value._cards
          : cards // ignore: cast_nullable_to_non_nullable
              as List<CardEntity>,
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

class _$loadingStateImpl implements loadingState {
  const _$loadingStateImpl(
      {required final List<CardEntity> cards,
      required this.currentPage,
      required this.maxPage})
      : _cards = cards;

  final List<CardEntity> _cards;
  @override
  List<CardEntity> get cards {
    if (_cards is EqualUnmodifiableListView) return _cards;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cards);
  }

  @override
  final int currentPage;
  @override
  final int maxPage;

  @override
  String toString() {
    return 'CardsState.loading(cards: $cards, currentPage: $currentPage, maxPage: $maxPage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$loadingStateImpl &&
            const DeepCollectionEquality().equals(other._cards, _cards) &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.maxPage, maxPage) || other.maxPage == maxPage));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_cards), currentPage, maxPage);

  /// Create a copy of CardsState
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
            List<CardEntity> cards, int currentPage, int maxPage)
        loading,
    required TResult Function() emptyList,
    required TResult Function(String message, List<CardEntity> cards,
            int currentPage, int maxPage)
        failed,
    required TResult Function(
            List<CardEntity> cards, int currentPage, int maxPage)
        success,
  }) {
    return loading(cards, currentPage, maxPage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<CardEntity> cards, int currentPage, int maxPage)?
        loading,
    TResult? Function()? emptyList,
    TResult? Function(String message, List<CardEntity> cards, int currentPage,
            int maxPage)?
        failed,
    TResult? Function(List<CardEntity> cards, int currentPage, int maxPage)?
        success,
  }) {
    return loading?.call(cards, currentPage, maxPage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<CardEntity> cards, int currentPage, int maxPage)?
        loading,
    TResult Function()? emptyList,
    TResult Function(String message, List<CardEntity> cards, int currentPage,
            int maxPage)?
        failed,
    TResult Function(List<CardEntity> cards, int currentPage, int maxPage)?
        success,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(cards, currentPage, maxPage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(initialState value) initial,
    required TResult Function(loadingState value) loading,
    required TResult Function(_emptyListState value) emptyList,
    required TResult Function(_failedState value) failed,
    required TResult Function(_success value) success,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(initialState value)? initial,
    TResult? Function(loadingState value)? loading,
    TResult? Function(_emptyListState value)? emptyList,
    TResult? Function(_failedState value)? failed,
    TResult? Function(_success value)? success,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(initialState value)? initial,
    TResult Function(loadingState value)? loading,
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

abstract class loadingState implements CardsState {
  const factory loadingState(
      {required final List<CardEntity> cards,
      required final int currentPage,
      required final int maxPage}) = _$loadingStateImpl;

  List<CardEntity> get cards;
  int get currentPage;
  int get maxPage;

  /// Create a copy of CardsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$loadingStateImplCopyWith<_$loadingStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
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

  /// Create a copy of CardsState
  /// with the given fields replaced by the non-null parameter values.
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
    required TResult Function() initial,
    required TResult Function(
            List<CardEntity> cards, int currentPage, int maxPage)
        loading,
    required TResult Function() emptyList,
    required TResult Function(String message, List<CardEntity> cards,
            int currentPage, int maxPage)
        failed,
    required TResult Function(
            List<CardEntity> cards, int currentPage, int maxPage)
        success,
  }) {
    return emptyList();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<CardEntity> cards, int currentPage, int maxPage)?
        loading,
    TResult? Function()? emptyList,
    TResult? Function(String message, List<CardEntity> cards, int currentPage,
            int maxPage)?
        failed,
    TResult? Function(List<CardEntity> cards, int currentPage, int maxPage)?
        success,
  }) {
    return emptyList?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<CardEntity> cards, int currentPage, int maxPage)?
        loading,
    TResult Function()? emptyList,
    TResult Function(String message, List<CardEntity> cards, int currentPage,
            int maxPage)?
        failed,
    TResult Function(List<CardEntity> cards, int currentPage, int maxPage)?
        success,
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
    required TResult Function(initialState value) initial,
    required TResult Function(loadingState value) loading,
    required TResult Function(_emptyListState value) emptyList,
    required TResult Function(_failedState value) failed,
    required TResult Function(_success value) success,
  }) {
    return emptyList(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(initialState value)? initial,
    TResult? Function(loadingState value)? loading,
    TResult? Function(_emptyListState value)? emptyList,
    TResult? Function(_failedState value)? failed,
    TResult? Function(_success value)? success,
  }) {
    return emptyList?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(initialState value)? initial,
    TResult Function(loadingState value)? loading,
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
  $Res call(
      {String message, List<CardEntity> cards, int currentPage, int maxPage});
}

/// @nodoc
class __$$failedStateImplCopyWithImpl<$Res>
    extends _$CardsStateCopyWithImpl<$Res, _$failedStateImpl>
    implements _$$failedStateImplCopyWith<$Res> {
  __$$failedStateImplCopyWithImpl(
      _$failedStateImpl _value, $Res Function(_$failedStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of CardsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? cards = null,
    Object? currentPage = null,
    Object? maxPage = null,
  }) {
    return _then(_$failedStateImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      cards: null == cards
          ? _value._cards
          : cards // ignore: cast_nullable_to_non_nullable
              as List<CardEntity>,
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
      required final List<CardEntity> cards,
      required this.currentPage,
      required this.maxPage})
      : _cards = cards;

  @override
  final String message;
  final List<CardEntity> _cards;
  @override
  List<CardEntity> get cards {
    if (_cards is EqualUnmodifiableListView) return _cards;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cards);
  }

  @override
  final int currentPage;
  @override
  final int maxPage;

  @override
  String toString() {
    return 'CardsState.failed(message: $message, cards: $cards, currentPage: $currentPage, maxPage: $maxPage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$failedStateImpl &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other._cards, _cards) &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.maxPage, maxPage) || other.maxPage == maxPage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message,
      const DeepCollectionEquality().hash(_cards), currentPage, maxPage);

  /// Create a copy of CardsState
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
            List<CardEntity> cards, int currentPage, int maxPage)
        loading,
    required TResult Function() emptyList,
    required TResult Function(String message, List<CardEntity> cards,
            int currentPage, int maxPage)
        failed,
    required TResult Function(
            List<CardEntity> cards, int currentPage, int maxPage)
        success,
  }) {
    return failed(message, cards, currentPage, maxPage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<CardEntity> cards, int currentPage, int maxPage)?
        loading,
    TResult? Function()? emptyList,
    TResult? Function(String message, List<CardEntity> cards, int currentPage,
            int maxPage)?
        failed,
    TResult? Function(List<CardEntity> cards, int currentPage, int maxPage)?
        success,
  }) {
    return failed?.call(message, cards, currentPage, maxPage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<CardEntity> cards, int currentPage, int maxPage)?
        loading,
    TResult Function()? emptyList,
    TResult Function(String message, List<CardEntity> cards, int currentPage,
            int maxPage)?
        failed,
    TResult Function(List<CardEntity> cards, int currentPage, int maxPage)?
        success,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(message, cards, currentPage, maxPage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(initialState value) initial,
    required TResult Function(loadingState value) loading,
    required TResult Function(_emptyListState value) emptyList,
    required TResult Function(_failedState value) failed,
    required TResult Function(_success value) success,
  }) {
    return failed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(initialState value)? initial,
    TResult? Function(loadingState value)? loading,
    TResult? Function(_emptyListState value)? emptyList,
    TResult? Function(_failedState value)? failed,
    TResult? Function(_success value)? success,
  }) {
    return failed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(initialState value)? initial,
    TResult Function(loadingState value)? loading,
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
  const factory _failedState(
      {required final String message,
      required final List<CardEntity> cards,
      required final int currentPage,
      required final int maxPage}) = _$failedStateImpl;

  String get message;
  List<CardEntity> get cards;
  int get currentPage;
  int get maxPage;

  /// Create a copy of CardsState
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
  $Res call({List<CardEntity> cards, int currentPage, int maxPage});
}

/// @nodoc
class __$$successImplCopyWithImpl<$Res>
    extends _$CardsStateCopyWithImpl<$Res, _$successImpl>
    implements _$$successImplCopyWith<$Res> {
  __$$successImplCopyWithImpl(
      _$successImpl _value, $Res Function(_$successImpl) _then)
      : super(_value, _then);

  /// Create a copy of CardsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cards = null,
    Object? currentPage = null,
    Object? maxPage = null,
  }) {
    return _then(_$successImpl(
      cards: null == cards
          ? _value._cards
          : cards // ignore: cast_nullable_to_non_nullable
              as List<CardEntity>,
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

class _$successImpl implements _success {
  const _$successImpl(
      {required final List<CardEntity> cards,
      required this.currentPage,
      required this.maxPage})
      : _cards = cards;

  final List<CardEntity> _cards;
  @override
  List<CardEntity> get cards {
    if (_cards is EqualUnmodifiableListView) return _cards;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cards);
  }

  @override
  final int currentPage;
  @override
  final int maxPage;

  @override
  String toString() {
    return 'CardsState.success(cards: $cards, currentPage: $currentPage, maxPage: $maxPage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$successImpl &&
            const DeepCollectionEquality().equals(other._cards, _cards) &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.maxPage, maxPage) || other.maxPage == maxPage));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_cards), currentPage, maxPage);

  /// Create a copy of CardsState
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
    required TResult Function(
            List<CardEntity> cards, int currentPage, int maxPage)
        loading,
    required TResult Function() emptyList,
    required TResult Function(String message, List<CardEntity> cards,
            int currentPage, int maxPage)
        failed,
    required TResult Function(
            List<CardEntity> cards, int currentPage, int maxPage)
        success,
  }) {
    return success(cards, currentPage, maxPage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<CardEntity> cards, int currentPage, int maxPage)?
        loading,
    TResult? Function()? emptyList,
    TResult? Function(String message, List<CardEntity> cards, int currentPage,
            int maxPage)?
        failed,
    TResult? Function(List<CardEntity> cards, int currentPage, int maxPage)?
        success,
  }) {
    return success?.call(cards, currentPage, maxPage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<CardEntity> cards, int currentPage, int maxPage)?
        loading,
    TResult Function()? emptyList,
    TResult Function(String message, List<CardEntity> cards, int currentPage,
            int maxPage)?
        failed,
    TResult Function(List<CardEntity> cards, int currentPage, int maxPage)?
        success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(cards, currentPage, maxPage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(initialState value) initial,
    required TResult Function(loadingState value) loading,
    required TResult Function(_emptyListState value) emptyList,
    required TResult Function(_failedState value) failed,
    required TResult Function(_success value) success,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(initialState value)? initial,
    TResult? Function(loadingState value)? loading,
    TResult? Function(_emptyListState value)? emptyList,
    TResult? Function(_failedState value)? failed,
    TResult? Function(_success value)? success,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(initialState value)? initial,
    TResult Function(loadingState value)? loading,
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
  const factory _success(
      {required final List<CardEntity> cards,
      required final int currentPage,
      required final int maxPage}) = _$successImpl;

  List<CardEntity> get cards;
  int get currentPage;
  int get maxPage;

  /// Create a copy of CardsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$successImplCopyWith<_$successImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
