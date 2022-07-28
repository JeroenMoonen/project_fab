import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

class TimeAgo extends StatelessWidget {
  final DateTime date;
  const TimeAgo({Key? key, required this.date}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      timeago.format(
        date,
        locale: 'en',
        allowFromNow: false,
      ),
      style: const TextStyle(
        color: Colors.black54,
        fontSize: 12,
      ),
    );
  }
}
