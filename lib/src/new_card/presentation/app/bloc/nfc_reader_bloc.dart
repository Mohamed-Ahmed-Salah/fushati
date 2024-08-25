import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_nfc_kit/flutter_nfc_kit.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fushati/core/utils/constants/error_consts.dart';

part 'nfc_reader_bloc.freezed.dart';

part 'nfc_reader_event.dart';

part 'nfc_reader_state.dart';

class NfcReaderBloc extends Bloc<NfcReaderEvent, NfcReaderState> {
  NfcReaderBloc() : super(const NfcReaderState.initial()) {
    on<readCardNfcEvent>(_readNfc);
    on<resetCardNfcEvent>(_reset);
  }

  _readNfc(event, emit) async {
    try {
      emit(const NfcReaderState.loading());
      NFCTag tag = await FlutterNfcKit.poll();
      log("NFC tag discovered: ${tag.id} applicationData ${tag.applicationData} ${tag.toJson.toString()}");
      log("${tag.protocolInfo} tag.protocolInfo and tag.systemCode= ${tag.systemCode}");
      String physicalCardNumber = tag.id;
      String softwareCardNumber = convertCardNumber(physicalCardNumber);
      print("Software Card Number: $softwareCardNumber");
      emit(NfcReaderState.success(softwareCardNumber));
    } catch (e) {
      emit(NfcReaderState.failed(
          ErrorConst.getErrorBody(text: ErrorConst.UNKNOWN_ERROR)));
    }
  }

  String convertCardNumber(String physicalCardNumber) {
    // Extract parts of the physical card number
    String part1 = physicalCardNumber.substring(0, 2); // "03"
    String part2 = physicalCardNumber.substring(2, 4); // "81"
    String part3 = physicalCardNumber.substring(4, 6); // "1D"
    String part4 = physicalCardNumber.substring(6, 8); // "6C"

    // Apply the conversion rule CDAB34 12
    String rearranged = part4 + part3 + part2 + part1; // "6C1D8103"

    // Convert hex to decimal
    int decimalValue = int.parse(rearranged, radix: 16);

    // Convert to string and pad with zeros if necessary to ensure 10 digits
    String softwareCardNumber = decimalValue.toString().padLeft(10, '0');

    return softwareCardNumber;
  }

  _reset(event,emit){
    emit(const NfcReaderState.initial());
  }
}
