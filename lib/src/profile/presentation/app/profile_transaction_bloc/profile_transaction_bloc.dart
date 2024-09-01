import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fushati/src/home/data/models/transaction_model.dart';
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
        super(const ProfileTransactionState.loading()) {
    on<GetUserTransactionsEvent>(_getTransactions);
  }

  _getTransactions(event, emit) async {
    emit(const ProfileTransactionState.loading());
    final result = await _getUserTransactions();
    result.fold(
      (failure) async {
        emit(ProfileTransactionState.failed(
            ErrorConst.getErrorBody(text: failure.message)));
      },
      (transactions) async {
        emit(ProfileTransactionState.success(transactions: transactions));
      },
    );
  }
}
