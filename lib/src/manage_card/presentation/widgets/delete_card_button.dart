import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fushati/core/res/styles/colours.dart';
import 'package:fushati/core/utils/constants/size_constatnts.dart';
import 'package:fushati/src/manage_card/presentation/app/delete_card_bloc/delete_card_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../core/res/media.dart';
import '../../../home/domain/entity/card.dart';
import 'delete_confirmation_box.dart';

class DeleteCardButton extends StatelessWidget {
  final CardEntity card;

  const DeleteCardButton({super.key, required this.card});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          context.read<DeleteCardBloc>().add(const DeleteCardEvent.reset());
          showDialog(
            barrierDismissible:false,
            context: context,
            builder: (context) =>
                DeleteConfirmationCardBox(
                  id: card.id,
                ),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(SizeConst.borderRadius),
            ),
            border: Border.all(color: Colours.borderGreyColor),
          ),
          child: Padding(
            padding: EdgeInsets.all(1.h),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(SizeConst.horizontalPadding),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(SizeConst.borderRadius),
                    ),
                    border: Border.all(color: Colours.borderGreyColor),
                  ),
                  child: SvgPicture.asset(
                    Media.deleteSvg,
                    height: SizeConst.iconSize - 0.3.h,
                  ),
                ),
                Expanded(
                  child: Text("${AppLocalizations
                      .of(context)
                      ?.deleteCard}",
                      style: Theme
                          .of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(fontWeight: FontWeight.w400),
                      textAlign: TextAlign.center),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
