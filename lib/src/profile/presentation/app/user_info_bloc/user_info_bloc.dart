import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fushati/src/profile/domain/entities/user.dart';

import '../../../../../core/utils/constants/error_consts.dart';
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
    String? gender= event.gender;

    state.whenOrNull(success: (user) {
      User updatedUser = user;
      updatedUser = updatedUser.copyWith(
        gender:gender,
        email: email,
        name: name,
      );

      emit(UserInfoState.success(user: updatedUser));
    });
  }
}
