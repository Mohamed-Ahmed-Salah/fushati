import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// import 'package:flutter_nfc_kit/flutter_nfc_kit.dart';
// import 'package:ndef/ndef.dart' as ndef;

import 'package:equatable/equatable.dart';
import 'package:fushati/core/res/media.dart';
import 'package:fushati/core/res/styles/colours.dart';
import 'package:fushati/core/utils/constants/size_constatnts.dart';
import 'package:fushati/core/utils/core_utils.dart';
import 'package:fushati/src/new_card/presentation/widgets/nfc_loader.dart';
import 'package:lottie/lottie.dart';
import 'package:nfc_manager/nfc_manager.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

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
        var date = tag.data;
        debugPrint("NfcTag data: $date");
        CoreUtils.showSuccess(
            title: "TAG READ", subTitle: "TAG DATA $date", onPressed: () {});
        controller.text = tag.data.length.toString();
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
