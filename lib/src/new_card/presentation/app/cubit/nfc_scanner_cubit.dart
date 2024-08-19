import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fushati/core/utils/core_utils.dart';
import 'package:fushati/src/new_card/presentation/widgets/nfc_loader.dart';
import 'package:nfc_manager/nfc_manager.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nfc_manager/platform_tags.dart';

part 'nfc_scanner_state.dart';

part 'nfc_scanner_cubit.freezed.dart';

class NfcScannerCubit extends Cubit<NfcScannerState> {
  NfcScannerCubit()
      : super(const NfcScannerState.initial(isNfcAvailable: false));

  Future<String?> readNfc(
      BuildContext context, TextEditingController controller) async {
    bool isAvailable = await NfcManager.instance.isAvailable();

    if (isAvailable) {
      try{
        await showDialog(
            context: context,
            builder: (_) {
              return const NfcLoader();
            });
        NfcManager.instance.startSession(onError: (error) async {
          Navigator.pop(context);

          CoreUtils.showSnackBar(
              message: "${AppLocalizations.of(context)?.failedReadingNfc}");

          NfcManager.instance.stopSession();

          return;
        }, onDiscovered: (NfcTag tag) async {
          // var date = tag.data;
          // Assuming the RFID tag is ISO7816
          final ndef = Ndef.from(tag);

          String rfidData = '';
          if (ndef != null) {
            debugPrint("IS NDEF");
            /// Reading the NDEF message
            NdefMessage message = ndef.cachedMessage!;
            debugPrint("message ${message}");

            final payload = message.records.first.payload;
            debugPrint("payload ${payload}");

            final data = String.fromCharCodes(payload);
            debugPrint("data ${data}");

            rfidData = "RFID Data: $data";
          } else {
            debugPrint("Handling for non-NDEF tags");

            /// Handling for non-NDEF tags
            final iso7816 = Iso7816.from(tag);
            if (iso7816 != null) {
              /// Perform ISO7816 command and response processing here
              debugPrint("Perform ISO7816 command and response processing here");

              rfidData =
              "ISO7816 RFID Tag Detected ${iso7816.toString()} ${iso7816.identifier.toString()}";
              debugPrint("$rfidData");

            } else {
              rfidData = "Unknown tag detected";
            }
          }

          /// to remove loader
          Navigator.pop(context);
          debugPrint("NfcTag data: $rfidData");

          CoreUtils.showSuccess(
              title: "TAG READ",
              subTitle: "TAG DATA $rfidData",
              onPressed: () {});
          // End the NFC session after reading
          NfcManager.instance.stopSession();
        });
      }catch(e){debugPrint("ERROR CARCT ${e.toString()}");}

    } else {
      debugPrint("no NFC READER Available");
    }
  }

  closeSesion() {
    NfcManager.instance.stopSession();
  }

  checkNfcSupported() async {
    bool isAvailable = await NfcManager.instance.isAvailable();
    debugPrint(
        "Calling checkNfcSupported from splash value supports NFC: $isAvailable");

    emit(NfcScannerState.initial(isNfcAvailable: isAvailable));
  }
}
