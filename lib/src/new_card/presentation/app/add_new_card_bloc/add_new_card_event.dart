part of 'add_new_card_bloc.dart';

@freezed
sealed class AddNewCardEvent with _$AddNewCardEvent {
  const factory AddNewCardEvent.addCard({
    required String name,
    required String email,
    required String phoneNumber,
    required String cardNumber,
    required String studentNumber,
  }) = AddCardEvent;
}
