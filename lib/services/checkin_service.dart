import 'dart:math';

import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:flutter/foundation.dart';
import 'package:project_fab/exceptions/dio_exception.dart';
import '../models/models.dart';
import '../utils/http/http_client.dart';

class CheckinService {
  // Send un-cached http request
  static Future<List<Checkin>> getCheckins() async {
    var url = '${HttpClient.apiUrl}/checkins';

    var response = await HttpClient.create().get(url);

    return response.data.map<Checkin>((p) => Checkin.fromJson(p)).toList();
  }

  // This method implements an HTTP request with caching
  static Future<List<Checkin>?> getCheckinsWithCaching() async {
    try {
      final response = await HttpClient.create(
        cacheOptions: HttpClient.defaultCacheOptions.copyWith(
          maxStale: const Nullable(Duration(days: 1)),
        ),
      ).get('${HttpClient.apiUrl}/checkins');

      return response.data.map<Checkin>((p) => Checkin.fromJson(p)).toList();
    } on DioError catch (error) {
      if (kDebugMode) {
        print("Error while getCheckinsWithCaching: ${error.message}.");
      }
      return Future.error(DioException.fromDioError(error));
    }
  }
}
