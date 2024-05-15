// ignore_for_file: avoid_dynamic_calls

import 'dart:async';

import 'package:dio/dio.dart';
import 'package:works_shg_app/models/employee/work_order/wo_inbox_response.dart';

import '../../../utils/global_variables.dart';

class WORepository {
  final Dio _client;
  WORepository(this._client);

  Future<WOInboxResponse> fetchWoInbox({
    Map<String, String>? queryParameters,
    dynamic body,
    required String url,
  }) async {
    try {
      //Dio http=Dio();
      final res = await _client.post(
        url,
        queryParameters: queryParameters,
        data: body ?? {},
        options: Options(extra: {
          "userInfo": GlobalVariables.userRequestModel,
          "accessToken": GlobalVariables.authToken
        }),
      );

      // return res.data;
      return WOInboxResponse.fromJson(res.data);
    } on DioError catch (ex) {
      // Assuming there will be an errorMessage property in the JSON object
      rethrow;
    }
  }

  // FutureOr<MBDetailResponse> fetchMbDetail({
  //   Map<String, String>? queryParameters,
  //   dynamic body,
  //   required String url,
  // }) async {
  //   try {
  //     //Dio http=Dio();
  //     final res = await _client.post(
  //       url,
  //       queryParameters: queryParameters,
  //       data: body ?? {},
  //       options: Options(extra: {
  //         "userInfo": GlobalVariables.userRequestModel,
  //         "accessToken": GlobalVariables.authToken
  //       }),
  //     );

  //     //return res.data;
  //     // return MBInboxResponse.fromJson(res.data);

  //     return MBDetailResponse.fromJson(res.data);
  //   } on DioError catch (ex) {
  //     // Assuming there will be an errorMessage property in the JSON object
  //     rethrow;
  //   }
  // }

  // FutureOr<Measurement> updateMeasurement({
  //   Map<String, String>? queryParameters,
  //   dynamic body,
  //   required String url,
  // }) async {
  //   try {
  //     //Dio http=Dio();
  //     final res = await _client.post(
  //       url,
  //       queryParameters: queryParameters,
  //       data: body ?? {},
  //       options: Options(extra: {
  //         "userInfo": GlobalVariables.userRequestModel,
  //         "accessToken": GlobalVariables.authToken
  //       }),
  //     );

  //     //return res.data;
  //     return Measurement.fromJson(res.data);
  //   } on DioError catch (ex) {
  //     // Assuming there will be an errorMessage property in the JSON object
  //     rethrow;
  //   }
  // }
}
