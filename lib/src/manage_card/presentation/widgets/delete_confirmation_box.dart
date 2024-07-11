import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fushati/core/res/styles/colours.dart';
import 'package:fushati/core/utils/constants/size_constatnts.dart';
import 'package:fushati/src/home/presentation/apps/cards_bloc/cards_bloc.dart';
import 'package:fushati/src/home/presentation/widgets/cards_list.dart';
import 'package:fushati/src/manage_card/presentation/app/bloc/delete_card_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/common/singletons/form_validation.dart';
import '../../../../core/common/widgets/card_box.dart';
import '../../../../core/common/widgets/close_button.dart';
import '../../../../core/common/widgets/custom_animated_switcher.dart';
import '../../../../core/common/widgets/custome_appbar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'pick_amount_bottomsheet.dart';
import '../../../../core/res/media.dart';
import '../../../../core/res/theme/app_theme.dart';
import '../../../home/domain/entity/card.dart';
import '../views/card_deleted_success_view.dart';
import '../widgets/delete_card_button.dart';
import '../widgets/top_up_button.dart';

class DeleteConfirmationCardBox extends StatelessWidget {
  final int id;

  const DeleteConfirmationCardBox({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DeleteCardBloc, DeleteCardState>(
      listener: (BuildContext context, DeleteCardState state) {
        state.whenOrNull(success: () {
          context.read<CardsBloc>().add(const CardsEvent.getCards());
          context.pushNamed(CardDeletedSuccessView.path);
        });
      },
      builder: (context, state) {
        double radius = SizeConst.borderRadius;
        state.whenOrNull(loading: () {
          radius = 100.w;
        });

        return Center(
          child: Padding(
            padding: EdgeInsets.all(SizeConst.horizontalPaddingFour),


            child: AnimatedContainer(
              decoration: BoxDecoration(
                color: Colours.whiteColor,
                border: Border.all(color: Colours.borderGreyColor),
                boxShadow: [
                  BoxShadow(
                    color: Colours.blackColor.withOpacity(0.2),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
                borderRadius: BorderRadius.all(
                  Radius.circular(
                      state != const DeleteCardState.loading() ? radius : 100.w),
                ),
              ),
              duration: const Duration(seconds: 1),
              curve: Curves.easeInOut,
              child: Padding(
                padding: EdgeInsets.all(SizeConst.horizontalPadding),
                child: AnimatedSize(
                  duration: const Duration(seconds: 1),
                  curve: Curves.fastEaseInToSlowEaseOut,
                  child: Material(
                    key: Key(state.toString()),
                    color: Colors.transparent,
                    elevation: 0,
                    child: CustomAnimatedSwitcher(
                      child: state.when(
                          initial: () => Padding(
                                padding: EdgeInsets.all(
                                    SizeConst.horizontalPadding),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.end,
                                      children: [
                                        CustomCloseButton(),
                                      ],
                                    ),
                                    SvgPicture.asset(Media.deleteCardSvg),
                                    SizedBox(
                                      height: SizeConst.verticalPadding,
                                    ),
                                    Text(
                                      "${AppLocalizations.of(context)?.deleteCard}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge
                                          ?.copyWith(
                                              fontWeight: FontWeight.w500),
                                    ),
                                    SizedBox(
                                      height: 1.h,
                                    ),
                                    Text(
                                      "${AppLocalizations.of(context)?.areYouSureDeleteCard}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium
                                          ?.copyWith(
                                              fontWeight: FontWeight.w400,
                                              color: Colours.textBlackColor
                                                  .withOpacity(0.7)),
                                    ),
                                    SizedBox(
                                      height: SizeConst.verticalPadding,
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              elevation: 0,
                                              backgroundColor:
                                                  Colours.lightGreyButton,
                                            ),
                                            onPressed: () {
                                              context.pop();
                                            },
                                            child: Text(
                                              "${AppLocalizations.of(context)?.cancel}",
                                              style: const TextStyle(
                                                  fontWeight:
                                                      FontWeight.w400),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width:
                                              SizeConst.horizontalPadding,
                                        ),
                                        Expanded(
                                          child: ElevatedButton(
                                            onPressed: () {
                                              context
                                                  .read<DeleteCardBloc>()
                                                  .add(DeleteCardEvent
                                                      .deleteCard(id: id));
                                            },
                                            child: Text(
                                              "${AppLocalizations.of(context)?.delete}",
                                              style: const TextStyle(
                                                  fontWeight:
                                                      FontWeight.w400),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                          loading: () => const CircularProgressIndicator(),
                          failed: (failed) => Padding(
                            padding: EdgeInsets.all(
                                SizeConst.horizontalPadding),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.end,
                                  children: [
                                    CustomCloseButton(),
                                  ],
                                ),
                                SvgPicture.asset(Media.deleteCardSvg),
                                SizedBox(
                                  height: SizeConst.verticalPadding,
                                ),
                                Text(
                                  "${AppLocalizations.of(context)?.deleteCard}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge
                                      ?.copyWith(
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                Text(
                                  "${AppLocalizations.of(context)?.areYouSureDeleteCard}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium
                                      ?.copyWith(
                                      fontWeight: FontWeight.w400,
                                      color: Colours.textBlackColor
                                          .withOpacity(0.7)),
                                ),
                                SizedBox(
                                  height: SizeConst.verticalPadding,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          elevation: 0,
                                          backgroundColor:
                                          Colours.lightGreyButton,
                                        ),
                                        onPressed: () {
                                          context.pop();
                                        },
                                        child: Text(
                                          "${AppLocalizations.of(context)?.cancel}",
                                          style: const TextStyle(
                                              fontWeight:
                                              FontWeight.w400),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width:
                                      SizeConst.horizontalPadding,
                                    ),
                                    Expanded(
                                      child: ElevatedButton(
                                        onPressed: () {
                                          context
                                              .read<DeleteCardBloc>()
                                              .add(DeleteCardEvent
                                              .deleteCard(id: id));
                                        },
                                        child: Text(
                                          "${AppLocalizations.of(context)?.delete}",
                                          style: const TextStyle(
                                              fontWeight:
                                              FontWeight.w400),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          success: () => Container()),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
