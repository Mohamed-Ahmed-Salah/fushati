part of 'nfc_reader_bloc.dart';
@freezed
sealed class NfcReaderState with _$NfcReaderState {
  const factory NfcReaderState.initial() = _initialState;
  const factory NfcReaderState.loading() = _loadingState;

  const factory NfcReaderState.failed(String message) = _failedState;

  const factory NfcReaderState.success(String card) = _success;
}

