import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fushati/src/home/domain/usecases/add_card_usecase.dart';

import '../../../../home/domain/usecases/add_card.dart';

part 'add_new_card_event.dart';

part 'add_new_card_state.dart';

part 'add_new_card_bloc.freezed.dart';

class AddNewCardBloc extends Bloc<AddNewCardEvent, AddNewCardState> {
  final AddCard _addCard;
  final AddCardByNumberUsecase _addCardByNumber;

  AddNewCardBloc({
    required AddCard addCard,
    required AddCardByNumberUsecase addCardByNumber,
  })  : _addCard = addCard,
        _addCardByNumber = addCardByNumber,
        super(const AddNewCardState.loading()) {
    on<AddCardEvent>(_addCardEvent);
    on<AddCardByNumberEvent>(_addCardByNumberEvent);
  }

  _addCardEvent(event, emit) async {
    emit(const AddNewCardState.loading());
    final result = await _addCard(AddNewCardParams(
        email: event.email,
        name: event.name,
        cardNumber: event.cardNumber,
        studentNumber: event.cardNumber,
        phoneNumber: event.phoneNumber));
    result.fold(
      (failure) {
        print("failure.message ${failure.message}");
        emit(AddNewCardState.failed(failure.message));
      },
      (_) {
        emit(const AddNewCardState.success());
      },
    );
  }

  _addCardByNumberEvent(event, emit) async {
    emit(const AddNewCardState.loading());
    final result = await _addCardByNumber(event.cardNumber);
    result.fold(
      (failure) {
        print("FAILUER ${failure.message}");
        emit(AddNewCardState.failed(failure.message));
      },
      (_) {
        emit(const AddNewCardState.success());
      },
    );
  }
}
