import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:flutter/foundation.dart';
import 'package:project_fab/exceptions/dio_exception.dart';
import 'package:project_fab/models/comment.dart';
import '../utils/http/http_client.dart';

class CommentService {
  static Future<List<Comment>> getComments(
    int checkinId,
    int pageKey,
    int pageSize,
  ) async {
    var url = Uri.parse(
      '${HttpClient.apiUrl}/checkins/$checkinId/comments?page=$pageKey',
    );

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
          .map<Comment>((checkin) => Comment.fromJson(checkin))
          .toList();
    } on DioError catch (error) {
      if (kDebugMode) {
        print("Error while getComments: ${error.message}.");
      }
      return Future.error(DioException.fromDioError(error));
    }
  }

  static Future<void> postComment(int checkinId, String comment) async {
    var url = '${HttpClient.apiUrl}/comments';

    await HttpClient.create().post(url, data: {
      'checkinId': checkinId,
      'body': comment,
    });
  }

  static Future<void> removeComment(int commentId) async {
    var url = '${HttpClient.apiUrl}/comments/$commentId';

    await HttpClient.create().delete(url);
  }
}
