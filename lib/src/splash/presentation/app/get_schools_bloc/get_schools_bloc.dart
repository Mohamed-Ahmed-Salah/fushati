import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fushati/src/splash/domain/entities/school.dart';
import 'package:fushati/src/splash/domain/usecases/get_schools.dart';

part 'get_schools_event.dart';

part 'get_schools_state.dart';

part 'get_schools_bloc.freezed.dart';

class GetSchoolsBloc extends Bloc<GetSchoolsEvent, GetSchoolsState> {
  final GetSchools _getSchools;

  GetSchoolsBloc({required GetSchools getSchools})
      : _getSchools = getSchools,
        super(const GetSchoolsState.loading()) {
    on<GetSchoolsListEvent>(_getSchoolEvent);
  }

  _getSchoolEvent(event, emit) async {
    emit(const GetSchoolsState.loading());

    final result = await _getSchools();
    result.fold(
      (failure) {
        emit(GetSchoolsState.failed(message: failure.message));
      },
      (schools) {
        emit(GetSchoolsState.success(schools: schools));
      },
    );
  }
}
