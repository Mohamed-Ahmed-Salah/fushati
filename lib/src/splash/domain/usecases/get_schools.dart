import 'package:fushati/src/splash/domain/entities/school.dart';
import 'package:fushati/src/splash/domain/repo/schools_repo.dart';

import '../../../../core/usecase/usecase.dart';
import '../../../../core/utils/typedefs.dart';

class GetSchools extends UsecaseWithoutParams<List<School>> {
  const GetSchools(this._repo);

  final SchoolsRepo _repo;

  @override
  ResultFuture<List<School>> call() => _repo.getSchools();
}
