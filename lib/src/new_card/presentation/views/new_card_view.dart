import 'package:ndef/ndef.dart' as ndef;
import 'dart:io' show Platform, sleep;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_nfc_kit/flutter_nfc_kit.dart';
import 'package:fushati/core/res/media.dart';
import 'package:fushati/core/utils/constants/size_constatnts.dart';
import 'package:fushati/core/utils/core_utils.dart';
import 'package:fushati/src/new_card/presentation/app/nfc_availability_checker_cubit/nfc_scanner_cubit.dart';
import 'package:fushati/src/new_card/presentation/app/get_card_details_bloc/get_card_details_bloc.dart';
import 'package:fushati/src/new_card/presentation/app/nfc_reader_bloc/nfc_reader_bloc.dart';
import 'package:fushati/src/new_card/presentation/widgets/card_detail_dialog.dart';
import 'package:fushati/src/new_card/presentation/widgets/nfc_loader.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/common/singletons/form_validation.dart';
import '../../../../core/common/widgets/custome_appbar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../core/res/styles/colours.dart';
import '../../../../core/res/theme/app_theme.dart';

class NewCardView extends StatefulWidget {
  static String path = "/card-new";
  static String name = "/card-new";

  const NewCardView({super.key});

  @override
  State<NewCardView> createState() => _NewCardViewState();
}

class _NewCardViewState extends State<NewCardView> {
  late TextEditingController controller;
  late TextEditingController emailController;
  late TextEditingController nameController;
  late TextEditingController studentNumberController;
  late TextEditingController phoneNumberController;
  late final _formKey;
  String _platformVersion = '';
  NFCAvailability _availability = NFCAvailability.not_supported;
  NFCTag? _tag;
  String? _result, _writeResult, _mifareResult;
  late TabController _tabController;
  List<ndef.NDEFRecord>? _records;

