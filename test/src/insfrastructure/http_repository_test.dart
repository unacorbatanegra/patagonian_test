import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:patagonian_test/src/insfrastructure/infrastructure.dart';
import 'package:patagonian_test/src/models/models.dart';

void main() {
  final http = HttpRepository<Search>();
  test(
    'fecth data',
    () async {
      http.client = MockClient(
        (r) async {
          final jsonMap = {
            'lyrics': 'lyrics',
            'artistName': 'fun',
            'songName': 'we are young',
          };
          return Response(json.encode(jsonMap), 200);
        },
      );
      final result = await http.fetchData(
        'url',
        (_) => Search.fromJson(_),
      );
      expect(result.hasError, false);
      expect(result.errorMessage, '');
      expect(result.data.artistName, null);
    },
  );
  test(
    'data type data',
    () async {
      http.client = MockClient(
        (r) async {
          final jsonMap = {
            'lyrics': 'lyrics',
            'artistName': 'fun',
            'songName': 'we are young',
          };
          return Response(json.encode(jsonMap), 404);
        },
      );
      final result = await http.fetchData(
        'url',
        (_) => Search.fromJson(_),
      );
      expect(result.data.runtimeType, Search);
      expect(result.hasError, true);
      expect(result.errorMessage, isNotEmpty);
    },
  );
}
