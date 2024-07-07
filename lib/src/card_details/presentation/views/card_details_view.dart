import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fushati/core/res/styles/colours.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/common/singletons/form_validation.dart';
import '../../../../core/common/widgets/custome_appbar.dart';
import '../../../../core/res/theme/app_theme.dart';
import '../../../../core/utils/constants/size_constatnts.dart';

class CardDetailsView extends StatefulWidget {
  static String path = "/card-details";
  static String name = "/card-details";

  const CardDetailsView({super.key});

  @override
  State<CardDetailsView> createState() => _CardDetailsViewState();
}

class _CardDetailsViewState extends State<CardDetailsView> {
  late TextEditingController controller;
  late TextEditingController notesController;
  late TextEditingController nameController;
  late final GlobalKey _formKey;

  @override
  void initState() {
    _formKey = GlobalKey<FormState>();

    controller = TextEditingController();
    notesController = TextEditingController();
    nameController = TextEditingController();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: SizeConst.horizontalPadding,
              vertical: SizeConst.verticalPadding),
          child: Form(
            key: _formKey,
            child: CustomScrollView(
              slivers: [
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      SizedBox(height: SizeConst.verticalPadding),
                      const CustomAppBar(),
                      SizedBox(height: 5.h),
                      Text(
                        "${AppLocalizations.of(context)?.cardDetails}",
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
                        style: CustomTheme.textFieldTextStyle,
                        decoration: InputDecoration(
                          hintText: "${AppLocalizations.of(context)?.name}",
                        ),
                        controller: nameController,
                        validator: (value) => TextFormValidation.requiredField(
                            value,
                            context: context),
                        onTapOutside: (_) =>
                            FocusScope.of(context).requestFocus(FocusNode()),
                      ),
                      SizedBox(height: SizeConst.verticalPadding),
                      TextFormField(
                        style: CustomTheme.textFieldTextStyle,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(14),
                        ],
                        decoration: InputDecoration(
                          hintText:
                              "${AppLocalizations.of(context)?.phoneNumber}",
                        ),
                        controller: controller,
                        validator: (value) => TextFormValidation.requiredField(
                            value,
                            context: context),
                        onTapOutside: (_) =>
                            FocusScope.of(context).requestFocus(FocusNode()),
                      ),
                      SizedBox(height: SizeConst.verticalPadding),
                      TextFormField(
                        minLines: 1,
                        maxLines: 3,
                        style: CustomTheme.textFieldTextStyle,
                        decoration: InputDecoration(
                          hintText: "${AppLocalizations.of(context)?.notes}",
                        ),
                        controller: notesController,
                        validator: (value) => TextFormValidation.requiredField(
                            value,
                            context: context),
                        onTapOutside: (_) =>
                            FocusScope.of(context).requestFocus(FocusNode()),
                      ),
                      SizedBox(height: SizeConst.verticalPadding),
                    ],
                  ),
                ),
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                elevation: 0,
                                backgroundColor:
                                    Colours.lightGreyButton // Background color
                                ),
                            onPressed: () {
                              context.push(CardDetailsView.path);
                              // bool filledFormCorrectly =
                              //     _formKey.currentState?.validate();
                              // if (filledFormCorrectly) {
                              //   ///todo call  function
                              // }
                            },
                            child: Text(
                                "${AppLocalizations.of(context)?.cancel}")),
                      ),
                      SizedBox(
                        width: 4.w,
                      ),
                      Expanded(
                        child: ElevatedButton(
                            onPressed: () {},
                            child: Text(
                                "${AppLocalizations.of(context)?.confirm}")),
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
  }
}
