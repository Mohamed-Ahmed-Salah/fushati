import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/utils/constants/error_consts.dart';
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
    String cardNumber = event.cardNumber;
    emit(const AddNewCardState.loading());
    final result = await _addCard(cardNumber);
    result.fold(
      (failure) {
        print("result------ ${failure.toString()}");

        emit(AddNewCardState.failed(
            ErrorConst.getErrorBody(text: failure.message)));
      },
      (_) {

        emit(AddNewCardState.success());
      },
    );
  }
}
