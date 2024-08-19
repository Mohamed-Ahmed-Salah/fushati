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
        /// to remove loader
        Navigator.pop(context);
        // var date = tag.data;
        // Assuming the RFID tag is ISO7816
        final ndef = Ndef.from(tag);

        String _rfidData = '';
        if (ndef != null) {
          /// Reading the NDEF message
          NdefMessage message = ndef.cachedMessage!;
          final payload = message.records.first.payload;
          final data = String.fromCharCodes(payload);
          _rfidData = "RFID Data: $data";
        } else {
          /// Handling for non-NDEF tags
          final iso7816 = Iso7816.from(tag);
          if (iso7816 != null) {
            // Perform ISO7816 command and response processing here

            _rfidData = "ISO7816 RFID Tag Detected ${iso7816.toString()}";
          } else {
            _rfidData = "Unknown tag detected";
          }
        }
        debugPrint("NfcTag data: $_rfidData");

        CoreUtils.showSuccess(
            title: "TAG READ", subTitle: "TAG DATA $_rfidData", onPressed: () {});
        // End the NFC session after reading
        NfcManager.instance.stopSession();
      });
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
