part of 'cards_bloc.dart';

@freezed
sealed class CardsEvent with _$CardsEvent {
  const factory CardsEvent.getCards() = GetCardsEvent;
}
