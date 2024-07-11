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
  final User user;
  static const name = '/edit-profile';
  static const path = '/edit-profile';

  const EditProfileView({super.key, required this.user});

  @override
  State<EditProfileView> createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  late final TextEditingController name;
  late final TextEditingController email;
  late final _formKey;

  @override
  void initState() {
    _formKey = GlobalKey<FormState>();

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
