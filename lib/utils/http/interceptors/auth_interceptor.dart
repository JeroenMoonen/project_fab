import 'dart:io';
import 'package:dio/dio.dart';

import 'package:project_fab/services/authentication_service.dart';
import 'package:project_fab/services/jwt_storage.dart';

class AuthInterceptor extends Interceptor {
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // Authentication path and register user path should not have a jwt token.
    if (options.path.contains('authentication_token') ||
        (options.path.contains('users') && options.method == 'POST')) {
      handler.next(options);
      return;
    }

    if (await AuthenticationService.isLoggedIn() == true) {
      var token = await JwtStorage().getJwt();

      // if (token == null) {
      //   throw JwtIsEmptyException();
      // }

      options.headers[HttpHeaders.authorizationHeader] = 'Bearer $token';
    }

    handler.next(options);
  }
}
