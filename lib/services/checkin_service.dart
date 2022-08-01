import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:flutter/foundation.dart';
import 'package:project_fab/exceptions/dio_exception.dart';
import '../models/models.dart';
import '../utils/http/http_client.dart';

class CheckinService {
  // Send un-cached http request
  static Future<List<Checkin>> getCheckins(
    int pageKey,
    int pageSize,
  ) async {
    var url = Uri.parse('${HttpClient.apiUrl}/checkins?page=$pageKey');

    try {
      var response = await HttpClient.create(
        cacheOptions: HttpClient.defaultCacheOptions.copyWith(
          maxStale: const Nullable(
            Duration(days: 1),
          ),
        ),
      ).get(
        url.toString(),
      );

      return response.data
          .map<Checkin>((checkin) => Checkin.fromJson(checkin))
          .toList();
    } on DioError catch (error) {
      if (kDebugMode) {
        print("Error while getCheckinsWithCaching: ${error.message}.");
      }
      return Future.error(DioException.fromDioError(error));
    }
  }
}
