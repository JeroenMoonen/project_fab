import 'package:project_fab/models/comment.dart';
import '../utils/http/http_client.dart';

class CommentService {
  static Future<List<Comment>> getComments(checkinId) async {
    var url = '${HttpClient.apiUrl}/checkins/$checkinId/comments';

    var response = await HttpClient.create().get(url);

    return response.data.map<Comment>((c) => Comment.fromJson(c)).toList();
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
