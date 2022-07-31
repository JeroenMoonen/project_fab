import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:flutter/foundation.dart';
import 'package:project_fab/exceptions/dio_exception.dart';
import 'package:project_fab/exceptions/jwt_is_empty_exception.dart';
import 'package:project_fab/services/authentication_service.dart';
import '../models/models.dart';
import '../utils/http/http_client.dart';

class CheckinService {
  // Send un-cached http request
  static Future<List<Checkin>> getCheckins() async {
    var url = '${HttpClient.apiUrl}/checkins';

    var response = await HttpClient.create().get(url);

    return response.data
        .map<Checkin>((checkin) => Checkin.fromJson(checkin))
        .toList();
  }

  // This method implements an HTTP request with caching
  static Future<List<Checkin>> getCheckinsWithCaching() async {
    try {
      final response = await HttpClient.create(
        cacheOptions: HttpClient.defaultCacheOptions.copyWith(
          maxStale: const Nullable(
            Duration(days: 1),
          ),
        ),
      ).get('${HttpClient.apiUrl}/checkins');

      return response.data
          .map<Checkin>((checkins) => Checkin.fromJson(checkins))
          .toList();
    } on DioError catch (error) {
      if (kDebugMode) {
        print("Error while getCheckinsWithCaching: ${error.message}.");
      }
      return Future.error(DioException.fromDioError(error));
    } on JwtIsEmptyException catch (error) {
      if (kDebugMode) {
        print("JWT is empty: ${error.errorMessage}.");
      }

      return Future.error(error.errorMessage);
    }
  }
}
