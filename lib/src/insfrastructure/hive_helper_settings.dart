import 'hive_repository.dart';

mixin HiveHelperSettings {
  static final _repository = HiveRepository<dynamic>();

  static dynamic getUnit(String key) => _repository.getUnit('settings', key);

  static void putUnit(String key, dynamic data) =>
      _repository.putUnit('settings', data, key);

  static void deleteUnit(String key) => _repository.deleteUnit('settings', key);
}
