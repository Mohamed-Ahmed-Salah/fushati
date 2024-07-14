import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart' hide Cache;
import 'package:fushati/src/home/presentation/apps/cards_bloc/cards_bloc.dart';
import 'package:fushati/src/profile/domain/entities/user.dart';
import 'package:fushati/src/profile/presentation/app/profile_transaction_bloc/profile_transaction_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../core/common/widgets/custome_appbar.dart';
import '../../../../core/common/widgets/error_view.dart';
import '../../../../core/common/widgets/loading_view.dart';
import '../../../../core/res/media.dart';
import '../../../../core/res/styles/colours.dart';
import '../../../../core/utils/constants/size_constatnts.dart';
import '../../../edit_profile/presentation/views/edit_profile_view.dart';
import '../../../home/data/models/transaction_model.dart';
import '../../../home/domain/entity/card.dart';
import '../../../home/presentation/widgets/empty_card_list.dart';
import '../../../home/presentation/widgets/error_sliver.dart';
import '../../../home/presentation/widgets/loading_sliver.dart';
import '../../../manage_card/presentation/widgets/transaction_box.dart';
import '../../../manage_card/presentation/widgets/transaction_history_text_row.dart';
import '../app/user_info_bloc/user_info_bloc.dart';

class ProfileView extends StatelessWidget {
  static const path = '/profile';

  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<UserInfoBloc, UserInfoState>(builder: (context, state) {
        return state.when(
            loading: () => const LoadingWidget(),
            failed: (error) => ErrorView(
                  onPressed: () {
                    context
                        .read<UserInfoBloc>()
                        .add(const UserInfoEvent.getUserInfo());
                  },
                  message: error,
                ),
            success: (user) => user.name == null
                ? EditProfileView(
                    user: user,
                  )
                : ProfileBody(user: user));
      }),
    );
  }
}

class ProfileBody extends StatelessWidget {
  final User user;

  const ProfileBody({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(SizeConst.horizontalPaddingFour),
        child: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  SizedBox(height: SizeConst.verticalPadding),
                  CustomAppBar(
                    text: "${AppLocalizations.of(context)?.profile}",
                  ),
                  SizedBox(height: 5.h),
                  CardContainerDesign(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: SizeConst.verticalPadding,
                          horizontal: SizeConst.horizontalPadding),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            Media.profileSvg,
                            height: 5.h,
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: SizeConst.horizontalPadding),
                              child: Column(
                                crossAxisAlignment: user.userPhone.isNotEmpty ||
                                        user.email != null
                                    ? CrossAxisAlignment.start
                                    : CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "${user.name}",
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge
                                        ?.copyWith(fontWeight: FontWeight.w600),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(
                                    height: 0.5.h,
                                  ),
                                  if (user.userPhone.isNotEmpty)
                                    Text(
                                      user.userPhone,
                                      textDirection: TextDirection.ltr,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall
                                          ?.copyWith(
                                            fontWeight: FontWeight.w400,
                                            color: Colours.textBlackColor
                                                .withOpacity(0.72),
                                          ),
                                    ),
                                  SizedBox(
                                    height: 0.5.h,
                                  ),
                                  if (user.email != null)
                                    Text(
                                      "${user.email}",
                                      maxLines: 1,
                                      overflow: TextOverflow.clip,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(
                                            fontWeight: FontWeight.w400,
                                            color: Colours.textBlackColor
                                                .withOpacity(0.7),
                                          ),
                                    ),
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                              onTap: () {
                                context.pushNamed(EditProfileView.name,
                                    extra: user);
                              },
                              child: SvgPicture.asset(Media.profileEditSvg)),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: SizeConst.verticalPaddingFour,
                  ),
                  const TransactionHistoryRowText(),
                  SizedBox(
                    height: SizeConst.verticalPadding,
                  ),
                ],
              ),
            ),
            BlocBuilder<ProfileTransactionBloc, ProfileTransactionState>(
                builder: (context, state) {
              return state.when(
                loading: () => const LoadingSliver(),
                failed: (message) => ErrorSliver(
                  onPressed: () {
                    context.read<ProfileTransactionBloc>().add(
                        const ProfileTransactionEvent.getUserTransactions());
                  },
                  message: message,
                ),
                success: (transactions) => SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      Transaction transaction = transactions[index];
                      return TransactionBox(transaction: transaction);
                    },
                    childCount: transactions.length,
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
