import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fushati/core/res/styles/colours.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/common/singletons/form_validation.dart';
import '../../../../core/common/widgets/custome_appbar.dart';
import '../../../../core/res/theme/app_theme.dart';
import '../../../../core/utils/constants/size_constatnts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../profile/domain/entities/user.dart';
import '../app/bloc/edit_profile_bloc.dart';

class EditProfileView extends StatefulWidget {
  User user;
  static const name = '/edit-profile';
  static const path = '/edit-profile';

  EditProfileView({super.key, required this.user});

  @override
  State<EditProfileView> createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  late final TextEditingController name;
  late final TextEditingController email;
  late final _formKey;
  late String? gender;

  @override
  void initState() {
    _formKey = GlobalKey<FormState>();
    gender = widget.user.gender;
    name = TextEditingController(text: widget.user.name);
    email = TextEditingController(text: widget.user.email);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(SizeConst.horizontalPaddingFour),
          child: Form(
            key: _formKey,
            child: CustomScrollView(
              slivers: [
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      SizedBox(height: SizeConst.verticalPadding),
                      CustomAppBar(
                        text: "${AppLocalizations.of(context)?.profileDetails}",
                      ),
                      SizedBox(height: 5.h),
                      Text(
                        "${AppLocalizations.of(context)?.profileDetails}",
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall
                            ?.copyWith(fontWeight: FontWeight.w700),
                      ),
                      if (widget.user.name == null)
                        SizedBox(
                          height: 1.5.h,
                        ),
                      if (widget.user.name == null)
                        Text(
                          "${AppLocalizations.of(context)?.completeProfile}",
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(
                                  fontWeight: FontWeight.w400,
                                  color:
                                      Colours.textBlackColor.withOpacity(0.7)),
                        ),
                      SizedBox(
                        height: SizeConst.verticalPadding,
                      ),
                      TextFormField(
                        style: CustomTheme.textFieldTextStyle,
                        validator: (value) =>
                            TextFormValidation.fullNameValidation(value,
                                context: context),
                        onTapOutside: (_) =>
                            FocusScope.of(context).requestFocus(FocusNode()),
                        controller: name,
                        onChanged: (value) {},
                        keyboardType: TextInputType.name,
                        autofillHints: const [
                          AutofillHints.name,
                        ],
                        decoration: InputDecoration(
                          hintText: "${AppLocalizations.of(context)?.nameReq}",
                        ),
                      ),
                      SizedBox(
                        height: SizeConst.verticalPadding,
                      ),
                      TextFormField(
                        style: CustomTheme.textFieldTextStyle,
                        validator: (value) =>
                            TextFormValidation.optionalEmailValidation(value,
                                context: context),
                        onTapOutside: (_) =>
                            FocusScope.of(context).requestFocus(FocusNode()),
                        controller: email,
                        onChanged: (value) {},
                        keyboardType: TextInputType.emailAddress,
                        autofillHints: const [
                          AutofillHints.email,
                        ],
                        decoration: InputDecoration(
                          hintText:
                              "${AppLocalizations.of(context)?.emailOption}",
                        ),
                      ),
                      SizedBox(
                        height: SizeConst.verticalPadding,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "${AppLocalizations.of(context)?.gender}",
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                    fontWeight: FontWeight.w400,
                                    color: Colours.textBlackColor
                                        .withOpacity(0.7)),
                          ),
                          GenderRadioRow(
                            onTap: () {
                              setState(() {
                                gender = "Male";
                              });
                            },
                            gender: "${AppLocalizations.of(context)?.male}",
                            isSelected: gender == "Male",
                          ),
                          GenderRadioRow(
                            onTap: () {
                              setState(() {
                                gender = "Female";
                              });
                            },
                            gender: "${AppLocalizations.of(context)?.female}",
                            isSelected: gender == "Female",
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              elevation: 0,
                              backgroundColor: Colours.lightGreyButton),
                          onPressed: () {
                            context.pop();
                          },
                          child:
                              Text("${AppLocalizations.of(context)?.discard}"),
                        ),
                      ),
                      SizedBox(
                        width: SizeConst.horizontalPadding,
                      ),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            bool filledFormCorrectly =
                                _formKey.currentState?.validate();
                            if (filledFormCorrectly) {
                              context
                                  .read<EditProfileBloc>()
                                  .add(EditProfileEvent.editUserProfile(
                                    context: context,
                                    name: name.text,
                                    email: email.text,
                                    gender: gender,
                                  ));
                            }
                          },
                          child:
                              Text("${AppLocalizations.of(context)?.confirm}"),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class GenderRadioRow extends StatelessWidget {
  final bool isSelected;
  final String gender;
  final Function()? onTap;

  const GenderRadioRow(
      {super.key, required this.isSelected, required this.gender, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Text(
            gender,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w400,
                color: Colours.textBlackColor.withOpacity(0.5)),
          ),
          AnimatedContainer(
            margin: EdgeInsets.symmetric(horizontal: 1.h),
            height: 10.25.w,
            width: 10.25.w,
            duration: const Duration(milliseconds: 400),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(SizeConst.borderRadius),
              ),
              border: Border.all(
                  color: isSelected
                      ? Colours.blackColor
                      : Colours.borderGreyColor),
            ),
            child: Center(
              child: AnimatedContainer(
                curve: Curves.fastLinearToSlowEaseIn,
                height: 5.w,
                decoration: BoxDecoration(
                  color: isSelected
                      ? Colours.primaryGreenColor
                      : Colors.transparent,
                  shape: BoxShape.circle,
                ),
                duration: const Duration(milliseconds: 400),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
