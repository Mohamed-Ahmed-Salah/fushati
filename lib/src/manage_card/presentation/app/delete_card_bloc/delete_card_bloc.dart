import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/utils/constants/error_consts.dart';
import '../../../domain/usecases/delete_card.dart';

part 'delete_card_event.dart';

part 'delete_card_state.dart';

part 'delete_card_bloc.freezed.dart';

class DeleteCardBloc extends Bloc<DeleteCardEvent, DeleteCardState> {
  final DeleteCard _deleteCard;

  DeleteCardBloc({required DeleteCard deleteCard})
      : _deleteCard = deleteCard,
        super(const DeleteCardState.initial()) {
    on<DeleteCardEventClass>(_deleteCardEvent);
    on<DeleteCardResetEvent>(_resetEvent);
  }

  _resetEvent(event, emit) {
    emit(const DeleteCardState.initial());
  }

  _deleteCardEvent(event, emit) async {
    int id = event.id;
    emit(const DeleteCardState.loading());

    final result = await _deleteCard(id);
    result.fold(
      (failure) {
        emit(DeleteCardState.failed(
            ErrorConst.getErrorBody(text: failure.message)));
      },
      (cards) {
        emit(const DeleteCardState.success());
      },
    );
  }
}
