part of 'app_language_cubit.dart';

@freezed
sealed class AppLanguageState with _$AppLanguageState {
  const factory AppLanguageState.initial(Locale locale) = _initialState;
}
