part of 'customer_info_bloc.dart';

@freezed
sealed class CustomerInfoState with _$CustomerInfoState {
  const factory CustomerInfoState.initial() = _initialState;

  // const factory AuthenticatorState.readyToSubmit()=_readyToSubmit;
  const factory CustomerInfoState.loading() = _loadingState;

  const factory CustomerInfoState.failed(String message) = _failedState;

  const factory CustomerInfoState.success() = _successState;
}
