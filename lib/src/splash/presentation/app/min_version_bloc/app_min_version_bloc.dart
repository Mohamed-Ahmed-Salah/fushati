import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fushati/core/utils/constants/error_consts.dart';
import 'package:fushati/core/utils/core_utils.dart';
import 'package:fushati/src/splash/domain/entities/min_version_response.dart';
import 'package:fushati/src/splash/domain/usecases/min_app_version_usercase.dart';
import 'dart:io' show Platform;

import 'package:package_info_plus/package_info_plus.dart';

part 'app_min_version_event.dart';

part 'app_min_version_state.dart';

part 'app_min_version_bloc.freezed.dart';

class AppMinVersionBloc extends Bloc<AppMinVersionEvent, AppMinVersionState> {
  final GetMinAppVersion _getMinAppVersion;

  AppMinVersionBloc({required GetMinAppVersion getMinAppVersion})
      : _getMinAppVersion = getMinAppVersion,
        super(const AppMinVersionState.loading()) {
    on<GetAppVersionEvent>(_getAppVersionEvent);
  }

  _getAppVersionEvent(event, emit) async {
    BuildContext context = event.context;
    String platform = "unknown";
    if (Platform.isIOS) {
      platform = "ios";
    } else if (Platform.isAndroid) {
      platform = "android";
    }

    emit(const AppMinVersionState.loading());
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String version = packageInfo.version;

    List<String> appVersionList = version.split(".");

    final result = await _getMinAppVersion(platform);
    result.fold(
      (failure) {
        CoreUtils.showMyDialog(
          title: ErrorConst.getErrorBody(text: ErrorConst.errorEn),
          subTitle: ErrorConst.getErrorBody(text: failure.message),
          onPressed: () {
            Navigator.pop(context);
          },
        );
        emit(AppMinVersionState.failed(failure.message));
      },
      (response) async {
        String minVersion = response.minVersion;

        bool shouldUpdate = version.compareTo(minVersion) < 0;
        if (shouldUpdate) {
          emit(AppMinVersionState.successShouldUpdate(response: response));
        } else {
          emit(const AppMinVersionState.successNoUpdate());
        }
      },
    );
  }
}
