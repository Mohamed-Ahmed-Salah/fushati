import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_nfc_kit/flutter_nfc_kit.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fushati/core/utils/constants/error_consts.dart';
import 'package:fushati/core/utils/core_utils.dart';

part 'nfc_reader_bloc.freezed.dart';

part 'nfc_reader_event.dart';

part 'nfc_reader_state.dart';

class NfcReaderBloc extends Bloc<NfcReaderEvent, NfcReaderState> {
  NfcReaderBloc() : super(const NfcReaderState.initial()) {
    on<readCardNfcEvent>(_readNfc);
    on<resetCardNfcEvent>(_reset);
  }
  //
  // _readNfc(event, emit) async {
  //   _readNfcFromExample(emit);
  //   // try {
  //   //   emit(const NfcReaderState.loading());
  //   //   NFCTag tag = await FlutterNfcKit.poll();
  //   //   log("NFC tag discovered: ${tag.id} applicationData ${tag.applicationData} ${tag.toJson.toString()}");
  //   //   log("${tag.protocolInfo} tag.protocolInfo and tag.systemCode= ${tag.systemCode}");
  //   //   String physicalCardNumber = tag.id;
  //   //   String softwareCardNumber = convertCardNumber(physicalCardNumber);
  //   //   print("Software Card Number: $softwareCardNumber");
  //   //   closeSession();
  //   //
  //   //   emit(NfcReaderState.success(softwareCardNumber));
  //   // } catch (e) {
  //   //   closeSession();
  //   //
  //   //   emit(NfcReaderState.failed(
  //   //       ErrorConst.getErrorBody(text: ErrorConst.UNKNOWN_ERROR)));
  //   // }
  // }
  _readNfc(event, emit) async {
    try {
      emit(NfcReaderState.loading());
      // Ensure we await the asynchronous function call
      await _readNfcFromExample(emit);
    } catch (e) {
      // Handle any unexpected errors here
      emit(NfcReaderState.failed(
          ErrorConst.getErrorBody(text: ErrorConst.UNKNOWN_ERROR)));
    }
  }

  _readNfcFromExample(emit) async {
    String? softwareCardNumber;
    try {
      debugPrint("BEFORE FlutterNfcKit.poll()");
      NFCTag tag = await FlutterNfcKit.poll();
      debugPrint("AFTER FlutterNfcKit.poll()");

      await FlutterNfcKit.setIosAlertMessage("Working on it...");

      debugPrint("NFC tag discovered: ${tag.id} applicationData ${tag.applicationData} ${tag.toJson.toString()}");
      debugPrint("${tag.protocolInfo} tag.protocolInfo and tag.systemCode= ${tag.systemCode}");
      String physicalCardNumber = tag.id;
      softwareCardNumber = convertCardNumber(physicalCardNumber);
      debugPrint("Software Card Number: $softwareCardNumber");

      // Emit success only if we have the softwareCardNumber
      if (softwareCardNumber != null|| softwareCardNumber.isNotEmpty) {
        emit(NfcReaderState.success(softwareCardNumber));
      }
    } catch (e) {
      CoreUtils.showSnackBar(
          message: ErrorConst.getErrorBody(text: ErrorConst.couldNotReadCardNumberEn));

      debugPrint("catch READING CARD ${e.toString()}");
      // Emit failure state in case of an error
      emit(NfcReaderState.failed(
          ErrorConst.getErrorBody(text: ErrorConst.couldNotReadCardNumberEn)));
    } finally {
      // Ensure we call finish in the finally block to close the session
      await FlutterNfcKit.finish(iosAlertMessage: "Finished!");
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

  closeSession() {
    log("stop session");
    FlutterNfcKit.finish();
  }

  _reset(event, emit) {
    emit(const NfcReaderState.initial());
  }
}
