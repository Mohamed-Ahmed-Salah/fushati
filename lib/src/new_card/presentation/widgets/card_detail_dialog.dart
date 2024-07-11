import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fushati/core/res/styles/colours.dart';
import 'package:fushati/core/utils/constants/size_constatnts.dart';
import 'package:fushati/core/utils/core_utils.dart';
import 'package:fushati/src/card_details/presentation/views/card_details_view.dart';
import 'package:fushati/src/home/domain/entity/card.dart';
import 'package:fushati/src/new_card/presentation/app/get_card_details_bloc/get_card_details_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/common/singletons/form_validation.dart';
import '../../../../core/common/widgets/custom_animated_switcher.dart';
import '../../../../core/common/widgets/custome_appbar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../core/res/theme/app_theme.dart';
import '../../../manage_card/presentation/widgets/delete_card_button.dart';
import '../widgets/card_detail_confirmation.dart';
import '../widgets/card_detail_error.dart';

class CardDetailsDialog extends StatelessWidget {
  final String cardNumber;

  const CardDetailsDialog({super.key, required this.cardNumber});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetCardDetailsBloc, GetCardDetailsState>(
      listener: (BuildContext context, GetCardDetailsState state) {},
      builder: (context, state) {
        double radius = SizeConst.borderRadius;
        state.whenOrNull(loading: () {
          radius = 100.w;
        });
        return Center(
          child: Padding(
            padding: EdgeInsets.all(SizeConst.horizontalPaddingFour),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AnimatedSize(
                  duration: const Duration(seconds: 1),
                  curve: Curves.fastEaseInToSlowEaseOut,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 400),
                    decoration: BoxDecoration(
                      color: Colours.whiteColor,
                      border: Border.all(color: Colours.borderGreyColor),
                      boxShadow: [
                        BoxShadow(
                          color: Colours.blackColor.withOpacity(0.2),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset:
                              const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      borderRadius: BorderRadius.all(
                        Radius.circular(radius),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(SizeConst.horizontalPadding),
                      child: IntrinsicWidth(
                        child: Material(
                          color: Colors.transparent,
                          elevation: 0,
                          child: Center(
                            child: CustomAnimatedSwitcher(
                              child: state.when(
                                  loading: () => Center(
                                        child: Padding(
                                          padding: EdgeInsets.all(1.w),
                                          child:
                                              const CircularProgressIndicator(),
                                        ),
                                      ),
                                  failed: (message) =>
                                      CardDetailError(message: message),
                                  success: (card) => CardDetail(
                                        card: card,
                                      )),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
