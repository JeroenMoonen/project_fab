import 'package:flutter/material.dart';

class DiscoverPage extends StatelessWidget {
  static const routeName = '/discover';
  const DiscoverPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Discover'),
      ),
      body: ListView(
        children: const <Widget>[
          Text('Discover'),
        ],
      ),
    );
  }
}
