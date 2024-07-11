import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/common/app/cache_helper.dart';
import '../../../../../core/services/injection_container.dart';
import '../../../../../core/services/router.dart';
import '../../../../../core/utils/constants/error_consts.dart';
import '../../../../../core/utils/constants/text_constants.dart';
import '../../../../../core/utils/core_utils.dart';
import '../../../../auth/presentation/views/login_view.dart';
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
    //todo delete
    // BuildContext context = event.context;
    // emit(const DeleteUserState.loading());
    //
    // final result = await _deleteUserInfo();
    // result.fold(
    //   (failure) async {
    //     CoreUtils.showMyDialog(
    //         title: ErrorConst.getErrorTitle(title: ErrorConst.errorEn),
    //         subTitle: ErrorConst.getErrorBody(text: failure.message),
    //         onPressed: () {
    //           Navigator.pop(context);
    //         },
    //        );
    //     emit(DeleteUserState.failed(
    //         ErrorConst.getErrorBody(text: failure.message)));
    //   },
    //   (_) async {
    //     emit(const DeleteUserState.success());
    //     final cacheHelper = sl<CacheHelper>();
    //     await cacheHelper.logout();
    //     Navigator.pop(context);
    //
    //     router.go(LoginView.path);
    //   },
    // );
  }
}
