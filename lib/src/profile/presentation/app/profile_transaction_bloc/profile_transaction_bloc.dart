import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'profile_transaction_event.dart';
part 'profile_transaction_state.dart';

class ProfileTransactionBloc extends Bloc<ProfileTransactionEvent, ProfileTransactionState> {
  ProfileTransactionBloc() : super(ProfileTransactionInitial()) {
    on<ProfileTransactionEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
