import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart' hide Cache;
import 'package:fushati/src/home/presentation/apps/cards_bloc/cards_bloc.dart';
import 'package:fushati/src/profile/domain/entities/user.dart';
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
import '../app/user_info_bloc/user_info_bloc.dart';

class ProfileView extends StatelessWidget {
  static const path = '/profile';

  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomSheet: Padding(
      //   padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 4.w),
      //   child: BlocBuilder<DeleteUserBloc, DeleteUserState>(
      //       builder: (context, state) {
      //     return ElevatedButton(
      //         onPressed: () {
      //           // showDialog(
      //           //     context: context,
      //           //     builder: (builderContext) => AlertPopUpWidget(
      //           //           isDeleteWidget: true,
      //           //           title:
      //           //               "${AppLocalizations.of(context)?.deleteAccount}",
      //           //           subTitle:
      //           //               "${AppLocalizations.of(context)?.areYouSureToDelete}",
      //           //           buttonText: "${AppLocalizations.of(context)?.yes}",
      //           //           state: StateEnum.error,
      //           //           onPressed: () {
      //           //             Navigator.pop(builderContext);
      //           //             context.read<DeleteUserBloc>().add(
      //           //                 DeleteUserEvent.deleteUser(context: context));
      //           //           },
      //           //           icon: Icons.delete,
      //           //         ));
      //         },
      //         child: Row(
      //           mainAxisAlignment: MainAxisAlignment.center,
      //           children: [
      //             const Text(
      //               "DELETEEEE",
      //             ),
      //             AnimatedButtonCircularLoader(
      //                 loading: state == const DeleteUserState.loading())
      //           ],
      //         ));
      //   }),
      // ),
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
                                    Container(
                                      color: Colours.greyLightColor,
                                      child: Text(
                                        "${user.email}",
                                        maxLines: 1,
                                        overflow: TextOverflow.clip,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium
                                            ?.copyWith(
                                              fontWeight: FontWeight.w100,
                                              color: Colours.greyLightColor
                                                  .withOpacity(0.72),
                                            ),
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
                ],
              ),
            ),
            BlocBuilder<CardsBloc, CardsState>(builder: (context, state) {
              return state.when(
                loading: () => const LoadingSliver(),
                emptyList: () => SliverList(

                  delegate: SliverChildBuilderDelegate(
                    childCount:1,
                    (BuildContext context, int index) {
                      return Container();
                    },
                  ),
                ),
                failed: (message) => ErrorSliver(
                  onPressed: () {
                    context.read<CardsBloc>().add(const CardsEvent.getCards());
                  },
                  message: message,
                ),
                success: (cards) => SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      CardEntity card = cards[index];
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: card.transactions.length,
                        itemBuilder: (context, index) {
                          Transaction transaction = card.transactions[index];
                          return TransactionBox(transaction: transaction);
                        },
                      );
                    },
                    childCount: cards.length,
                  ),
                ),
              );
              // return SliverList.builder(
              //   itemCount: widget.card.transactions.length,
              //   itemBuilder: (BuildContext context, int index) {
              //     final Transaction transaction = widget.card
              //         .transactions[index];
              //     return TransactionBox(transaction: transaction,);
              //   },
              // );
            }),
          ],
        ),
      ),
    );

    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "He",
          // "Hello ${user.username}",
          style: Theme.of(context)
              .textTheme
              .displaySmall
              ?.copyWith(fontWeight: FontWeight.w700),
        ),
        Container(
          padding: EdgeInsets.all(4.w),
          decoration: BoxDecoration(
            color: Colours.whiteColor,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colours.borderGreyColor),
          ),
          child: Row(
            children: [
              // SvgPicture.asset(
              //   user.gender == "1" ? Media.manAvatar : Media.femaleAvatar,
              // ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${user.name}",
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge
                            ?.copyWith(fontWeight: FontWeight.w700),
                      ),
                      Text(
                        "+${user.userPhone}",
                        textDirection: TextDirection.ltr,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w100,
                              color: Colours.greyLightColor.withOpacity(0.72),
                            ),
                      ),
                      Text(
                        "${user.email}",
                        maxLines: 1,
                        overflow: TextOverflow.clip,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w100,
                              color: Colours.greyLightColor.withOpacity(0.72),
                            ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            context.pushNamed(EditProfileView.name, extra: user);
          },
          child: SizedBox(
            width: double.infinity,
            child: Row(
              children: [
                // SvgPicture.asset(Media.accountSettingSvg),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 2.h,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
