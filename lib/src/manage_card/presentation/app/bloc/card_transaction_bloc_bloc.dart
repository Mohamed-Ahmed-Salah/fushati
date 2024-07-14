import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'card_transaction_bloc_event.dart';
part 'card_transaction_bloc_state.dart';

class CardTransactionBlocBloc extends Bloc<CardTransactionBlocEvent, CardTransactionBlocState> {
  CardTransactionBlocBloc() : super(CardTransactionBlocInitial()) {
    on<CardTransactionBlocEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
