part of 'amount_to_transfer_cubit.dart';
@freezed
sealed class AmountToTransferState with _$AmountToTransferState {
const factory AmountToTransferState.initial({@Default(0) int amount}) = _initialState;

}

