import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fushati/core/res/media.dart';
import 'package:fushati/core/utils/constants/size_constatnts.dart';
import 'package:fushati/core/utils/core_utils.dart';
import 'package:fushati/src/new_card/presentation/app/add_new_card_bloc/add_new_card_bloc.dart';
import 'package:fushati/src/new_card/presentation/app/bloc/nfc_reader_bloc.dart';
import 'package:fushati/src/new_card/presentation/app/cubit/nfc_scanner_cubit.dart';
import 'package:fushati/src/new_card/presentation/views/add_card_loader.dart';
import 'package:fushati/src/new_card/presentation/widgets/nfc_loader.dart';
import 'package:go_router/go_router.dart';
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
  late TextEditingController cardNumberController;
  late TextEditingController emailController;
  late TextEditingController nameController;
  late TextEditingController studentNumberController;
  late TextEditingController phoneNumberController;
  late final _formKey;

  @override
  void initState() {
    context.read<NfcScannerCubit>().checkNfcSupported();

    _formKey = GlobalKey<FormState>();

    cardNumberController = TextEditingController();
    emailController = TextEditingController();
    nameController = TextEditingController();
    studentNumberController = TextEditingController();
    phoneNumberController = TextEditingController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NfcReaderBloc, NfcReaderState>(
        listener: (BuildContext _, state) {
      state.when(
          initial: () {},
          loading: () {
            showDialog(
              context: context,
              builder: (_) {
                return const NfcLoader();
              },
            );
          },
          failed: (error) {
            ///to remove loader
            Navigator.pop(context);
            CoreUtils.showMyDialog(
                title: "${AppLocalizations.of(context)?.failedReadingNfc}",
                subTitle: error,
                onPressed: () {
                  Navigator.pop(context);
                });
          },
          success: (cardNumber) {
            ///to remove loader
            cardNumberController.text = cardNumber;
            Navigator.pop(context);
          });
    }, builder: (context, state) {
      state.whenOrNull(success: (cardNumber) {
        cardNumberController.text = cardNumber;
      });
      return Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(
                left: SizeConst.horizontalPadding,
                right: SizeConst.horizontalPadding,
                top: SizeConst.verticalPadding),
            child: Form(
              key: _formKey,
              child: CustomScrollView(
                slivers: [
                  SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        SizedBox(height: SizeConst.verticalPadding),
                        CustomAppBar(
                          text: "${AppLocalizations.of(context)?.addNewCard}",
                        ),
                        SizedBox(height: SizeConst.verticalPaddingFour),
                        Text(
                          "${AppLocalizations.of(context)?.addNewStudentCard}",
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall
                              ?.copyWith(fontWeight: FontWeight.w700),
                        ),
                        SizedBox(height: 1.h),
                        Text(
                          "${AppLocalizations.of(context)?.pleaseEnterStudentCardAndInfo}",
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
                            LengthLimitingTextInputFormatter(25),
                          ],
                          decoration: InputDecoration(
                            suffixIcon:
                                BlocBuilder<NfcScannerCubit, NfcScannerState>(
                                    builder: (context, state) {
                              return state.when(
                                initial: (isNfcSupported) => isNfcSupported &&
                                        Platform.isAndroid
                                    ? IconButton(
                                        onPressed: () {
                                          context
                                              .read<NfcReaderBloc>()
                                              .add(const readCardNfcEvent());
                                        },
                                        icon: Icon(
                                          Media.nfcIcon,
                                          size: 4.h,
                                          color: Colours.primaryGreenColor,
                                        ),
                                      )
                                    : const SizedBox.shrink(),
                              );
                            }),
                            hintText:
                                "${AppLocalizations.of(context)?.cardNumber}",
                          ),
                          controller: cardNumberController,
                          validator: (value) =>
                              TextFormValidation.requiredField(value,
                                  context: context),
                          onTapOutside: (_) =>
                              FocusScope.of(context).requestFocus(FocusNode()),
                        ),
                        SizedBox(height: SizeConst.horizontalPadding),
                        TextFormField(
                          style: CustomTheme.textFieldTextStyle,
                          decoration: InputDecoration(
                            hintText:
                                "${AppLocalizations.of(context)?.studentName}",
                          ),
                          controller: nameController,
                          validator: (value) =>
                              TextFormValidation.fullNameValidation(value,
                                  context: context),
                          onTapOutside: (_) =>
                              FocusScope.of(context).requestFocus(FocusNode()),
                        ),
                        SizedBox(height: SizeConst.horizontalPadding),
                        TextFormField(
                          keyboardType: TextInputType.number,
                          style: CustomTheme.textFieldTextStyle,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(25),
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          decoration: InputDecoration(
                            hintText:
                                "${AppLocalizations.of(context)?.studentNumber}",
                          ),
                          controller: studentNumberController,
                          validator: (value) =>
                              TextFormValidation.requiredField(value,
                                  context: context),
                          onTapOutside: (_) =>
                              FocusScope.of(context).requestFocus(FocusNode()),
                        ),
                        SizedBox(height: SizeConst.horizontalPadding),
                        TextFormField(
                          style: CustomTheme.textFieldTextStyle,
                          decoration: InputDecoration(
                            hintText: "${AppLocalizations.of(context)?.email}",
                          ),
                          controller: emailController,
                          validator: (value) =>
                              TextFormValidation.emailValidation(value,
                                  context: context),
                          onTapOutside: (_) =>
                              FocusScope.of(context).requestFocus(FocusNode()),
                        ),
                        SizedBox(height: SizeConst.horizontalPadding),
                        TextFormField(
                          keyboardType: TextInputType.number,
                          style: CustomTheme.textFieldTextStyle,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(12),
                          ],
                          decoration: InputDecoration(
                            hintText:
                                "${AppLocalizations.of(context)?.phoneNumber}",
                          ),
                          controller: phoneNumberController,
                          validator: (value) =>
                              TextFormValidation.saudiPhoneValidation(value,
                                  context: context),
                          onTapOutside: (_) =>
                              FocusScope.of(context).requestFocus(FocusNode()),
                        ),
                        SizedBox(
                          height: 5.h,
                        )
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
                              bool filledFormCorrectly =
                                  _formKey.currentState?.validate();
                              if (filledFormCorrectly) {
                                context.read<AddNewCardBloc>().add(
                                    AddNewCardEvent.addCard(
                                        cardNumber: cardNumberController.text,
                                        name: nameController.text,
                                        email: emailController.text,
                                        phoneNumber: phoneNumberController.text,
                                        studentNumber:
                                            studentNumberController.text));
                                context.pushNamed(AddCardLoaderView.path);
                              }
                            },
                            child:
                                Text("${AppLocalizations.of(context)?.cont}")),
                        SizedBox(
                          height: SizeConst.verticalPadding,
                        ),
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
