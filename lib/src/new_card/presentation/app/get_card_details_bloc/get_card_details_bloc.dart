import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/utils/constants/error_consts.dart';
import '../../../../home/domain/entity/card.dart';
import '../../../../home/domain/usecases/get_card.dart';

part 'get_card_details_event.dart';

part 'get_card_details_state.dart';

part 'get_card_details_bloc.freezed.dart';

class GetCardDetailsBloc
    extends Bloc<GetCardDetailsEvent, GetCardDetailsState> {
  final GetCardDetails _getCardDetails;

  GetCardDetailsBloc({required GetCardDetails getCardDetails})
      : _getCardDetails = getCardDetails,
        super(const GetCardDetailsState.loading()) {
    on<GetCardEvent>(_getCard);
  }

  _getCard(event, emit) async {
    String cardNumber = event.cardNumber;
    emit(const GetCardDetailsState.loading());
    final result = await _getCardDetails(cardNumber);
    result.fold(
      (failure) {
        if (failure.message == ErrorConst.CANNOT_FIND_CARD_EN) {
          emit(const GetCardDetailsState.notAddedBefore());
        } else {
          emit(GetCardDetailsState.failed(
              ErrorConst.getErrorBody(text: failure.message)));
        }
      },
      (card) {
        emit(GetCardDetailsState.success(card: card));
      },
    );
  }
}
