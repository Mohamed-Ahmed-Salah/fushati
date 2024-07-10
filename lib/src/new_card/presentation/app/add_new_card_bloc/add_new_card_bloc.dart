import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_new_card_event.dart';
part 'add_new_card_state.dart';
part 'add_new_card_bloc.freezed.dart';

class AddNewCardBloc extends Bloc<AddNewCardEvent, AddNewCardState> {
  AddNewCardBloc() : super(const AddNewCardState.loading()) {
    on<AddNewCardEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
