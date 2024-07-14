import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fushati/src/home/data/models/transaction_model.dart';

import '../../../../../core/utils/constants/error_consts.dart';
import '../../../domain/usecases/get_transacrions.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'card_transaction_bloc_event.dart';

part 'card_transaction_bloc_state.dart';

part 'card_transaction_bloc.freezed.dart';

class CardTransactionBlocBloc
    extends Bloc<CardTransactionBlocEvent, CardTransactionBlocState> {
  final GetCardTransactions _getCardTransactions;

  CardTransactionBlocBloc({required GetCardTransactions getCardTransactions})
      : _getCardTransactions = getCardTransactions,
        super(const CardTransactionBlocState.loading()) {
    on<GetCardTransactionEvent>(_getTransactions);
  }

  _getTransactions(event, emit) async {
    final int id = event.id;
    String cardNumber = event.cardNumber;
    final createdAt = event.createdAt;
    emit(const CardTransactionBlocState.loading());
    final result = await _getCardTransactions(TransactionParam(
      userId: id,
      userCard: cardNumber,
      createdAt: createdAt,
    ));
    result.fold(
      (failure) async {
        emit(CardTransactionBlocState.failed(
            ErrorConst.getErrorBody(text: failure.message)));
      },
      (transactions) async {
        emit(CardTransactionBlocState.success(transactions: transactions));
      },
    );
  }
}
