part of 'card_transaction_bloc_bloc.dart';

sealed class CardTransactionBlocState extends Equatable {
  const CardTransactionBlocState();
  
  @override
  List<Object> get props => [];
}

final class CardTransactionBlocInitial extends CardTransactionBlocState {}
