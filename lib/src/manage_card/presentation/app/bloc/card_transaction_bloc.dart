import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:fushati/src/home/domain/entity/transaction.dart';

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
        super(const CardTransactionBlocState.initial()) {
    on<GetCardTransactionEvent>(_getTransactions);
    on<ResetRecievedCardTransactionsEvent>(_resetTransactions);
  }

  _getTransactions(event, emit) async {
    int currentPage = 0;
    int maxPage = 1;
    List<Transaction> previousTransactions = [];

    state.when(
        initial: () {},
        loading: (list, page, max) {
          previousTransactions = list;
          currentPage = page;
          maxPage = max;
        },
        failed: (error, list, page, max) {
          previousTransactions = list;
          currentPage = page;
          maxPage = max;
        },
        success: (list, page, max) {
          previousTransactions = list;
          currentPage = page;
          maxPage = max;
        });

    int nextPage = currentPage + 1;
    if (nextPage > maxPage || state is _loadingState) {
      debugPrint("nextPage > maxPage || state is loadingState");
      debugPrint("$nextPage > $maxPage ${state is _loadingState}");
      return;
    }

    final int id = event.id;
    String cardNumber = event.cardNumber;
    emit(CardTransactionBlocState.loading(
        transactions: previousTransactions,
        maxPage: maxPage,
        currentPage: currentPage));
    final result = await _getCardTransactions(TransactionParam(
      userId: id,
      userCard: cardNumber,
      page: nextPage,
    ));
    result.fold(
      (failure) async {
        emit(CardTransactionBlocState.failed(
            message: ErrorConst.getErrorBody(text: failure.message),
            transactions: previousTransactions,
            maxPage: maxPage,
            currentPage: currentPage));
      },
      (response) async {
        debugPrint("max page ${response.lastPage} called page= ${response.currentPage} ");
        final transactions = response.transactions;
        emit(CardTransactionBlocState.success(
            transactions: [...previousTransactions, ...transactions],
            maxPage: response.lastPage,
            currentPage: response.currentPage));
      },
    );
  }

  _resetTransactions(event, emit) {
    emit(const CardTransactionBlocState.initial());
  }
}
