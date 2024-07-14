part of 'delete_card_bloc.dart';

@freezed
sealed class DeleteCardEvent with _$DeleteCardEvent {
  const factory DeleteCardEvent.deleteCard({required int id}) =
      DeleteCardEventClass;

  const factory DeleteCardEvent.reset() =
  DeleteCardResetEvent;
}
