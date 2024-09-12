import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fushati/core/common/widgets/error_view.dart';
import 'package:fushati/core/common/widgets/loading_view.dart';
import 'package:fushati/core/res/media.dart';
import 'package:fushati/core/utils/constants/size_constatnts.dart';
import 'package:fushati/src/home/domain/entity/card.dart';
import 'package:fushati/src/home/presentation/apps/registration_fees_bloc/registration_fees_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../core/common/singletons/form_validation.dart';
import '../../../../core/common/widgets/close_button.dart';
import '../../../../core/res/styles/colours.dart';
import '../../../../core/res/theme/app_theme.dart';
import '../../../../core/utils/constants/text_constants.dart';
import '../../../moyasar_transfer/presentation/app/cubit/amount_to_transfer_cubit.dart';
import '../../../moyasar_transfer/presentation/view/moyasar_wallet_transfer_view.dart';

class PickAmountBottomSheet extends StatefulWidget {
  final CardEntity card;

  const PickAmountBottomSheet({super.key, required this.card});

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
            child: BlocBuilder<RegistrationFeesBloc, RegistrationFeesState>(
                builder: (context, state) {
              return state.when(loading: () {
                return SizedBox(
                    height: 40.h, child: const Center(child: LoadingWidget()));
              }, failed: (message) {
                return SizedBox(
                  height: 40.h,
                  child: ErrorView(
                      onPressed: () {
                        context
                            .read<RegistrationFeesBloc>()
                            .add(const RegistrationFeesEvent.getFees());
                      },
                      message: message),
                );
              }, success: (fees) {
                return Container(
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
                          const CustomCloseButton(),
                        ],
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Text(
                        widget.card.isNewCard
                            ? "${AppLocalizations.of(context)?.enterRechargeAmountWithFees(fees)}"
                            : "${AppLocalizations.of(context)?.enterRechargeAmount}",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(
                              fontWeight: FontWeight.w400,
                              color: Colours.textBlackColor.withOpacity(0.52),
                            ),
                      ),
                      SizedBox(
                        height: SizeConst.verticalPadding,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: FormField<String>(
                            validator: (value) => TextFormValidation.minBalance(
                                _controller.text,
                                context: context),
                            builder: (FormFieldState<String> fieldState) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          if (_controller.text.isEmpty) {
                                            return;
                                          }

                                          final text = _controller.text;

                                          int number = int.parse(text);
                                          if (number <= 0) {
                                            _controller.text = "0";
                                            return;
                                          } else {
                                            int multiplyer = 100;
                                            String normalCeil =
                                                (((number / multiplyer)
                                                            .floor()) *
                                                        multiplyer)
                                                    .toString();
                                            String customCeil =
                                                ((((number - multiplyer) /
                                                                multiplyer)
                                                            .floor()) *
                                                        multiplyer)
                                                    .toString();
                                            _controller.text =
                                                normalCeil == text
                                                    ? customCeil
                                                    : normalCeil;
                                          }
                                        },
                                        child: Container(
                                            padding: EdgeInsets.all(SizeConst
                                                .horizontalPaddingFour),
                                            decoration: BoxDecoration(
                                                color:
                                                    Colours.primaryGreenColor,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(3.w))),
                                            child: const Icon(Media.minusIcon,
                                                color: Colours.brandColorOne)),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal:
                                                  SizeConst.horizontalPadding),
                                          child: TextFormField(
                                            onFieldSubmitted: (_) {
                                              bool filledFormCorrectly =
                                                  _formKey.currentState
                                                      ?.validate();
                                              if (filledFormCorrectly) {
                                                context
                                                    .read<
                                                        AmountToTransferCubit>()
                                                    .addingAmountEvent(
                                                        amount: int.parse(
                                                            _controller.text));
                                                Navigator.pop(context);
                                                context.pushNamed(
                                                    MoyasarWalletTransferView
                                                        .name,
                                                    extra: widget.card);
                                              }
                                            },
                                            style:
                                                CustomTheme.textFieldTextStyle,
                                            textAlign: TextAlign.center,
                                            controller: _controller,
                                            onTapOutside: (_) =>
                                                FocusScope.of(context)
                                                    .requestFocus(FocusNode()),
                                            onChanged: (value) {},
                                            keyboardType: TextInputType.number,
                                            inputFormatters: [
                                              LengthLimitingTextInputFormatter(
                                                  9),
                                              FilteringTextInputFormatter.allow(
                                                  RegExp(r'^[1-9][0-9]*')),
                                            ],
                                            decoration: const InputDecoration(
                                                hintText: "0"),
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
                                          int number = int.parse(text);
                                          int multiplyer = 100;
                                          String normalCeil =
                                              (((number / multiplyer).ceil()) *
                                                      multiplyer)
                                                  .toString();
                                          String customCeil =
                                              ((((number + multiplyer) /
                                                              multiplyer)
                                                          .ceil()) *
                                                      multiplyer)
                                                  .toString();
                                          _controller.text = normalCeil == text
                                              ? customCeil
                                              : normalCeil;
                                        },
                                        child: Container(
                                            padding: EdgeInsets.all(SizeConst
                                                .horizontalPaddingFour),
                                            decoration: BoxDecoration(
                                                color:
                                                    Colours.primaryGreenColor,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(3.w))),
                                            child: const Icon(
                                              Media.plusIcon,
                                              color: Colours.brandColorOne,
                                            )),
                                      ),
                                    ],
                                  ),
                                  if (fieldState.hasError)
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Text(
                                        fieldState.errorText ?? '',
                                        style: TextStyle(
                                            color: Colours.errorColor,
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: TextConstants.font),
                                      ),
                                    ),
                                ],
                              );
                            }),
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
                              price: "50",
                              onTap: () {
                                _controller.text = "50";
                              },
                            ),
                            CustomChipButton(
                              onTap: () {
                                _controller.text = "100";
                              },
                              price: "100",
                            ),
                            CustomChipButton(
                              onTap: () {
                                _controller.text = "200";
                              },
                              price: "200",
                            ),
                            CustomChipButton(
                              onTap: () {
                                _controller.text = "300";
                              },
                              price: "300",
                            ),
                            CustomChipButton(
                              onTap: () {
                                _controller.text = "400";
                              },
                              price: "400",
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
                            context
                                .read<AmountToTransferCubit>()
                                .addingAmountEvent(
                                    amount: int.parse(_controller.text));
                            Navigator.pop(context);
                            context.pushNamed(MoyasarWalletTransferView.name,
                                extra: widget.card);
                          }
                        },
                        child: Text(
                          "${AppLocalizations.of(context)?.next}",
                        ),
                      ),
                    ],
                  ),
                );
              });
            }),
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
