import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fushati/core/res/media.dart';
import 'package:fushati/core/utils/constants/size_constatnts.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../res/styles/colours.dart';
import '../../res/theme/app_theme.dart';
import '../singletons/form_validation.dart';

class PickAmountBottomSheet extends StatefulWidget {
  const PickAmountBottomSheet({super.key});

  @override
  State<PickAmountBottomSheet> createState() => _PickAmountBottomSheetState();
}

class _PickAmountBottomSheetState extends State<PickAmountBottomSheet> {
  late TextEditingController _controller;
  late final _formKey;

  @override
  void initState() {
    _controller = TextEditingController();
    _formKey = GlobalKey<FormState>();

    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Form(
        key: _formKey,
        child: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
              color: Colours.whiteColor,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10))),
          child: SingleChildScrollView(
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(5.w),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          "${AppLocalizations.of(context)?.topUpBalance}",
                          textAlign: TextAlign.start,
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(fontWeight: FontWeight.w500),
                        ),
                      ),
                      InkWell(
                        onTap: () => context.pop(),
                        child: Container(
                          padding: EdgeInsets.all(1.h),
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colours.borderGreyColor),
                              borderRadius: BorderRadius.all(
                                  Radius.circular(SizeConst.borderRadius))),
                          child: const Icon(Media.closeIcon),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Text(
                    "${AppLocalizations.of(context)?.enterRechargeAmount}",
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w400,
                          color: Colours.textBlackColor.withOpacity(0.52),
                        ),
                  ),
                  SizedBox(
                    height: SizeConst.verticalPadding,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            if (_controller.text.isEmpty) {
                              return;
                            }

                            final text = _controller.text;

                            final textLength = text.length;
                            int number = int.parse(text);
                            if (number <= 0) {
                              _controller.text = "0";
                              return;
                            } else {
                              int multiplyer = textLength > 2
                                  ? int.parse("1${("0" * (textLength - 1))}")
                                  : 100;
                              String normalCeil =
                                  (((number / multiplyer).floor()) * multiplyer)
                                      .toString();
                              String customCeil =
                                  ((((number - multiplyer) / multiplyer)
                                              .floor()) *
                                          multiplyer)
                                      .toString();
                              _controller.text =
                                  normalCeil == text ? customCeil : normalCeil;
                            }
                          },
                          child: Container(
                              padding: EdgeInsets.all(
                                  SizeConst.horizontalPaddingFour),
                              decoration: BoxDecoration(
                                  color: Colours.primaryGreenColor,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(3.w))),
                              child: const Icon(Media.minusIcon,
                                  color: Colours.brandColorOne)),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: SizeConst.horizontalPadding),
                            child: TextFormField(
                              style: CustomTheme.textFieldTextStyle,
                              textAlign: TextAlign.center,
                              controller: _controller,
                              validator: (value) =>
                                  TextFormValidation.requiredFieldNoMessage(
                                      value,
                                      context: context),
                              onTapOutside: (_) => FocusScope.of(context)
                                  .requestFocus(FocusNode()),
                              // controller: _controller,
                              onChanged: (value) {},
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(9),
                                FilteringTextInputFormatter.allow(
                                    RegExp(r'^[1-9][0-9]*')),
                              ],
                              decoration: const InputDecoration(hintText: "0"),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            if (_controller.text.isEmpty) {
                              _controller.text = "500";
                              return;
                            }
                            final text = _controller.text;
                            final textLength = text.length;
                            int number = int.parse(text);
                            int multiplyer = textLength > 2
                                ? int.parse("1${("0" * (textLength - 1))}")
                                : 100;
                            String normalCeil =
                                (((number / multiplyer).ceil()) * multiplyer)
                                    .toString();
                            String customCeil =
                                ((((number + multiplyer) / multiplyer).ceil()) *
                                        multiplyer)
                                    .toString();
                            _controller.text =
                                normalCeil == text ? customCeil : normalCeil;
                          },
                          child: Container(
                              padding: EdgeInsets.all(
                                  SizeConst.horizontalPaddingFour),
                              decoration: BoxDecoration(
                                  color: Colours.primaryGreenColor,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(3.w))),
                              child: const Icon(
                                Media.plusIcon,
                                color: Colours.brandColorOne,
                              )),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: SizeConst.verticalPadding,
                  ),
                  Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(top: 1.5.h),
                    child: Wrap(
                      spacing: 3.w,
                      alignment: WrapAlignment.center,
                      children: [
                        CustomChipButton(
                          price: "500",
                          onTap: () {
                            _controller.text = "500";
                            // context
                            //     .read<AmountToTransferCubit>()
                            //     .addingAmountEvent(amount: int.parse(price));
                            // context.pop();
                            // context.pushNamed(MoyasarWalletTransferView.name);
                          },
                        ),
                        CustomChipButton(
                          onTap: () {
                            _controller.text = "750";
                          },
                          price: "750",
                        ),
                        CustomChipButton(
                          onTap: () {
                            _controller.text = "1000";
                          },
                          price: "1000",
                        ),
                        CustomChipButton(
                          onTap: () {
                            _controller.text = "1500";
                          },
                          price: "1500",
                        ),
                        CustomChipButton(
                          onTap: () {
                            _controller.text = "2000";
                          },
                          price: "2000",
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      bool filledFormCorrectly =
                          _formKey.currentState?.validate();
                      if (filledFormCorrectly) {
                        // context.read<AmountToTransferCubit>().addingAmountEvent(
                        //     amount: int.parse(_controller.text));
                        // Navigator.pop(context);
                        // context.pushNamed(MoyasarWalletTransferView.name);
                      }
                    },
                    child: Text(
                      "${AppLocalizations.of(context)?.next}",
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomChipButton extends StatelessWidget {
  final String price;
  final Function() onTap;

  const CustomChipButton({super.key, required this.price, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Chip(
        elevation: 0,
        color: WidgetStateProperty.all<Color>(Colours.greyLightColor),
        side: const BorderSide(color: Colors.transparent),
        backgroundColor: Colours.greyLightColor,
        label: Text(
          '$price SAR',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: Colours.textBlackColor.withOpacity(0.7),
              fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}
