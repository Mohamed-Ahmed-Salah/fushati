part of 'app_redirection_bloc.dart';

sealed class AppRedirectionEvent extends Equatable {
  const AppRedirectionEvent();

  @override
  List<Object> get props => [];
}

class GetAppDataAndRedirect extends AppRedirectionEvent {
  final BuildContext context;

  GetAppDataAndRedirect({required this.context});
}

class GetAppData extends AppRedirectionEvent {
  final BuildContext context;

  GetAppData({required this.context});
}


class GetAppLocalDataData extends AppRedirectionEvent {
  final BuildContext context;

  GetAppLocalDataData({required this.context});
}