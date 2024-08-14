part of 'get_schools_bloc.dart';
@freezed
sealed class GetSchoolsState with _$GetSchoolsState  {
  const factory GetSchoolsState.loading() = _loadingState;

  const factory GetSchoolsState.failed({required String message}) = _failedState;

  const factory GetSchoolsState.success({required List<School> schools}) = _successState;
}