  @override
  void initState() {
    _formKey = GlobalKey<FormState>();

    controller = TextEditingController();
    emailController = TextEditingController();
    nameController = TextEditingController();
    studentNumberController = TextEditingController();
    phoneNumberController = TextEditingController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NfcReaderBloc, NfcReaderState>(listener: (BuildContext _, state) {
      state.when(
          initial: () {},
          loading: () {
            if (Platform.isAndroid) {
              showDialog(
                context: context,
                builder: (_) {
                  return const NfcLoader();
                },
              );
            }
          },
          failed: (error) {
            ///to remove loader
            if (Platform.isAndroid) {
              Navigator.pop(context);
            }
            CoreUtils.showMyDialog(
                title: "${AppLocalizations.of(context)?.failedReadingNfc}",
                subTitle: error,
                onPressed: () {
                  Navigator.pop(context);
                });
          },
          success: (cardNumber) {
            ///to remove loader
            controller.text = cardNumber;
            if (Platform.isAndroid) {
              Navigator.pop(context);
            }
          });
    }, builder: (context, state) {
      state.whenOrNull(success: (cardNumber) {
        controller.text = cardNumber;
      });
      return Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: SizeConst.horizontalPadding, vertical: SizeConst.verticalPadding),
            child: Form(
              key: _formKey,
              child: CustomScrollView(
                slivers: [
                  SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        SizedBox(height: SizeConst.verticalPadding),
                        const CustomAppBar(),
                        SizedBox(height: 7.h),
                        Text(
                          "${AppLocalizations.of(context)?.addNewCard}",
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall
                              ?.copyWith(fontWeight: FontWeight.w700),
                        ),
                        SizedBox(height: 1.h),
                        Text(
                          "${AppLocalizations.of(context)?.pleaseEnterCardNum}",
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(fontWeight: FontWeight.w400),
                        ),
                        SizedBox(height: SizeConst.verticalPaddingFour),
                        TextFormField(
                          keyboardType: TextInputType.number,
                          style: CustomTheme.textFieldTextStyle,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(14),
                          ],
                          decoration: InputDecoration(
                            suffixIcon: BlocBuilder<NfcScannerCubit, NfcScannerState>(
                                builder: (context, state) {
                              return state.when(
                                initial: (isNfcSupported) => isNfcSupported
                                    ?
                                IconButton(
                                  onPressed: () async {
                                    try {
                                      NFCTag tag = await FlutterNfcKit.poll();
                                      setState(() {
                                        _tag = tag;
                                      });
                                      await FlutterNfcKit.setIosAlertMessage(
                                          "Working on it...");
                                      _mifareResult = null;
                                      if (tag.standard == "ISO 14443-4 (Type B)") {
                                        String result1 =
                                        await FlutterNfcKit.transceive("00B0950000");
                                        String result2 = await FlutterNfcKit.transceive(
                                            "00A4040009A00000000386980701");
                                        setState(() {
                                          _result = '1: $result1\n2: $result2\n';
                                        });
                                      }
                                      else if (tag.type == NFCTagType.iso18092) {
                                        String result1 =
                                        await FlutterNfcKit.transceive("060080080100");
                                        setState(() {
                                          _result = '1: $result1\n';
                                        });
                                      } else if (tag.ndefAvailable ?? false) {
                                        var ndefRecords = await FlutterNfcKit.readNDEFRecords();
                                        var ndefString = '';
                                        for (int i = 0; i < ndefRecords.length; i++) {
                                          ndefString += '${i + 1}: ${ndefRecords[i]}\n';
                                        }
                                        setState(() {
                                          _result = ndefString;
                                        });
                                      } else if (tag.type == NFCTagType.webusb) {
                                        var r = await FlutterNfcKit.transceive(
                                            "00A4040006D27600012401");
                                        print(r);
                                      }
                                      else if (tag.type == NFCTagType.iso15693) {
                                        String result1 = await FlutterNfcKit.transceive("0600B001001F");
                                        setState(() {
                                          _result = '1: $result1\n';
                                        });
                                      }
                                    } catch (e) {
                                      setState(() {
                                        _result = 'error: $e';
                                      });
                                    }

                                    // Pretend that we are working
                                    if (!kIsWeb) sleep(new Duration(seconds: 1));
                                    await FlutterNfcKit.finish(iosAlertMessage: "Finished!");
                                  },

                                  // onPressed: () {
                                        //   // context
                                        //   //     .read<NfcReaderBloc>()
                                        //   //     .add(const readCardNfcEvent());
                                        // },
                                        icon: Icon(
                                          Media.nfcIcon,
                                          size: 4.h,
                                          color: Colours.primaryGreenColor,
                                        ),
                                      )
                                    : const SizedBox.shrink(),
                              );
                            }),
                            hintText: "${AppLocalizations.of(context)?.cardNumber}",
                          ),
                          controller: controller,
                          validator: (value) =>
                              TextFormValidation.requiredField(value, context: context),
                          onFieldSubmitted: (_) {
                            bool filledFormCorrectly = _formKey.currentState?.validate();
                            if (filledFormCorrectly) {
                              showDialog(
                                barrierDismissible: false,
                                context: context,
                                builder: (context) => CardDetailsDialog(
                                  cardNumber: controller.text,
                                ),
                              );
                              context
                                  .read<GetCardDetailsBloc>()
                                  .add(GetCardDetailsEvent.getCard(cardNumber: controller.text));
                            }
                          },
                          onTapOutside: (_) => FocusScope.of(context).requestFocus(FocusNode()),
                        ),
                      ],
                    ),
                  ),
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              bool filledFormCorrectly = _formKey.currentState?.validate();
                              if (filledFormCorrectly) {
                                showDialog(
                                  barrierDismissible: false,
                                  context: context,
                                  builder: (context) => CardDetailsDialog(
                                    cardNumber: controller.text,
                                  ),
                                );
                                context
                                    .read<GetCardDetailsBloc>()
                                    .add(GetCardDetailsEvent.getCard(cardNumber: controller.text));
                              }
                            },
                            child: Text("${AppLocalizations.of(context)?.cont}")),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}

