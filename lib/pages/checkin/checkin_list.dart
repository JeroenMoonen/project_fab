import 'package:flutter/material.dart';
import 'package:project_fab/models/checkin.dart';
import 'package:project_fab/pages/checkin/checkin_item.dart';
import 'package:project_fab/services/checkin_service.dart';

class CheckinList extends StatefulWidget {
  final Key refreshIndicatorKey;
  final int? userId;

  const CheckinList({
    Key? key,
    this.userId,
    required this.refreshIndicatorKey,
  }) : super(key: key);

  @override
  State<CheckinList> createState() => _CheckinListState();
}

class _CheckinListState extends State<CheckinList> {
  late List<Checkin> _checkinList;
  late Future<void> _initCheckinData;

  @override
  void initState() {
    super.initState();
    _initCheckinData = _initCheckins();
  }

  Future<void> _initCheckins() async {
    final List<Checkin> checkins =
        await CheckinService.getCheckinsWithCaching();

    _checkinList = checkins;
  }

  Future<void> _onRefreshCheckins() async {
    final checkins = await CheckinService.getCheckinsWithCaching();
    setState(() {
      _checkinList = checkins;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initCheckinData,
      builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
          case ConnectionState.active:
            return const Center(
              child: CircularProgressIndicator(),
            );
          case ConnectionState.done:
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }
            return RefreshIndicator(
              key: widget.refreshIndicatorKey,
              onRefresh: _onRefreshCheckins,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: _checkinList.length,
                itemBuilder: (context, index) {
                  return CheckinItem(
                    _checkinList[index],
                    index,
                    context,
                  );
                },
              ),
            );
        }
      },
    );
  }
}
