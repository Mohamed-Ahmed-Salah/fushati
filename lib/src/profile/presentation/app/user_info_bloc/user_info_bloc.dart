import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fushati/src/profile/domain/entities/user.dart';

import '../../../../../core/common/app/cache_helper.dart';
import '../../../../../core/services/injection_container.dart';
import '../../../../../core/services/router.dart';
import '../../../../../core/utils/constants/error_consts.dart';
import '../../../../../core/utils/constants/text_constants.dart';
import '../../../../../core/utils/core_utils.dart';
import '../../../../auth/presentation/views/login_view.dart';
import '../../../domain/usecases/get_user_info.dart';

part 'user_info_event.dart';

part 'user_info_state.dart';

part 'user_info_bloc.freezed.dart';

class UserInfoBloc extends Bloc<UserInfoEvent, UserInfoState> {
  final GetUserInfo _getUserInfo;

  UserInfoBloc({required GetUserInfo getUserInfo})
      : _getUserInfo = getUserInfo,
        super(UserInfoState.loading()) {
    on<GetUserInfoEvent>(_getUserInfoEvent);
    on<LocalUserInfoEvent>(_editUserInfoEvent);
  }

  _getUserInfoEvent(event, emit) async {
    emit(const UserInfoState.loading());
    final result = await _getUserInfo();
    result.fold(
      (failure) {
        emit(UserInfoState.failed(
            ErrorConst.getErrorBody(text: failure.message)));
      },
      (user) {
        emit(UserInfoState.success(user: user));
        // getCartCount(Cache.instance.userId!);
      },
    );
  }

  _editUserInfoEvent(event, emit) async {
    String name = event.name;
    String email = event.email;

    state.whenOrNull(success: (user) {
      User userInfo = user;
      userInfo = userInfo.copyWith(
        email: email,
        name: name,
      );

      emit(UserInfoState.success(user: userInfo));
    });
  }
}
