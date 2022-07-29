import 'package:flutter/material.dart';
import 'package:project_fab/components/avatar.dart';
import 'package:project_fab/components/comment.dart';
import 'package:project_fab/components/input.dart';
import 'package:project_fab/components/time_ago.dart';
import 'package:project_fab/models/checkin.dart';
import 'package:project_fab/models/comment.dart';
import 'package:project_fab/pages/profile/profile_page.dart';
import 'package:project_fab/services/comment_service.dart';

class CheckinDetailPage extends StatefulWidget {
  static const routeName = '/checkin';

  const CheckinDetailPage({Key? key}) : super(key: key);

  @override
  State<CheckinDetailPage> createState() => _CheckinDetailPageState();
}

class _CheckinDetailPageState extends State<CheckinDetailPage> {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  Future<List<Comment>> _fetchComments(checkinId) async {
    return await CommentService.getComments(checkinId);
  }

  Widget _bottomComment() {
    return makeInput(
      label: 'Leave a comment',
      onTap: () => {},
      controller: null,
    );
  }

  Future<void> _refreshComments() async {
    //TODO
  }

  Widget comments(checkinId) {
    return FutureBuilder<List<Comment>>(
      future: _fetchComments(checkinId),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const CircularProgressIndicator(),
              const SizedBox(
                height: 30,
              ),
              Visibility(
                visible: snapshot.hasData,
                child: const Text('Loading..'),
              )
            ],
          );
        } else if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return const Text('Error');
          } else if (snapshot.hasData) {
            return ListView.builder(
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return CommentItem(comment: snapshot.data[index]);
              },
            );
          }

          return const Text('There are no comments yet. Be the first one!');
        } else {
          return Text('State: ${snapshot.connectionState}');
        }
      },
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
    ;
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
        child: _bottomComment(),
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
            comments(checkin.id),
          ],
        ),
      ),
    );
  }
}
