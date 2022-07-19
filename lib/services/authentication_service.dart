import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';

import '../models/models.dart';
import '../utils/http/http_client.dart';

class AuthenticationService {
  // Send un-cached http request
  static Future<List<User>> getUsers() async {
    var response =
        await HttpClient.create().get('${HttpClient.serverUrl}/users');
    return response.data.map<User>((p) => User.fromJson(p)).toList();
  }

  // This method implements an HTTP request with caching
  static Future<List<User>> getPostsWithCaching({ignoreCache = false}) async {
    var response = await HttpClient.create(
            cacheOptions: HttpClient.defaultCacheOptions
                .copyWith(maxStale: const Nullable(Duration(days: 1))))
        .get(
      '${HttpClient.serverUrl}/posts',
    );
    return response.data.map<User>((p) => User.fromJson(p)).toList();
  }
}
