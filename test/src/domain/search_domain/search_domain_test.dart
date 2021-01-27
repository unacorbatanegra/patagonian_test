import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:mockito/mockito.dart';
import 'package:patagonian_test/src/domain/domains.dart';
import 'package:patagonian_test/src/insfrastructure/hive_repository.dart';
import 'package:patagonian_test/src/models/models.dart';

class HiveMockRepository<T> extends Mock implements HiveRepository<T> {
  List<T> list = <T>[];
  @override
  void add(String boxName, T data) => list.add(data);

  @override
  void clear(String boxName) {}

  @override
  void delete(String boxName, String key) {}

  @override
  T get(String boxName, String key) {
    throw UnimplementedError();
  }

  @override
  List<T> getList(String boxName) => list;
}

void main() {
  final searchDomain = SearchDomain();
  searchDomain.hiveRepository = HiveMockRepository();

  searchDomain.httpRepository.client = MockClient(
    (e) async {
      print(e.url);
      final jsonMap = {'lyrics': 'we are young'};
      return Response(json.encode(jsonMap), 200);
    },
  );
  test(
    'fectch domain',
    () async {
      final result = await searchDomain.fetch(
        Search(
          artistName: 'fun',
          songName: 'we are young',
        ),
      );
      expect(result.hasError, false);
    },
  );
  test(
    'test hive implementation',
    () async {
      final result = await searchDomain.fetch(
        Search(
          artistName: 'fun',
          songName: 'we are young',
        ),
      );
      expect(result.hasError, false);
      expect(searchDomain.lastResults, isNotEmpty);
    },
  );
}
