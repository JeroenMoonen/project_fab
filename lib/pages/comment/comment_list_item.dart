import 'package:flutter/material.dart';
import 'package:project_fab/components/avatar.dart';
import 'package:project_fab/components/time_ago.dart';
import 'package:project_fab/models/comment.dart';

class CommentListItem extends StatelessWidget {
  final Comment comment;

  const CommentListItem({Key? key, required this.comment}) : super(key: key);

  void onLongPress() {}

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: UserAvatar(
              radius: UserAvatar.xs,
              user: comment.user,
            ),
          ),
          Expanded(
            child: GestureDetector(
              onLongPress: onLongPress,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        '${comment.user.firstName} ${comment.user.lastName}',
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      TimeAgo(
                        date: comment.postedAt,
                      ),
                    ],
                  ),
                  const SizedBox(height: 1.0),
                  Text(
                    comment.body,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