// class OldAddNewCard extends StatelessWidget {
//   const OldAddNewCard({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Padding(
//         padding: EdgeInsets.symmetric(
//             horizontal: SizeConst.horizontalPadding,
//             vertical: SizeConst.verticalPadding),
//         child: Form(
//           key: _formKey,
//           child: CustomScrollView(
//             slivers: [
//               SliverList(
//                 delegate: SliverChildListDelegate(
//                   [
//                     SizedBox(height: SizeConst.verticalPadding),
//                     const CustomAppBar(),
//                     SizedBox(height: 7.h),
//                     Text(
//                       "${AppLocalizations.of(context)?.addNewCard}",
//                       style: Theme.of(context)
//                           .textTheme
//                           .displaySmall
//                           ?.copyWith(fontWeight: FontWeight.w700),
//                     ),
//                     SizedBox(height: 1.h),
//                     Text(
//                       "${AppLocalizations.of(context)?.pleaseEnterCardNum}",
//                       style: Theme.of(context)
//                           .textTheme
//                           .titleMedium
//                           ?.copyWith(fontWeight: FontWeight.w400),
//                     ),
//                     SizedBox(height: SizeConst.verticalPaddingFour),
//                     TextFormField(
//                       style: CustomTheme.textFieldTextStyle,
//                       inputFormatters: [
//                         LengthLimitingTextInputFormatter(14),
//                       ],
//                       decoration: InputDecoration(
//                         suffixIcon:
//                         BlocBuilder<NfcScannerCubit, NfcScannerState>(
//                             builder: (context, state) {
//                               return state.when(
//                                 initial: (isNfcSupported) => isNfcSupported
//                                     ? IconButton(
//                                   onPressed: () {
//                                     context
//                                         .read<NfcReaderBloc>()
//                                         .add(const readCardNfcEvent());
//                                   },
//                                   icon: Icon(
//                                     Media.nfcIcon,
//                                     size: 4.h,
//                                     color: Colours.primaryGreenColor,
//                                   ),
//                                 )
//                                     : const SizedBox.shrink(),
//                               );
//                             }),
//                         hintText:
//                         "${AppLocalizations.of(context)?.cardNumber}",
//                       ),
//                       controller: controller,
//                       validator: (value) =>
//                           TextFormValidation.requiredField(value,
//                               context: context),
//                       onFieldSubmitted: (_) {
//                         bool filledFormCorrectly =
//                         _formKey.currentState?.validate();
//
//                         if (filledFormCorrectly) {
//                           showDialog(
//                             barrierDismissible: false,
//                             context: context,
//                             builder: (context) => CardDetailsDialog(
//                               cardNumber: controller.text,
//                             ),
//                           );
//                           context.read<GetCardDetailsBloc>().add(
//                               GetCardDetailsEvent.getCard(
//                                   cardNumber: controller.text));
//                         }
//                       },
//                       onTapOutside: (_) =>
//                           FocusScope.of(context).requestFocus(FocusNode()),
//                     ),
//                   ],
//                 ),
//               ),
//               SliverFillRemaining(
//                 hasScrollBody: false,
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     ElevatedButton(
//                         onPressed: () {
//                           bool filledFormCorrectly =
//                           _formKey.currentState?.validate();
//                           if (filledFormCorrectly) {
//                             showDialog(
//                               barrierDismissible: false,
//                               context: context,
//                               builder: (context) => CardDetailsDialog(
//                                 cardNumber: controller.text,
//                               ),
//                             );
//                             context.read<GetCardDetailsBloc>().add(
//                                 GetCardDetailsEvent.getCard(
//                                     cardNumber: controller.text));
//                           }
//                         },
//                         child:
//                         Text("${AppLocalizations.of(context)?.cont}")),
//                   ],
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     ),
//   }
// }
