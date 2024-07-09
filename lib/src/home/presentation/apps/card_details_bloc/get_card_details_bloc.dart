import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'get_card_details_event.dart';
part 'get_card_details_state.dart';

class GetCardDetailsBloc extends Bloc<GetCardDetailsEvent, GetCardDetailsState> {
  GetCardDetailsBloc() : super(GetCardDetailsInitial()) {
    on<GetCardDetailsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
