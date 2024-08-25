part of 'nfc_reader_bloc.dart';
@freezed

sealed class NfcReaderEvent with _$NfcReaderEvent {
  const factory NfcReaderEvent.readNfc() = readCardNfcEvent;
  const factory NfcReaderEvent.resetToScanNewCard() = resetCardNfcEvent;

}
