part of 'registration_fees_bloc.dart';

@freezed
sealed class RegistrationFeesEvent with _$RegistrationFeesEvent {
  const factory RegistrationFeesEvent.getFees() = GetFeesEvent;
}
