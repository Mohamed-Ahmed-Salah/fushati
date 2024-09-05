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

  _readNfc(event, emit) async {
    _readNfcFromExample(emit);
    // try {
    //   emit(const NfcReaderState.loading());
    //   NFCTag tag = await FlutterNfcKit.poll();
    //   log("NFC tag discovered: ${tag.id} applicationData ${tag.applicationData} ${tag.toJson.toString()}");
    //   log("${tag.protocolInfo} tag.protocolInfo and tag.systemCode= ${tag.systemCode}");
    //   String physicalCardNumber = tag.id;
    //   String softwareCardNumber = convertCardNumber(physicalCardNumber);
    //   print("Software Card Number: $softwareCardNumber");
    //   closeSession();
    //
    //   emit(NfcReaderState.success(softwareCardNumber));
    // } catch (e) {
    //   closeSession();
    //
    //   emit(NfcReaderState.failed(
    //       ErrorConst.getErrorBody(text: ErrorConst.UNKNOWN_ERROR)));
    // }
  }

  _readNfcFromExample(emit) async {
    try {
      debugPrint("BEFORE FlutterNfcKit.poll()");
      NFCTag tag = await FlutterNfcKit.poll();
      debugPrint("AFTER FlutterNfcKit.poll()");

      await FlutterNfcKit.setIosAlertMessage("Working on it...");

      CoreUtils.showSnackBar(
          message:
              "NFC tag discovered: ${tag.id} applicationData ${tag.applicationData} ${tag.toJson.toString()}");
      log("NFC tag discovered: ${tag.id} applicationData ${tag.applicationData} ${tag.toJson.toString()}");
      log("${tag.protocolInfo} tag.protocolInfo and tag.systemCode= ${tag.systemCode}");
      String physicalCardNumber = tag.id;
      String softwareCardNumber = convertCardNumber(physicalCardNumber);
      log("Software Card Number: $softwareCardNumber");

      emit(NfcReaderState.success(softwareCardNumber));
      // _mifareResult = null;
      if (tag.standard == "ISO 14443-4 (Type B)") {
        String result1 = await FlutterNfcKit.transceive("00B0950000");
        String result2 =
            await FlutterNfcKit.transceive("00A4040009A00000000386980701");
        // setState(() {
        //   _result = '1: $result1\n2: $result2\n';
        // });
      } else if (tag.type == NFCTagType.iso18092) {
        String result1 = await FlutterNfcKit.transceive("060080080100");
        // setState(() {
        //   _result = '1: $result1\n';
        // });
      } else if (tag.ndefAvailable ?? false) {
        var ndefRecords = await FlutterNfcKit.readNDEFRecords();
        var ndefString = '';
        for (int i = 0; i < ndefRecords.length; i++) {
          ndefString += '${i + 1}: ${ndefRecords[i]}\n';
        }
        // setState(() {
        //   _result = ndefString;
        // });
      } else if (tag.type == NFCTagType.webusb) {
        var r = await FlutterNfcKit.transceive("00A4040006D27600012401");
        print(r);
      }
    } catch (e) {
      debugPrint("CARCH ${e.toString()}");
    }

    await FlutterNfcKit.finish(iosAlertMessage: "Finished!");
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
