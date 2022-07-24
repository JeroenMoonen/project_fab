import 'package:flutter/material.dart';
import 'package:project_fab/pages/onboarding/login_page.dart';
import 'package:project_fab/services/authentication_service.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              AuthenticationService.logout();

              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (BuildContext context) => const LoginPage(),
                ),
              );

              var snackBar = const SnackBar(
                content: Text('Succesfully logged out.'),
              );

              ScaffoldMessenger.of(context).showSnackBar(snackBar);
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
