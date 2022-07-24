import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:flutter/foundation.dart';
import 'package:project_fab/exceptions/dio_exception.dart';
import 'package:project_fab/services/jwt_storage.dart';
import '../models/models.dart';
import '../utils/http/http_client.dart';

class AuthenticationService {
  static Future<AuthenticationToken> authenticate({email, password}) async {
    //todo: check if the user is already authenticated!
    // var JWT = await storage.read(key: 'jwt');

    try {
      var response = await HttpClient.create()
          .post('${HttpClient.authenticationUrl}/authentication_token', data: {
        'email': email,
        'password': password,
      });

      var data = AuthenticationToken.fromJson(response.data);
      await JwtStorage().saveJwt(token: data.token);

      return data;
    } on DioError catch (error) {
      if (kDebugMode) {
        print("Error while logging in: ${error.message}.");
      }
      return Future.error(DioException.fromDioError(error));
    }
  }

  static Future<void> logout() async {
    await JwtStorage().removeJwt();
  }
  // Send un-cached http request
  // static Future<List<User>> getUsers() async {
  //   var response =
  //       await HttpClient.create().get('${HttpClient.serverUrl}/users');
  //   return response.data.map<User>((p) => User.fromJson(p)).toList();
  // }

  // // This method implements an HTTP request with caching
  // static Future<List<User>> getPostsWithCaching({ignoreCache = false}) async {
  //   var response = await HttpClient.create(
  //           cacheOptions: HttpClient.defaultCacheOptions
  //               .copyWith(maxStale: const Nullable(Duration(days: 1))))
  //       .get(
  //     '${HttpClient.serverUrl}/posts',
  //   );
  //   return response.data.map<User>((p) => User.fromJson(p)).toList();
  // }
}
