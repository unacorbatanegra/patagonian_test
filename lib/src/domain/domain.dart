
import 'package:uuid/uuid.dart';

import '../insfrastructure/infrastructure.dart';

export '../models/models.dart';
export '../utils/utils.dart';
export './../services/services.dart';

abstract class Domain<T> {
  
  final hiveRepository = HiveRepository<T>();
  final uuid = Uuid();

  String get uidV1 => uuid.v1();

  Future<List<T>> getList({
    int limit = 20,
    bool startAfterTheLastDocument = false,
  });
}
