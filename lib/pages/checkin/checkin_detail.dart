import 'package:flutter/material.dart';

class CheckinDetail extends StatefulWidget {
  final int checkinId;
  const CheckinDetail({Key? key, required this.checkinId}) : super(key: key);

  @override
  State<CheckinDetail> createState() => _CheckinDetailState();
}

class _CheckinDetailState extends State<CheckinDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Text('Checkin detail here! {$this.checkinId}'),
    );
  }
}
