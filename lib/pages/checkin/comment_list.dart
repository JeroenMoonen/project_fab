import 'package:flutter/material.dart';
import 'package:project_fab/components/comment_item.dart';
import 'package:project_fab/models/comment.dart';
import 'package:project_fab/services/comment_service.dart';

class CommentList extends StatefulWidget {
  final int checkinId;
  final VoidCallback refreshFunction;

  const CommentList({
    Key? key,
    required this.refreshFunction,
    required this.checkinId,
  }) : super(key: key);

  @override
  State<CommentList> createState() => CommentListState();
}

class CommentListState extends State<CommentList> {
  Future<List<Comment>> _fetchComments(checkinId) async {
    return await CommentService.getComments(checkinId);
  }

  Widget _onWaiting(bool hasData) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const CircularProgressIndicator(),
        const SizedBox(
          height: 30,
        ),
        Visibility(
          visible: hasData,
          child: const Text('Loading..'),
        )
      ],
    );
  }

  Widget _onError() {
    return const Text('Error');
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Comment>>(
      future: _fetchComments(widget.checkinId),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return _onWaiting(snapshot.hasData);
        } else if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return _onError();
          } else if (snapshot.hasData) {
            return ListView.builder(
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                final item = snapshot.data[index];
                return Dismissible(
                  key: Key('item_$item'),
                  background: Container(
                    color: Colors.blue,
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Row(
                        children: const <Widget>[
                          Icon(
                            Icons.favorite,
                            color: Colors.white,
                          ),
                          Text(
                            'awef',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  secondaryBackground: Container(
                    color: Colors.red,
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: const <Widget>[
                          Icon(
                            Icons.delete,
                            color: Colors.white,
                          ),
                          Text(
                            'Remove',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  confirmDismiss: (DismissDirection direction) async {
                    return await showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text("Delete Confirmation"),
                          content: const Text(
                            "Are you sure you want to delete your comment?",
                          ),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () => Navigator.of(context).pop(true),
                              child: const Text("Delete"),
                            ),
                            TextButton(
                              onPressed: () => Navigator.of(context).pop(false),
                              child: const Text("Cancel"),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  onDismissed: (DismissDirection direction) {
                    CommentService.removeComment(item.id);

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Your has been removed.'),
                      ),
                    );
                  },
                  child: CommentItem(comment: item),
                );
              },
            );
          }

          return const Text('There are no comments yet. Be the first one!');
        }

        return Text('State: ${snapshot.connectionState}');
      },
    );
  }
}
