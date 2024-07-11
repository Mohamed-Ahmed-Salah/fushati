import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fushati/core/res/media.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../core/common/app/cache_helper.dart';
import '../../../../../../core/utils/constants/error_consts.dart';
import '../../../../../../core/utils/constants/text_constants.dart';
import '../../../../../../core/utils/core_utils.dart';
import '../../../../domain/usecases/add_customer_info.dart';

part 'customer_info_bloc.freezed.dart';

part 'customer_info_event.dart';

part 'customer_info_state.dart';

class CustomerInfoBloc extends Bloc<CustomerInfoEvent, CustomerInfoState> {
  final CacheHelper _cacheHelper;
  final AddUserInfo _addUserInfo;

  CustomerInfoBloc(
      {required AddUserInfo addUserInfo, required CacheHelper cacheHelper})
      : _addUserInfo = addUserInfo,
        _cacheHelper = cacheHelper,
        super(const CustomerInfoState.initial()) {
    on<AuthAddUserInfo>(_addUserInfoEvent);
  }

  _addUserInfoEvent(event, emit) async {
    String name = event.name;
    String email = event.productId;

    if (name.isEmpty || email.isEmpty) {
      return;
    }
    emit(const CustomerInfoState.loading());

    final result = await _addUserInfo(
      AddUserInfoParams(
        name: name,
        email: email,

      ),
    );
    BuildContext context = event.context;

    result.fold(
      (failure) {
        CoreUtils.showMyDialog(
          title: ErrorConst.getErrorBody(text: ErrorConst.errorEn),
          subTitle: ErrorConst.getErrorBody(text: failure.message),
          onPressed: () {
            Navigator.pop(context);
          },

        );
        emit(CustomerInfoState.failed(failure.message));
      },
      (_) async {
        emit(CustomerInfoState.success());
        await _cacheHelper.cacheUsername(name);

        // SchedulerBinding.instance.addPostFrameCallback((_) {
        //   context.pushReplacementNamed(HomeView.name,
        //       queryParameters: {HomeView.param: "true"});
        // });
      },
    );
  }
}
