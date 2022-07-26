import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:project_fab/exceptions/dio_exception.dart';
import '../models/models.dart';
import '../utils/http/http_client.dart';

class UserService {
  static Future<User> getUser({
    required int id,
    bool saveToLocal = false,
  }) async {
    try {
      var response =
          await HttpClient.create().get('${HttpClient.apiUrl}/users/$id');

      var data = User.fromJson(response.data);

      return data;
    } on DioError catch (error) {
      if (kDebugMode) {
        print("Error while logging in: ${error.message}.");
      }
      return Future.error(DioException.fromDioError(error));
    }
  }
}
