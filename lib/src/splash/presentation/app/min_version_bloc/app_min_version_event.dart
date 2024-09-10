part of 'app_min_version_bloc.dart';

@freezed
sealed class AppMinVersionEvent with _$AppMinVersionEvent {
  const factory AppMinVersionEvent.getAppVersion(
      {required BuildContext context}) = GetAppVersionEvent;


  const factory AppMinVersionEvent.updateApp() = UpdateAppEvent;
}

