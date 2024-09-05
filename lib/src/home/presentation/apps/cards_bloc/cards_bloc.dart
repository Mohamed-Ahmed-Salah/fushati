import 'package:flutter/cupertino.dart';
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
        super(const CardsState.initial()) {
    on<GetCardsEvent>(_getCardEvent);
  }

  _getCardEvent(event, emit) async {
    int currentPage = 0;
    int maxPage = 1;
    List<CardEntity> cards = [];

    final bool callFromStart = event.callFromStart ?? false;
    state.when(
        initial: () {},
        loading: (list, page, max) {
          cards = list;
          currentPage = page;
          maxPage = max;
        },
        emptyList: () {},
        failed: (error, list, page, max) {
          cards = list;
          currentPage = page;
          maxPage = max;
        },
        success: (list, page, max) {
          cards = list;
          currentPage = page;
          maxPage = max;
        });

    int nextPage = currentPage + 1;
    if(callFromStart){
      nextPage=1;
      maxPage=1;
    }
    if (nextPage > maxPage || state is loadingState) {
      debugPrint("nextPage > maxPage || state is loadingState");
      debugPrint("$nextPage > $maxPage ${state is loadingState}");
      return;
    }
    emit(CardsState.loading(
      cards: cards,
      maxPage: maxPage,
      currentPage: currentPage,
    ));
    final result = await _getCards(nextPage);
    result.fold(
      (failure) {
        emit(
          CardsState.failed(
            message: ErrorConst.getErrorBody(
              text: failure.message,
            ),
            cards: cards,
            maxPage: maxPage,
            currentPage: currentPage,
          ),
        );
      },
      (response) {
        debugPrint(
            "current PAGE = ${response.currentPage}, ${response.lastPage}");
        if (response.cards.isEmpty) {
          emit(const CardsState.emptyList());
        } else {
          emit(CardsState.success(cards: [
            ...cards,
            ...response.cards,
          ], maxPage: response.lastPage, currentPage: response.currentPage));
        }
      },
    );
  }
}
