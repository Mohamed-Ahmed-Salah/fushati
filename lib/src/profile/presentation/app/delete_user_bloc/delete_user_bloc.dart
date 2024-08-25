import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fushati/core/common/app/cache_helper.dart';
import 'package:fushati/core/services/router.dart';
import 'package:fushati/src/auth/presentation/views/login_view.dart';

import '../../../../../core/services/injection_container.dart';
import '../../../domain/usecases/delete_user.dart';

part 'delete_user_event.dart';

part 'delete_user_state.dart';

part 'delete_user_bloc.freezed.dart';

class DeleteUserBloc extends Bloc<DeleteUserEvent, DeleteUserState> {
  final DeleteUserInfo _deleteUserInfo;

  DeleteUserBloc({required DeleteUserInfo deleteUserInfo})
      : _deleteUserInfo = deleteUserInfo,
        super(const DeleteUserState.initial()) {
    on<DeleteUserInfoEvent>(_deleteUserEvent);
    on<ResetUserStateEvent>(_resetUserEvent);
  }

  _deleteUserEvent(event, emit) async {
    int id = event.id;
    emit(const DeleteUserState.loading());

    await Future.delayed(Duration(seconds: 2));
    emit(DeleteUserState.failed("message"));
    // final result = await _deleteUserInfo(id);
    // result.fold(
    //   (failure) {
    //     emit(DeleteUserState.failed(failure.message));
    //   },
    //   (_) async {
    //     emit(const DeleteUserState.success());
    //     final cacheHelper = sl<CacheHelper>();
    //     await cacheHelper.logout();
    //
    //     router.go(LoginView.path);
    //   },
    // );
  }

  _resetUserEvent(event, emit) {
    emit(const DeleteUserState.initial());
  }
}
