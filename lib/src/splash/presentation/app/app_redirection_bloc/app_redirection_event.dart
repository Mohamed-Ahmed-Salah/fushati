part of 'app_redirection_bloc.dart';

@freezed
sealed class AppRedirectionEvent with _$AppRedirectionEvent {
  const factory AppRedirectionEvent.getAppDataAndRedirect(
      {required BuildContext context}) = GetAppDataAndRedirect;

  const factory AppRedirectionEvent.getAppData(
      {required BuildContext context}) = GetAppData;

  const factory AppRedirectionEvent.getAppLocalDataData(
      {required BuildContext context}) = GetAppLocalDataData;

  const factory AppRedirectionEvent.updateLoadedSchools() =
      UpdateLoadedSchoolsData;
  const factory AppRedirectionEvent.updateLoadedMinVersion() =
      UpdateLoadedMinVersionData;
}
