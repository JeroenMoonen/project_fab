import 'package:flutter/material.dart';
import 'package:project_fab/models/checkin.dart';

class CheckinDetailPage extends StatefulWidget {
  static const routeName = '/checkin';

  const CheckinDetailPage({Key? key}) : super(key: key);

  @override
  State<CheckinDetailPage> createState() => _CheckinDetailPageState();
}

class _CheckinDetailPageState extends State<CheckinDetailPage> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Checkin;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: <Widget>[
          Text('Id: ${args.id}'),
          Text('Whisky: ${args.whisky.name}'),
          Text('Posted at: ${args.postedAt}'),
        ],
      ),
    );
  }
}
