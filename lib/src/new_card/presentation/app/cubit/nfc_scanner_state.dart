part of 'nfc_scanner_cubit.dart';
@freezed
sealed class NfcScannerState with _$NfcScannerState{
  const factory NfcScannerState.initial({required bool isNfcAvailable}) = _initialState;

}

