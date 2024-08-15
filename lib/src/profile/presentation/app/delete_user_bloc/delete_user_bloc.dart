import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fushati/core/common/app/cache_helper.dart';
import 'package:fushati/core/services/router.dart';
import 'package:fushati/core/utils/constants/error_consts.dart';
import 'package:fushati/core/utils/core_utils.dart';
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
  }

  _deleteUserEvent(event, emit) async {
    BuildContext context = event.context;
    int id = event.id;
    emit(const DeleteUserState.loading());

    final result = await _deleteUserInfo(id);
    result.fold(
          (failure) async {
        CoreUtils.showMyDialog(
          title: ErrorConst.getErrorTitle(title: ErrorConst.errorEn),
          subTitle: ErrorConst.getErrorBody(text: failure.message),
          onPressed: () {
            router.pop();
          },
        );
        emit(DeleteUserState.failed(
            ErrorConst.getErrorBody(text: failure.message)));
      },
          (_) async {
        emit(const DeleteUserState.success());
        final cacheHelper = sl<CacheHelper>();
        await cacheHelper.logout();

        router.go(LoginView.path);
      },
    );
  }
}
