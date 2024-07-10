import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart' hide Cache;
import 'package:fushati/src/auth/domain/entities/user.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../core/common/widgets/animated_button_circular_loader.dart';
import '../../../../core/common/widgets/error_view.dart';
import '../../../../core/common/widgets/loading_view.dart';
import '../../../../core/res/media.dart';
import '../../../../core/res/styles/colours.dart';
import '../../../edit_profile/presentation/views/edit_profile_view.dart';
import '../app/delete_user_bloc/delete_user_bloc.dart';
import '../app/user_info_bloc/user_info_bloc.dart';

class ProfileView extends StatelessWidget {
  static const path = '/profile';

  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Padding(
        padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 4.w),
        child: BlocBuilder<DeleteUserBloc, DeleteUserState>(
            builder: (context, state) {
          return ElevatedButton(
              onPressed: () {
                // showDialog(
                //     context: context,
                //     builder: (builderContext) => AlertPopUpWidget(
                //           isDeleteWidget: true,
                //           title:
                //               "${AppLocalizations.of(context)?.deleteAccount}",
                //           subTitle:
                //               "${AppLocalizations.of(context)?.areYouSureToDelete}",
                //           buttonText: "${AppLocalizations.of(context)?.yes}",
                //           state: StateEnum.error,
                //           onPressed: () {
                //             Navigator.pop(builderContext);
                //             context.read<DeleteUserBloc>().add(
                //                 DeleteUserEvent.deleteUser(context: context));
                //           },
                //           icon: Icons.delete,
                //         ));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "DELETEEEE",
                  ),
                  AnimatedButtonCircularLoader(
                      loading: state == const DeleteUserState.loading())
                ],
              ));
        }),
      ),

      body: Padding(
        padding: EdgeInsets.all(4.w),
        child:
            BlocBuilder<UserInfoBloc, UserInfoState>(builder: (context, state) {
          return state.when(
              loading: () => LoadingWidget(),
              failed: (error) => ErrorView(
                    onPressed: () {
                      context
                          .read<UserInfoBloc>()
                          .add(UserInfoEvent.getUserInfo(context: context));
                    },
                    message: error,
                  ),
              success: (user) => ProfileBody(user: user));
        }),
      ),
    );
  }
}

class ProfileBody extends StatelessWidget {
  final User user;

  const ProfileBody({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Column(
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
            context.pushNamed(EditProfileView.name);
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
