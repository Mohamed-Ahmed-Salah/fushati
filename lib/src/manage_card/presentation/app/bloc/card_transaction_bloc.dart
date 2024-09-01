import 'package:bloc/bloc.dart';
import 'package:fushati/core/utils/constants/network_constants.dart';
import 'package:fushati/src/home/data/models/transaction_model.dart';
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
        super(const CardTransactionBlocState.loading()) {
    on<GetCardTransactionEvent>(_getTransactions);
    on<GetMoreCardTransaction>(_getMoreTransactions);
  }

  _getTransactions(event, emit) async {
    final int id = event.id;
    String cardNumber = event.cardNumber;
    final createdAt = event.createdAt;
    final int page = event.page;
    emit(const CardTransactionBlocState.loading());
    final result = await _getCardTransactions(TransactionParam(
      userId: id,
      userCard: cardNumber,
      createdAt: createdAt,
      page: page,
    ));
    result.fold(
      (failure) async {
        emit(CardTransactionBlocState.failed(
            ErrorConst.getErrorBody(text: failure.message)));
      },
      (transactions) async {
        bool hasMoreRecords = transactions.length == NetworkConstants.pageSize;
        emit(CardTransactionBlocState.success(
            transactions: transactions, hasMoreRecords: hasMoreRecords));
      },
    );
  }

  _getMoreTransactions(event, emit) async {
    final int id = event.id;
    String cardNumber = event.cardNumber;
    final createdAt = event.createdAt;
    if (state is _loadingState) return;

    bool isSuccess = false;
    bool hasMoreTransactions = false;
    List<Transaction> transactions = [];
    state.whenOrNull(success: (data, hasMore) {
      hasMoreTransactions = hasMore;
      isSuccess = true;
      transactions = data;
    });

    if (isSuccess) {
      if (hasMoreTransactions) {
        emit(CardTransactionBlocState.loading(transactions: transactions));
        final result = await _getCardTransactions(TransactionParam(
          userId: id,
          userCard: cardNumber,
          createdAt: createdAt,
          page: (transactions.length / NetworkConstants.pageSize).floor() + 1,
        ));
        result.fold(
          (failure) async {
            emit(CardTransactionBlocState.failed(
                ErrorConst.getErrorBody(text: failure.message)));
          },
          (newTransactions) async {
            bool hasMoreRecords =
                newTransactions.length == NetworkConstants.pageSize;
            emit(CardTransactionBlocState.success(
                transactions: [...transactions, ...newTransactions],
                hasMoreRecords: hasMoreRecords));
          },
        );
      } else {
        return;
      }
    }
  }
}
