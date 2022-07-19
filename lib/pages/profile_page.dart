import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              print('Go to settings page');
            },
          ),
        ],
      ),
      body: ListView(
        children: const <Widget>[
          Text('Profile:'),
          Text('Add checkin count here'),
          Text('Show profile image here'),
          Text('Add date of creation here.'),
        ],
      ),
    );
  }
}
