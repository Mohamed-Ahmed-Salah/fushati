part of 'app_redirection_bloc.dart';

sealed class AppRedirectionEvent extends Equatable {
  const AppRedirectionEvent();

  @override
  List<Object> get props => [];
}

class GetAppDataAndRedirect extends AppRedirectionEvent {
  final BuildContext context;

  const GetAppDataAndRedirect({required this.context});
}

class GetAppData extends AppRedirectionEvent {
  final BuildContext context;

  const GetAppData({required this.context});
}

class GetAppLocalDataData extends AppRedirectionEvent {
  final BuildContext context;

  const GetAppLocalDataData({required this.context});
}
