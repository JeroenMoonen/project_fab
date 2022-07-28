import 'package:project_fab/models/comment.dart';
import '../utils/http/http_client.dart';

class CommentService {
  static Future<List<Comment>> getComments(checkinId) async {
    var url = '${HttpClient.apiUrl}/checkins/$checkinId/comments';

    var response = await HttpClient.create().get(url);

    return response.data.map<Comment>((c) => Comment.fromJson(c)).toList();
  }
}
