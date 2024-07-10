part of 'get_card_details_bloc.dart';
@freezed
sealed class GetCardDetailsEvent with _$GetCardDetailsEvent {
  const factory GetCardDetailsEvent.getCard({required String cardNumber}) = GetCardEvent;

}
