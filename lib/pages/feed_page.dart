import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:project_fab/config.dart';
import 'package:project_fab/models/models.dart';
import 'package:project_fab/pages/checkin/add_checkin.dart';
import 'package:project_fab/pages/onboarding/login_page.dart';
import 'package:project_fab/services/authentication_service.dart';
import 'package:project_fab/services/checkin_service.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({Key? key}) : super(key: key);

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.orange,
        elevation: 0,
        title: const Text(
          'From A Bottle',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
      ),
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            const SizedBox(
              height: 0,
            ),
            Expanded(
              child: Container(
                child: _createBody(context),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
        backgroundColor: primaryColor,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute<void>(
              builder: (context) => const AddCheckin(),
            ),
          );
        },
        tooltip: 'Add Activity',
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}

Widget _createBody(BuildContext context) {
  return FutureBuilder(
    future: CheckinService.getCheckinsWithCaching(),
    builder: (context, AsyncSnapshot<List<Checkin>?> snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return const Center(child: CircularProgressIndicator());
      }
      if (snapshot.connectionState == ConnectionState.done) {
        if (snapshot.hasError) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Navigator.popAndPushNamed(context, '/login');
          });

          return Center(
            child: Text(
              snapshot.error.toString(),
            ),
          );
        }
      }

      if (snapshot.hasData && snapshot.data!.isNotEmpty) {
        return RefreshIndicator(
          // onRefresh:() async => setState(() {})
          onRefresh: () async => null,
          child: ListView.separated(
            separatorBuilder: (context, idx) => const Divider(),
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              var item = snapshot.data![index];
              return _buildItem(item: item, context: context);
            },
          ),
        );
      }

      // Empty container.
      return const Center(
        child: Text('First add some friends to see what they\'re drinking.'),
      );
    },
  );
}

Widget _buildItem({item, context}) {
  return Column(
    children: [
      Container(
        // color: Colors.yellow,
        padding: const EdgeInsets.fromLTRB(15, 0, 15, 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              '${item.user.firstName} ${item.user.lastName}',
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black,
                fontWeight: FontWeight.w400,
              ),
            ),
            const Text(
              '[location name]',
              style: TextStyle(
                fontSize: 14,
                color: Colors.black,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
      Container(
        padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              item.whisky.name,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
      Container(
        color: Colors.cyan,
        height: 210,
        width: MediaQuery.of(context).size.width,
        child: const Center(
          child: Text(
            "Image here",
            textAlign: TextAlign.center,
          ),
        ),
        //Image.asset('assets/pic${imgUrl[index + 4]}', fit: BoxFit.cover)
      ),
      const SizedBox(height: 5),
      Container(
        height: 30,
        // color: Colors.yellow,
        padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const <Widget>[
            Icon(
              Icons.comment_outlined,
              // size: 22,
              color: Colors.black,
            ),
            Icon(
              Icons.favorite_outline,
              // size: 22,
              color: Colors.black,
            ),
            // const SizedBox(
            //   width: 50,
            //   child: Icon(
            //     Icons.bookmark,
            //     size: 22,
            //     color: Colors.black,
            //   ),
            // )
          ],
        ),
      ),
      const Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text(
              '198,459 likes',
              style: TextStyle(
                fontSize: 11,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          )),
      const SizedBox(height: 3),
      Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Row(
              children: const [
                Text('hello',
                    style: TextStyle(
                        fontSize: 13,
                        color: Colors.white,
                        fontWeight: FontWeight.w800)),
                SizedBox(width: 8),
                Text(
                  'hello2',
                  style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
              ],
            ),
          )),
      const SizedBox(height: 5),
      const Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text(
              'View all 5980 comments',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ))
    ],
  );

  // return ListTile(
  //   leading: CircleAvatar(
  //     child: Text(
  //       item.id.toString(),
  //     ),
  //   ),
  //   title: Text(item.whisky.name),
  //   subtitle: Text(item.whisky.bottler?.name ?? ''),
  // );
}
