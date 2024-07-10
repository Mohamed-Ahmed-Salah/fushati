part of 'get_card_details_bloc.dart';

@freezed
sealed class GetCardDetailsState with _$GetCardDetailsState {
  const factory GetCardDetailsState.loading() = _loadingState;

  const factory GetCardDetailsState.failed(String message) = _failedState;

  const factory GetCardDetailsState.success({required CardEntity card}) =
      _success;
}
