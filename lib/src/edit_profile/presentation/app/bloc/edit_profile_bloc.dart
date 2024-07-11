import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/utils/constants/error_consts.dart';
import '../../../../../core/utils/constants/text_constants.dart';
import '../../../../../core/utils/core_utils.dart';
import '../../../../profile/presentation/app/user_info_bloc/user_info_bloc.dart';
import '../../../domain/usecases/edit_user_info.dart';

part 'edit_profile_event.dart';

part 'edit_profile_state.dart';

part 'edit_profile_bloc.freezed.dart';

class EditProfileBloc extends Bloc<EditProfileEvent, EditProfileState> {
  final EditUserInfo _editUserInfo;

  EditProfileBloc({required EditUserInfo editUserInfo})
      : _editUserInfo = editUserInfo,
        super(const EditProfileState.initial()) {
    on<EditUserAccountProfileEvent>(_editUserInfoEvent);
  }

  _editUserInfoEvent(event, emit) async {
    String name = event.name;
    String email = event.email;

    BuildContext context = event.context;

    if (name.isEmpty) {
      return;
    }
    emit(const EditProfileState.loading());

    final result = await _editUserInfo(
      EditUserInfoParams(
        name: name,
        email: email,
      ),
    );

    result.fold(
      (failure) {
        print(failure.message);
        emit(EditProfileState.failed(failure.message));
        CoreUtils.showMyDialog(
          title: ErrorConst.getErrorTitle(title: ErrorConst.errorOccuredEn),
          subTitle: ErrorConst.getErrorBody(text: failure.message),
          onPressed: () {
            Navigator.pop(context);
          },
        );
      },
      (_) async {
        emit(const EditProfileState.success());
        context.read<UserInfoBloc>().add(UserInfoEvent.EditUserInfo(
              name: name,
              email: email,
            ));
        CoreUtils.showSuccess(
          title: TextConstants.getText(text: TextConstants.successEn),
          subTitle:
              TextConstants.getText(text: TextConstants.userEditedSuccessEn),
          onPressed: () {
            Navigator.pop(context);
          },
        );
      },
    );
  }
// TODO: implement event handler
}
