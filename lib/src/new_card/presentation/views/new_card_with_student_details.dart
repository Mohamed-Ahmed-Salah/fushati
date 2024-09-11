import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fushati/core/res/styles/colours.dart';
import 'package:fushati/core/utils/constants/size_constatnts.dart';
import 'package:fushati/core/utils/core_utils.dart';
import 'package:fushati/src/new_card/presentation/app/add_new_card_bloc/add_new_card_bloc.dart';
import 'package:fushati/src/new_card/presentation/app/nfc_reader_bloc/nfc_reader_bloc.dart';
import 'package:fushati/src/new_card/presentation/views/add_card_loader.dart';
import 'package:fushati/src/new_card/presentation/widgets/nfc_loader.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/common/singletons/form_validation.dart';
import '../../../../core/common/widgets/custome_appbar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../core/res/theme/app_theme.dart';

class NewCardWithStudentDetailsView extends StatefulWidget {
  final String cardNumber;
  static String path = "card-new-with-details";
  static String name = "card-new-with-details";

  const NewCardWithStudentDetailsView({super.key, required this.cardNumber});

  @override
  State<NewCardWithStudentDetailsView> createState() =>
      _NewCardWithStudentDetailsViewState();
}

class _NewCardWithStudentDetailsViewState
    extends State<NewCardWithStudentDetailsView> {
  late TextEditingController cardNumberController;
  late TextEditingController emailController;
  late TextEditingController nameController;
  late TextEditingController studentNumberController;
  late TextEditingController phoneNumberController;
  late final _formKey;

  @override
  void initState() {
    _formKey = GlobalKey<FormState>();

    cardNumberController = TextEditingController();
    cardNumberController.text = widget.cardNumber;
    emailController = TextEditingController();
    nameController = TextEditingController();
    studentNumberController = TextEditingController();
    phoneNumberController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    cardNumberController.dispose();
    emailController.dispose();
    nameController.dispose();
    studentNumberController.dispose();
    phoneNumberController.dispose();
    super.dispose();
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
                          enabled: false,
                          keyboardType: TextInputType.number,
                          style: CustomTheme.textFieldTextStyle,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(25),
                          ],
                          decoration: InputDecoration(
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
                                "${AppLocalizations.of(context)?.studentNumberOrIdentityNumber}",
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
                          keyboardType: TextInputType.emailAddress,
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
                            LengthLimitingTextInputFormatter(9),
                          ],
                          decoration: InputDecoration(
                            prefixIcon: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 2.w),
                              child: SizedBox(
                                height: 3.h,
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      "+966",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium
                                          ?.copyWith(
                                              fontWeight: FontWeight.w500,
                                              color: Colours.blackColor),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 1.w, vertical: 0.5.h),
                                      child: const VerticalDivider(
                                        width: 4,
                                        thickness: 1.5,
                                        color: Colours.dividerGreyColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            hintText:
                                "${AppLocalizations.of(context)?.phoneNumber}",
                          ),
                          controller: phoneNumberController,
                          validator: (value) =>
                              TextFormValidation.phoneValidation(value,
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
                                        phoneNumber:
                                            "966${phoneNumberController.text}",
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
