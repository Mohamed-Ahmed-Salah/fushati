part of 'get_schools_bloc.dart';
@freezed
sealed class GetSchoolsEvent with _$GetSchoolsEvent {
  const factory GetSchoolsEvent.getSchools() =
  GetSchoolsListEvent;
}
