import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:project_fab/models/comment.dart';
import 'package:project_fab/pages/comment/comment_list_item.dart';
import 'package:project_fab/services/comment_service.dart';

class CommentList extends StatefulWidget {
  final int checkinId;
  final PagingController<int, Comment> pagingController;

  const CommentList({
    Key? key,
    required this.checkinId,
    required this.pagingController,
  }) : super(key: key);

  @override
  State<CommentList> createState() => CommentListState();
}

class CommentListState extends State<CommentList> {
  final int _numberOfPostsPerRequest = 10;

  @override
  void initState() {
    widget.pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.initState();
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      final List<Comment> comments = await CommentService.getComments(
        widget.checkinId,
        pageKey,
        _numberOfPostsPerRequest,
      );

      final isLastPage = comments.length < _numberOfPostsPerRequest;
      if (isLastPage) {
        widget.pagingController.appendLastPage(comments);
      } else {
        final nextPageKey = pageKey + 1;
        widget.pagingController.appendPage(comments, nextPageKey);
      }
    } catch (e) {
      widget.pagingController.error = e;
    }
  }

  @override
  Widget build(BuildContext context) {
    return PagedSliverList<int, Comment>(
      // physics: const NeverScrollableScrollPhysics(),
      pagingController: widget.pagingController,
      builderDelegate: PagedChildBuilderDelegate<Comment>(
        animateTransitions: true,
        noItemsFoundIndicatorBuilder: (BuildContext context) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
              child: Column(
                children: <Widget>[
                  Text(
                    'There are no comments yet',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Text(
                    'Leave a comment',
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          );
        },
        firstPageProgressIndicatorBuilder: (BuildContext context) {
          return const Padding(
            padding: EdgeInsets.all(32),
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        },
        itemBuilder: (BuildContext context, item, index) => CommentListItem(
          comment: item,
        ),
      ),
    );
  }
}
