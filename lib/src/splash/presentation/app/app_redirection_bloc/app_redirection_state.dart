part of 'app_redirection_bloc.dart';

sealed class AppRedirectionState extends Equatable {
  const AppRedirectionState();
  
  @override
  List<Object> get props => [];
}

final class AppRedirectionInitial extends AppRedirectionState {}

final class AppRedirectionSuccess extends AppRedirectionState {}


final class AppRedirectionHome extends AppRedirectionState {}


final class AppRedirectionLogin extends AppRedirectionState {}
final class AppRedirectionOnBoarding extends AppRedirectionState {}


