import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/common/app/cache_helper.dart';
import '../../../../../core/utils/constants/text_constants.dart';

part 'app_language_state.dart';

part "app_language_cubit.freezed.dart";

class AppLanguageCubit extends Cubit<AppLanguageState> {
  final CacheHelper _cacheHelper;

  AppLanguageCubit({required CacheHelper cacheHelper})
      : _cacheHelper = cacheHelper,
        super(const AppLanguageState.initial(
            Locale(TextConstants.starterLangCode)));

  void changeLanguage({required String newLanguage}) {
    if (Locale(newLanguage) == state.locale) return;
    saveLocale(newLanguage);
    emit(AppLanguageState.initial(Locale(newLanguage)));
  }

  void saveLocale(String newLanguage) async {
    _cacheHelper.setLanguage(newLanguage);
  }

  void getLanguage() async {
    Locale saveLocale = await getLocale();
    emit(AppLanguageState.initial(saveLocale));
  }

  Future<Locale> getLocale() async {
    String langCode = TextConstants.starterLangCode;
    String? localType = await _cacheHelper.getLanguage();
    localType = localType ?? langCode;
    return Locale(localType);
  }
}
