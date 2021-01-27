import '../insfrastructure/infrastructure.dart';

export '../models/models.dart';
export '../utils/utils.dart';

abstract class Domain<T> {
  HttpRepository<T> httpRepository = HttpRepository<T>();
  HiveRepository<T> hiveRepository = HiveRepository<T>();
}
