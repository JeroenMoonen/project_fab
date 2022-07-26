import 'package:flutter/material.dart';

class PeoplePage extends StatelessWidget {
  static const routeName = '/people';
  const PeoplePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('People'),
      ),
      body: ListView(
        children: const <Widget>[
          Text('People'),
        ],
      ),
    );
  }
}
