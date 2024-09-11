import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fushati/core/common/app/cache_helper.dart';
import 'package:fushati/core/common/widgets/error_view.dart';
import 'package:fushati/core/common/widgets/loading_view.dart';
import 'package:fushati/core/res/media.dart';
import 'package:fushati/core/res/styles/colours.dart';
import 'package:fushati/core/services/injection_container.dart';
import 'package:fushati/core/utils/constants/error_consts.dart';
import 'package:fushati/core/utils/constants/size_constatnts.dart';
import 'package:fushati/src/auth/presentation/app/blocs/auth_bloc/authenticator_bloc.dart';
import 'package:fushati/src/splash/presentation/app/get_schools_bloc/get_schools_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../core/common/singletons/form_validation.dart';
import '../../../../core/common/widgets/animated_button_circular_loader.dart';
import '../../../../core/common/widgets/custome_appbar.dart';
import '../../../../core/common/widgets/green_background.dart';
import '../../../../core/res/theme/app_theme.dart';
import '../../../../core/utils/constants/text_constants.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  static const path = '/login';

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late TextEditingController _controller;
  late final _formKey;
  late final SingleValueDropDownController schoolController;

  @override
  void initState() {
    schoolController = SingleValueDropDownController();
    _formKey = GlobalKey<FormState>();
    _controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GreenBackground(
        child: BlocBuilder<GetSchoolsBloc, GetSchoolsState>(
            builder: (context, state) {
          return state.when(
            loading: () => const LoadingWidget(),
            failed: (message) => ErrorView(
                onPressed: () {
                  context
                      .read<GetSchoolsBloc>()
                      .add(const GetSchoolsEvent.getSchools());
                },
                message: ErrorConst.getErrorBody(text: message)),
            success: (schools) => Form(
              key: _formKey,
              child: Container(
                height: 100.h,
                width: double.infinity,
                padding: EdgeInsets.all(5.w),
                child: SafeArea(
                  child: CustomScrollView(
                    slivers: [
                      SliverList(
                        delegate: SliverChildListDelegate(
                          [
                            SizedBox(height: 2.h),
                            const CustomAppBar(showBackButton: false),
                            SizedBox(height: 7.h),
                            Text(
                              "${AppLocalizations.of(context)?.login}",
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineLarge
                                  ?.copyWith(fontWeight: FontWeight.w700),
                            ),
                            SizedBox(height: 1.h),
                            Text(
                              "${AppLocalizations.of(context)?.enterPhone}",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(
                                    fontWeight: FontWeight.w400,
                                    color:
                                        Colours.textBlackColor.withOpacity(0.7),
                                  ),
                            ),
                            SizedBox(height: 1.h),
                            Divider(
                              height: 2,
                              color: Colours.borderGreyColor,
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: SizeConst.horizontalPadding),
                              width: 100.h,
                              height: 7.h,
                              child: Row(
                                children: [
                                  SvgPicture.asset(
                                    Media.saSvg,
                                    height: 4.h,
                                    width: 4.5.h,
                                    fit: BoxFit.fitWidth,
                                  ),
                                  SizedBox(
                                    width: 3.w,
                                  ),
                                  Text(
                                    "${AppLocalizations.of(context)?.ksa}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium
                                        ?.copyWith(
                                            fontWeight: FontWeight.w500,
                                            color: Colours.blackColor),
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              height: 2,
                              color: Colours.borderGreyColor,
                            ),
                            FormField<String>(
                                validator: (value) =>
                                    TextFormValidation.phoneValidation(value,
                                        context: context),
                                builder: (FormFieldState<String> fieldState) {
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: 100.w,
                                        height: 7.h,
                                        child: Row(
                                          children: [
                                            Text(
                                              "+966",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleMedium
                                                  ?.copyWith(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color:
                                                          Colours.blackColor),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 2.5.w,
                                                  vertical: 2.h),
                                              child: const VerticalDivider(
                                                width: 4,
                                                color: Colours.dividerGreyColor,
                                              ),
                                            ),
                                            Expanded(
                                              child: TextFormField(
                                                style: CustomTheme
                                                    .textFieldTextStyle,
                                                onFieldSubmitted: (_) {
                                                  bool filledFormCorrectly =
                                                      _formKey.currentState
                                                          ?.validate();
                                                  if (filledFormCorrectly) {
                                                    context
                                                        .read<
                                                            AuthenticatorBloc>()
                                                        .add(
                                                          AuthenticatorEvent
                                                              .loginOrRegister(
                                                                  phone:
                                                                      "966${_controller.text}",
                                                                  context:
                                                                      context),
                                                        );
                                                  }
                                                },
                                                onTapOutside: (_) =>
                                                    FocusScope.of(context)
                                                        .requestFocus(
                                                            FocusNode()),
                                                controller: _controller,
                                                onChanged: (value) {
                                                  fieldState.didChange(value);
                                                },
                                                keyboardType:
                                                    TextInputType.phone,
                                                autofillHints: const [
                                                  AutofillHints.telephoneNumber,
                                                ],
                                                inputFormatters: [
                                                  FilteringTextInputFormatter
                                                      .digitsOnly,
                                                  LengthLimitingTextInputFormatter(
                                                      9),
                                                ],
                                                decoration:
                                                    const InputDecoration(
                                                  hintText: "500000000",
                                                  border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(0)),
                                                    borderSide: BorderSide(
                                                      width: 1.5,
                                                      color: Colors.transparent,
                                                    ),
                                                  ),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(0)),
                                                    borderSide: BorderSide(
                                                      width: 1.5,
                                                      color: Colors.transparent,
                                                    ),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(0)),
                                                    borderSide: BorderSide(
                                                      width: 1.5,
                                                      color: Colors.transparent,
                                                    ),
                                                  ),
                                                  errorBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(0)),
                                                    borderSide: BorderSide(
                                                      width: 1.5,
                                                      color: Colors.transparent,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Divider(
                                        height: 2,
                                        color: Colours.borderGreyColor,
                                      ),
                                      if (fieldState.hasError)
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 8.0),
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

                            SizedBox(height: 1.h),
                            FormField<String>(
                                validator: (value) {
                              if (schoolController.dropDownValue == null ||
                                  schoolController
                                      .dropDownValue?.value.isEmpty) {
                                return "${AppLocalizations.of(context)?.requiredField}";
                              }
                              return null;
                            },
                                builder: (FormFieldState<String> fieldState) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  DropDownTextField(
                                    dropdownRadius: 0,
                                    padding: const EdgeInsets.all(0),
                                    clearOption: false,
                                    dropdownColor: Colours.whiteColor,
                                    listTextStyle: Theme.of(context)
                                        .textTheme
                                        .titleMedium
                                        ?.copyWith(fontWeight: FontWeight.w400),
                                    textStyle: Theme.of(context)
                                        .textTheme
                                        .titleMedium
                                        ?.copyWith(fontWeight: FontWeight.w400),
                                    controller: schoolController,
                                    hintText:
                                        "${AppLocalizations.of(context)?.school}",
                                    searchDecoration: InputDecoration(
                                      hintStyle: const TextStyle(
                                        fontWeight: FontWeight.w400,
                                      ),
                                      labelText:
                                          "${AppLocalizations.of(context)?.school}",
                                      helperText:
                                          "${AppLocalizations.of(context)?.school}",
                                      prefixText:
                                          "${AppLocalizations.of(context)?.school}",
                                      hintText:
                                          "${AppLocalizations.of(context)?.school}",
                                      focusColor: Colors.white,
                                    ),
                                    textFieldDecoration: InputDecoration(
                                      hintText:
                                          "${AppLocalizations.of(context)?.school}",
                                      border: const OutlineInputBorder(
                                        gapPadding: 0,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(0)),
                                        borderSide: BorderSide(
                                          width: 1.5,
                                          color: Colors.transparent,
                                        ),
                                      ),
                                      enabledBorder: const OutlineInputBorder(
                                        gapPadding: 0,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(0)),
                                        borderSide: BorderSide(
                                          width: 1.5,
                                          color: Colors.transparent,
                                        ),
                                      ),
                                      focusedBorder: const OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(0)),
                                        borderSide: BorderSide(
                                          width: 1.5,
                                          color: Colors.transparent,
                                        ),
                                      ),
                                      errorBorder: const OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(0)),
                                        borderSide: BorderSide(
                                          width: 1.5,
                                          color: Colors.transparent,
                                        ),
                                      ),
                                      focusedErrorBorder:
                                          const OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(0)),
                                        borderSide: BorderSide(
                                          width: 1.5,
                                          color: Colors.transparent,
                                        ),
                                      ),
                                    ),
                                    dropDownItemCount: 7,
                                    dropDownList: schools
                                        .map((e) => DropDownValueModel(
                                            name: e.name, value: e.apiEndpoint))
                                        .toList(),
                                    onChanged: (val) async {
                                      if (val.runtimeType.toString() !=
                                          "String") {
                                        final model = val as DropDownValueModel;
                                        var url = model.value;
                                        CacheHelper cache = sl();

                                        ///url already ends with /
                                        cache.setBaseUrl("${url}api");
                                      }
                                    },
                                  ),
                                  Divider(
                                    height: 2,
                                    color: Colours.borderGreyColor,
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

                          ],
                        ),
                      ),
                      SliverFillRemaining(
                        hasScrollBody: false,
                        fillOverscroll: true,
                        child:
                            BlocBuilder<AuthenticatorBloc, AuthenticatorState>(
                          builder: (context, state) {
                            return Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                ElevatedButton(
                                  onPressed: state ==
                                          const AuthenticatorState.loading()
                                      ? null
                                      : () {
                                          bool filledFormCorrectly =
                                              _formKey.currentState?.validate();
                                          if (filledFormCorrectly) {
                                            context
                                                .read<AuthenticatorBloc>()
                                                .add(AuthenticatorEvent
                                                    .loginOrRegister(
                                                        phone:
                                                            "966${_controller.text}",
                                                        context: context));
                                          }
                                        },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "${AppLocalizations.of(context)?.cont}",
                                      ),
                                      AnimatedButtonCircularLoader(
                                          loading: state ==
                                              const AuthenticatorState
                                                  .loading())
                                    ],
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
