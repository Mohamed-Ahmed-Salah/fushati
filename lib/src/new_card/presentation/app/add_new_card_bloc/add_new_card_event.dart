part of 'add_new_card_bloc.dart';
@freezed
sealed class AddNewCardEvent with _$AddNewCardEvent {
  const factory AddNewCardEvent.addCard({required String cardNumber}) = AddCardEvent;

}
