import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_nfc_kit/flutter_nfc_kit.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:developer';

part 'nfc_scanner_state.dart';

part 'nfc_scanner_cubit.freezed.dart';

class NfcScannerCubit extends Cubit<NfcScannerState> {
  NfcScannerCubit()
      : super(const NfcScannerState.initial(isNfcAvailable: false));

  checkNfcSupported() async {
    NFCAvailability value = await FlutterNfcKit.nfcAvailability;
    log("Checking NFC availability");
    bool isAvailable = value == NFCAvailability.available;
    log(
        "Calling checkNfcSupported from splash value supports NFC: $isAvailable");

    emit(NfcScannerState.initial(isNfcAvailable: isAvailable));
  }


}
