import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:project_fab/components/avatar.dart';
import 'package:project_fab/components/time_ago.dart';
import 'package:project_fab/models/checkin.dart';
import 'package:project_fab/models/comment.dart';
import 'package:project_fab/pages/comment/comment_list.dart';
import 'package:project_fab/pages/profile/profile_page.dart';
import 'package:project_fab/services/comment_service.dart';

class CheckinDetailPage extends StatefulWidget {
  static const routeName = '/checkin';

  const CheckinDetailPage({Key? key}) : super(key: key);

  @override
  State<CheckinDetailPage> createState() => _CheckinDetailPageState();
}

class _CheckinDetailPageState extends State<CheckinDetailPage> {
  late final TextEditingController _commentController;

  final PagingController<int, Comment> _pagingController = PagingController(
    firstPageKey: 1,
    invisibleItemsThreshold: 1, //default: 3
  );

  @override
  void initState() {
    _commentController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    _commentController.dispose();

    super.dispose();
  }

  Widget _bottomComment(int checkinId) {
    return Row(
      children: <Widget>[
        Flexible(
          child: TextField(
            keyboardType: TextInputType.multiline,
            maxLength: 255,
            controller: _commentController,
            decoration: const InputDecoration(
              hintText: 'Leave a message..',
              contentPadding: EdgeInsets.symmetric(
                horizontal: 5.0,
                vertical: 5.0,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black, width: 0.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black, width: 0.0),
              ),
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(40.0),
          ),
          child: RawMaterialButton(
            onPressed: () async {
              CommentService.postComment(checkinId, _commentController.text);
              _commentController.text = '';

              await _refreshComments();
            },
            elevation: 0,
            shape: const CircleBorder(),
            constraints: const BoxConstraints.tightFor(
              width: 48.0,
              height: 48.0,
            ),
            child: const Padding(
              padding: EdgeInsets.only(),
              child: Icon(
                Icons.send,
                size: 27,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Future _refreshComments() async {
    return Future.sync(
      () => _pagingController.refresh(),
    );
  }

  Widget content(Checkin checkin) {
    return Padding(
      padding: const EdgeInsets.only(top: 5, bottom: 5, left: 15, right: 15),
      child: Column(
        children: [Text(checkin.review)],
      ),
    );
  }

  Widget whoItPosted(Checkin checkin) {
    return Padding(
      padding: const EdgeInsets.only(),
      child: Column(
        children: [
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: UserAvatar(
                  radius: UserAvatar.s,
                  user: checkin.user,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(
                      context,
                      ProfilePage.routeName,
                      arguments: checkin.user,
                    ),
                    child: Text(
                      '${checkin.user.firstName} ${checkin.user.lastName}',
                    ),
                  ),
                  TimeAgo(
                    date: checkin.postedAt,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget imageTop(checkin) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 0,
        left: 0,
        right: 0,
      ),
      child: Stack(
        children: <Widget>[
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 300,
            child: Image.network(
              'https://slijterijbartels.nl/wp-content/uploads/2019/04/Zwolse-Whiskys.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            width: MediaQuery.of(context).size.width / 3,
            height: 35,
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.black,
                    Colors.black12,
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            bottom: 0,
            width: MediaQuery.of(context).size.width,
            height: 100,
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.black,
                    Colors.black12,
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            left: 10,
            bottom: 10,
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      checkin.whisky.name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1,
                      ),
                    ),
                    Text(
                      checkin.whisky.name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget dividerForComments() {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 5,
      ),
      child: Container(
        alignment: Alignment.centerLeft,
        child: const Divider(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final checkin = ModalRoute.of(context)!.settings.arguments as Checkin;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        title: Text(
          checkin.whisky.name,
          style: const TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.orange,
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        elevation: 0,
        child: _bottomComment(checkin.id),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            imageTop(checkin),
            whoItPosted(checkin),
            content(checkin),
            dividerForComments(),
            Padding(
              padding: const EdgeInsets.only(bottom: 5, left: 15),
              child: Container(
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Cheers & comments',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: CommentList(
                pagingController: _pagingController,
                checkinId: checkin.id,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
