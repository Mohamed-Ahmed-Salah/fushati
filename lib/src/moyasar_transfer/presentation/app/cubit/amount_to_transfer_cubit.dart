import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'amount_to_transfer_state.dart';

part 'amount_to_transfer_cubit.freezed.dart';

class AmountToTransferCubit extends Cubit<AmountToTransferState> {
  AmountToTransferCubit() : super(const AmountToTransferState.initial());

  addingAmountEvent({required int amount}) {
    emit(AmountToTransferState.initial(amount: amount));
  }

}
