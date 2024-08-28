

import 'package:fushati/src/home/domain/repos/registration_fees_repo.dart';

import '../../../../core/usecase/usecase.dart';
import '../../../../core/utils/typedefs.dart';

class GetRegistrationFeesUseCase extends UsecaseWithoutParams<double> {
  const GetRegistrationFeesUseCase(this._repo);

  final RegistrationFeesRepo _repo;

  @override
  ResultFuture<double> call() =>
      _repo.getRegistrationFees();
}
