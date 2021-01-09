import '../insfrastructure/infrastructure.dart';

export '../models/models.dart';
export '../utils/utils.dart';
export './../services/services.dart';

abstract class Domain<T> {
  final httpRepository = HttpRepository<T>();
}
