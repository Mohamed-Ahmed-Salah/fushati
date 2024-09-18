import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fushati/src/home/domain/entity/transaction.dart';
import '../../../../../core/utils/constants/error_consts.dart';
import '../../../domain/usecases/user_transactions.dart';

part 'profile_transaction_event.dart';

part 'profile_transaction_state.dart';

part 'profile_transaction_bloc.freezed.dart';

class ProfileTransactionBloc
    extends Bloc<ProfileTransactionEvent, ProfileTransactionState> {
  final GetUserTransactions _getUserTransactions;

  ProfileTransactionBloc({required GetUserTransactions getUserTransactions})
      : _getUserTransactions = getUserTransactions,
        super(const ProfileTransactionState.initial()) {
    on<GetUserTransactionsEvent>(_getTransactions);
  }

  _getTransactions(event, emit) async {
    int currentPage = 0;
    int maxPage = 1;
    List<Transaction> previousTransactions = [];

    final isFromStart = event.isFromStart ?? false;

    if(isFromStart){
      //do nothing keep data the same
    }else{
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
    }


    int nextPage = currentPage + 1;
    if (nextPage > maxPage || state is _loadingState) {
      debugPrint("nextPage > maxPage || state is loadingState");
      debugPrint("$nextPage > $maxPage ${state is _loadingState}");
      return;
    }

    emit(ProfileTransactionState.loading(
        transactions: previousTransactions,
        maxPage: maxPage,
        currentPage: currentPage));
    final result = await _getUserTransactions(nextPage);
    result.fold(
      (failure) async {
        emit(ProfileTransactionState.failed(
            message: ErrorConst.getErrorBody(text: failure.message),
            transactions: previousTransactions,
            maxPage: maxPage,
            currentPage: currentPage));
      },
      (response) async {
        emit(ProfileTransactionState.success(
            transactions: [...previousTransactions, ...response.transactions],
            currentPage: response.currentPage,
            maxPage: response.lastPage));
      },
    );
  }
}
