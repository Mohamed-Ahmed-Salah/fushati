import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../home/domain/usecases/add_card.dart';

part 'add_new_card_event.dart';

part 'add_new_card_state.dart';

part 'add_new_card_bloc.freezed.dart';

class AddNewCardBloc extends Bloc<AddNewCardEvent, AddNewCardState> {
  final AddCard _addCard;

  AddNewCardBloc({required AddCard addCard})
      : _addCard = addCard,
        super(const AddNewCardState.loading()) {
    on<AddCardEvent>(_addCardEvent);
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
        emit(AddNewCardState.failed(
            failure.message));
      },
      (_) {
        emit(const AddNewCardState.success());
      },
    );
  }
}
