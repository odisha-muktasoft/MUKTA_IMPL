// ignore_for_file: avoid_dynamic_calls

import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';

class MBRepository {
  final Dio _client;
  MBRepository(this._client);

  Future<dynamic> fetchMbInbox({
    Map<String, String>? queryParameters,
    dynamic body,
    required String url,
  }) async {
    try {
      Dio http=Dio();
      final res = await http.post(url,
          queryParameters: queryParameters,
          data: body ?? {},
         );

      return jsonDecode(res.data);
    } on DioError catch (ex) {
      // Assuming there will be an errorMessage property in the JSON object
      rethrow;
    }
  }
}
