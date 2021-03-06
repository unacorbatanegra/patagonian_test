import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/models.dart';

typedef FromJson<T> = T Function(Map<String, dynamic> json);

class HttpRepository<T> {
  http.Client client = http.Client();

  Future<ApiResponse<T>> fetchData(
    String url,
    FromJson<T> fromJson,
  ) async {
    final result = await client.get(url);
    return ApiResponse(
      data: fromJson(json.decode(result.body) as Map<String, dynamic>),
      statusCode: result.statusCode,
    );
  }
}
