import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/utils/constants/error_consts.dart';
import '../../../domain/entity/card.dart';
import '../../../domain/usecases/get_cards.dart';

part 'cards_event.dart';

part 'cards_state.dart';

part 'cards_bloc.freezed.dart';

class CardsBloc extends Bloc<CardsEvent, CardsState> {
  final GetCards _getCards;

  CardsBloc({required GetCards getCard})
      : _getCards = getCard,
        super(const CardsState.loading()) {
    on<GetCardsEvent>(_getCardEvent);
  }

  _getCardEvent(event, emit) async {
    emit(const CardsState.loading());
    final result = await _getCards();
    result.fold(
      (failure) {
        emit(CardsState.failed(ErrorConst.getErrorBody(text: failure.message)));
      },
      (cards) {
        if (cards.isEmpty) {
          emit(const CardsState.emptyList());
        } else {
          emit(CardsState.success(cards: cards));
        }
      },
    );
  }
}
