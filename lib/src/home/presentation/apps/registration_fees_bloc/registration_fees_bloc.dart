import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fushati/core/utils/constants/error_consts.dart';
import 'package:fushati/src/home/domain/usecases/get_registration_fees.dart';

part 'registration_fees_event.dart';

part 'registration_fees_state.dart';

part 'registration_fees_bloc.freezed.dart';

class RegistrationFeesBloc
    extends Bloc<RegistrationFeesEvent, RegistrationFeesState> {
  final GetRegistrationFeesUseCase getRegistrationFeesUseCase;

  RegistrationFeesBloc({required this.getRegistrationFeesUseCase})
      : super(const RegistrationFeesState.loading()) {
    on<RegistrationFeesEvent>(_getRegistrationFees);
  }

  _getRegistrationFees(event, emit) async {
    emit(const RegistrationFeesState.loading());
    final result = await getRegistrationFeesUseCase();
    result.fold(
      (failure) {
        emit(RegistrationFeesState.failed(
            ErrorConst.getErrorBody(text: failure.message)));
      },
      (fees) {
        emit(RegistrationFeesState.success(fees: fees));
      },
    );
  }
}
