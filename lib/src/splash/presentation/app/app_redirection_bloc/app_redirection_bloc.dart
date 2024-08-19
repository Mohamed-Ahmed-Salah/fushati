import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fushati/src/home/presentation/apps/cards_bloc/cards_bloc.dart';
import 'package:fushati/src/home/presentation/views/home_view.dart';
import 'package:fushati/src/new_card/presentation/app/cubit/nfc_scanner_cubit.dart';
import 'package:fushati/src/profile/presentation/app/user_info_bloc/user_info_bloc.dart';

import '../../../../../core/common/app/cache_helper.dart';
import '../../../../../core/common/singletons/cache.dart';
import '../../../../../core/services/injection_container.dart';
import '../../../../../core/services/router.dart';
import '../../../../auth/presentation/views/login_view.dart';
import '../../../../on_boarding/presentation/views/onboarding_view.dart';

part 'app_redirection_event.dart';

part 'app_redirection_state.dart';

class AppRedirectionBloc
    extends Bloc<AppRedirectionEvent, AppRedirectionState> {
  AppRedirectionBloc() : super(AppRedirectionInitial()) {
    on<GetAppData>(_getAppData);
    on<GetAppDataAndRedirect>(_getAppDataAndRedirect);

    on<GetAppLocalDataData>(_getAppLocalData);
  }

  Future<void> _getAppLocalData(event, emit) async {
    // Future.wait([, /*init()*/]);

    await getCache();
    emit(AppRedirectionSuccess());
  }

  ///called from app run splash screen
  _getAppDataAndRedirect(event, emit) async {
    await getCache();
    BuildContext context = event.context;

    ///called to get workspaces for create account page
    redirect(context);
  }

  ///called from login screen success and also from home screen just to not recall everyhing again
  _getAppData(event, emit) async {
    await getCache();

    BuildContext context = event.context;

    ///called to get workspaces for create account page
    getData(context);
  }

  Future<void> getCache() async {
    ///singelton creation for session and setup or required data
    final cacheHelper = await sl<CacheHelper>()

      ..getSessionToken()
      ..getUserId()
      ..isFirstTime()
      ..getUserName()
      ..getBaseUrl()
      ..getLanguage();
  }

  redirect(BuildContext context) {
    final isFirstTime = Cache.instance.firstTime;

    if (isFirstTime) {
      //todo go onboarding
      SchedulerBinding.instance.addPostFrameCallback((_) {
        router.go(OnBoardingView.path);
      });
    } else if (Cache.instance.isLoggedOut()) {
      SchedulerBinding.instance.addPostFrameCallback((_) {
        router.go(LoginView.path);
      });
    } else {
      getData(context);
      // Wrap Navigator with SchedulerBinding to wait for rendering state before navigating
      SchedulerBinding.instance.addPostFrameCallback((_) {
        router.go(HomeView.path);
      });
    }
  }

  getData(BuildContext context) {
    context.read<CardsBloc>().add(const CardsEvent.getCards());
    context.read<UserInfoBloc>().add(const UserInfoEvent.getUserInfo());
    context.read<NfcScannerCubit>().checkNfcSupported();
  }
}
