import 'package:flutter/material.dart';
import 'package:project_fab/config.dart';
import 'package:project_fab/models/models.dart';
import 'package:project_fab/pages/add_checkin.dart';
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
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: _createBody(context),
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
        ),
      ),
    );
  }
}

Widget _createBody(BuildContext context) {
  return FutureBuilder(
    future: CheckinService.getCheckinsWithCaching(),
    builder: (context, AsyncSnapshot<List<Checkin>> snapshot) {
      if (snapshot.hasData) {
        return RefreshIndicator(
          // onRefresh:() async => setState(() {})
          onRefresh: () async => null,
          child: ListView.separated(
            separatorBuilder: (context, idx) => const Divider(),
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              // print(snapshot.data![index]);
              var item = snapshot.data![index];

              return ListTile(
                  leading: CircleAvatar(
                    child: Text(
                      item.id.toString(),
                    ),
                  ),
                  title: Text(item.whisky.name),
                  subtitle: Text(item.whisky.bottler?.name ?? ''));
            },
          ),
        );
      }
      if (snapshot.hasError) {
        return Center(child: Text(snapshot.error.toString()));
      }
      return const Center(child: CircularProgressIndicator());
    },
  );
}
