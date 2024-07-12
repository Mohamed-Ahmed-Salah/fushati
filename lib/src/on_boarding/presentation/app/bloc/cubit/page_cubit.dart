import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../../../core/common/app/cache_helper.dart';
import '../../../../../auth/presentation/views/login_view.dart';

class PageState {
  int currentIndexPage = 0;

  PageState({required this.currentIndexPage});
}

class OnBoardingPageCubit extends Cubit<PageState> {
  final CacheHelper cacheHelper;

  OnBoardingPageCubit({required this.cacheHelper})
      : super(PageState(currentIndexPage: 0));

  void changePage(int page) {
    emit(PageState(currentIndexPage: page));
  }

  void updateFirstTime(BuildContext context) {
    cacheHelper.cacheFirstTimer();
    context.go(LoginView.path);
  }
}
