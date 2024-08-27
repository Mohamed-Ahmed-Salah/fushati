part of 'registration_fees_bloc.dart';

@freezed
sealed class RegistrationFeesState with _$RegistrationFeesState {
  const factory RegistrationFeesState.loading() = _loadingState;

  const factory RegistrationFeesState.failed(String message) = _failedState;

  const factory RegistrationFeesState.success({required double fees}) =
      _success;
}
