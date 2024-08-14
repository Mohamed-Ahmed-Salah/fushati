import 'package:fushati/src/home/domain/entity/card.dart';
import 'package:fushati/src/splash/domain/entities/school.dart';

import '../../../../core/utils/typedefs.dart';

abstract class SchoolsRepo {


  ResultFuture<List<School>> getSchools();
}
