part of 'profile_transaction_bloc.dart';

sealed class ProfileTransactionState extends Equatable {
  const ProfileTransactionState();
  
  @override
  List<Object> get props => [];
}

final class ProfileTransactionInitial extends ProfileTransactionState {}
