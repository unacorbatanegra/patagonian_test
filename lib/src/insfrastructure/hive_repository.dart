import 'package:hive/hive.dart';

class HiveRepository<T> {
  T getUnit(String boxName, String key) {
    final box = Hive.box<T>(boxName);
    return box.get(key);
  }

  List<T> getList(String boxName) {
    final box = Hive.box<T>(boxName);
    return box.values.toList();
  }

  void clearData(String boxName) {
    final box = Hive.box<T>(boxName);
    box.clear();
  }

  void putUnit(String boxName, T data, String key) {
    final box = Hive.box<T>(boxName);
    box.put(key, data);
  }

  void deleteUnit(String boxName, String key) {
    final box = Hive.box<T>(boxName);
    box.delete(key);
  }
}
