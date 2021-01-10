import '../insfrastructure/infrastructure.dart';

export '../models/models.dart';
export '../utils/utils.dart';

abstract class Domain<T> {
  final httpRepository = HttpRepository<T>();
  final hiveRepository = HiveRepository<T>();
}
