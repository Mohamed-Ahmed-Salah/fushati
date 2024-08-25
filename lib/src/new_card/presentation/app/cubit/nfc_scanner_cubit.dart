import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_nfc_kit/flutter_nfc_kit.dart';
import 'package:fushati/core/utils/core_utils.dart';
import 'package:fushati/src/new_card/presentation/widgets/nfc_loader.dart';
import 'package:nfc_manager/nfc_manager.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nfc_manager/platform_tags.dart';
import 'dart:developer';

part 'nfc_scanner_state.dart';

part 'nfc_scanner_cubit.freezed.dart';

class NfcScannerCubit extends Cubit<NfcScannerState> {
  NfcScannerCubit()
      : super(const NfcScannerState.initial(isNfcAvailable: false));

//   Future<String?> readNfc(
//       BuildContext context, TextEditingController controller) async {
//     bool isAvailable = await NfcManager.instance.isAvailable();
// log("read ");
//
//     if (isAvailable) {
//       try{
//         log("AAAA");
//         await showDialog(
//             context: context,
//             builder: (_) {
//               return const NfcLoader();
//             });
//
//         NfcManager.instance.startSession(onError: (error) async {
//           log("error");
//
//           Navigator.pop(context);
//
//           CoreUtils.showSnackBar(
//               message: "${AppLocalizations.of(context)?.failedReadingNfc}");
//
//           NfcManager.instance.stopSession();
//
//           return;
//         }, onDiscovered: (NfcTag tag) async {
//           log("tag disc ${tag.data}");
//
//           // var date = tag.data;
//           // Assuming the RFID tag is ISO7816
//           final ndef = Ndef.from(tag);
//           log("ndef ${ndef ==null }");
//
//           String rfidData = '';
//           if (ndef != null) {
//             log("IS NDEF");
//             /// Reading the NDEF message
//             NdefMessage message = ndef.cachedMessage!;
//             log("message ${message}");
//
//             final payload = message.records.first.payload;
//             log("payload ${payload}");
//
//             final data = String.fromCharCodes(payload);
//             log("data ${data}");
//
//             rfidData = "RFID Data: $data";
//           } else {
//             log("Handling for non-NDEF tags");
//
//             /// Handling for non-NDEF tags
//             final iso7816 = Iso7816.from(tag);
//             if (iso7816 != null) {
//               /// Perform ISO7816 command and response processing here
//               log("Perform ISO7816 command and response processing here");
//
//               rfidData =
//               "ISO7816 RFID Tag Detected ${iso7816.toString()} ${iso7816.identifier.toString()}";
//               log("$rfidData");
//
//             } else {
//               rfidData = "Unknown tag detected";
//             }
//           }
//
//           /// to remove loader
//           Navigator.pop(context);
//           log("NfcTag data: $rfidData");
//
//           CoreUtils.showSuccess(
//               title: "TAG READ",
//               subTitle: "TAG DATA $rfidData",
//               onPressed: () {});
//           // End the NFC session after reading
//           NfcManager.instance.stopSession();
//         });
//       }catch(e){log("ERROR CARCT ${e.toString()}");}
//
//     } else {
//       log("no NFC READER Available");
//     }
//   }
  Future<String?> readNfc(BuildContext context,
      TextEditingController controller) async {
    ///we already checked isNfcAvailable access from previous checkNfcSupported that is called from splash
    log("Checking NFC availability");
    bool isAvailable = state.isNfcAvailable;

    if (isAvailable) {
      try {
        log("NFC is available");
        showDialog(
          context: context,
          builder: (_) {
            return const NfcLoader();
          },
        );

        // Poll for NFC tag
        NFCTag tag = await FlutterNfcKit.poll();
        log("NFC tag discovered: ${tag.id} applicationData ${tag
            .applicationData} ${tag.toJson.toString()}");
        log("${tag
            .protocolInfo} tag.protocolInfo and tag.systemCode= ${ tag
            .systemCode
        }");
        String physicalCardNumber = tag.id;
        String softwareCardNumber = convertCardNumber(physicalCardNumber);
        print(
            "Software Card Number: $softwareCardNumber");

        // Remove loader
        Navigator.pop(context,softwareCardNumber);

        // End the NFC session after reading
        await FlutterNfcKit.finish(iosAlertMessage: "NFC Session Ended");
      } catch (e) {
        log("Error occurred: ${e.toString()}");
        Navigator.pop(
            context); // Ensure the dialog is dismissed in case of an error
      }
    } else {
      log("No NFC reader available");
      CoreUtils.showSnackBar(
        message: "${AppLocalizations.of(context)?.nfcIsNotAvailable}",
      );
    }
  }

  String extractPAN(String apduResponse) {
    // Example logic to parse the APDU response and extract the PAN.
    // Actual implementation will depend on your card's specific data structure.
    // For instance, the PAN might be found in a specific byte range.
    // This is just an example and may need adjustments based on the actual response.
    String pan = apduResponse; // This is just an example
    return pan;
  }

  closeSesion() {
    log("stop session");
    NfcManager.instance.stopSession();
  }

  checkNfcSupported() async {
    NFCAvailability value = await FlutterNfcKit.nfcAvailability;
    log("Checking NFC availability");
    bool isAvailable = value == NFCAvailability.available;
    log(
        "Calling checkNfcSupported from splash value supports NFC: $isAvailable");

    emit(NfcScannerState.initial(isNfcAvailable: isAvailable));
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
}
