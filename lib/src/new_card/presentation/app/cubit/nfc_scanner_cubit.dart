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
  Future<String?> readNfc(
      BuildContext context, TextEditingController controller) async {
     NFCAvailability value = await FlutterNfcKit.nfcAvailability;
    log("Checking NFC availability");
     bool isAvailable = value==NFCAvailability.available;
     String physicalCardNumber = "03811D6C";
     String softwareCardNumber = convertCardNumber(physicalCardNumber);
     print("Software Card Number: $softwareCardNumber"); // Output: 1813872899
    if (isAvailable) {
      try {
        log("NFC is available");
        await showDialog(
          context: context,
          builder: (_) {
            return const NfcLoader();
          },
        );

        // Poll for NFC tag
        NFCTag tag = await FlutterNfcKit.poll();
        log("NFC tag discovered: ${tag.id} ${tag.toJson.toString()}");

        String rfidData = '';

        // Check if the tag contains NDEF records
        if (tag.ndefAvailable??false) {
          log("NDEF tag detected");

          if (tag.ndefType!=null ) {
            // Read the NDEF message
            var ndef = await FlutterNfcKit.readNDEFRecords();
            var record = ndef[0];
            final payload = record.payload;
            log("Payload: $payload");

            // final data = String.fromCharCodes(payload);
            final data=payload?.toString();
            log("Data: $data");

            rfidData = "RFID Data: $data";
          } else {
            log("No NDEF records found");
            rfidData = "NDEF tag detected but no records found.";
          }

        } else if (tag.type == NFCTagType.iso7816) {
          log("ISO7816 tag detected");
// Send APDU command to select the application (example, replace with actual command)

          // Read Record to get PAN (Example APDU command)

          log(tag.toJson().toString());
          final selectCommand = '00A4040007A0000002471001'; // Example command, modify as needed
          final selectResponse = await FlutterNfcKit.transceive(selectCommand);
          log("Select Command Response: $selectResponse");
// Extract the PAN from the response (this will vary depending on card)
          // Note: This is a simplified example; real parsing depends on the card's response structure
          String cardNumber = extractPAN(selectResponse);
          // Handling for ISO7816 tags
          rfidData = "ISO7816 RFID Tag Detected: ${tag.toJson().toString()}";
          log("$rfidData");
        } else {
          rfidData = "Unknown tag detected";
          log("Unknown tag type detected");
        }

        // Remove loader
        Navigator.pop(context);
        log("NFC tag data: $rfidData");

        CoreUtils.showSuccess(
          title: "TAG READ",
          subTitle: "TAG DATA $rfidData",
          onPressed: () {},
        );
        // End the NFC session after reading
        await FlutterNfcKit.finish(iosAlertMessage: "NFC Session Ended");
      } catch (e) {
        log("Error occurred: ${e.toString()}");
        Navigator.pop(context); // Ensure the dialog is dismissed in case of an error
      }
    } else {
      log("No NFC reader available");
      CoreUtils.showSnackBar(
        message: "NFC is not available on this device or is turned off",
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
    bool isAvailable = value==NFCAvailability.available;
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
