import 'package:flutter/material.dart';
import 'package:project_fab/components/avatar.dart';
import 'package:project_fab/models/user.dart';
import 'package:project_fab/pages/onboarding/login_page.dart';
import 'package:project_fab/services/user_service.dart';

class ProfilePage extends StatefulWidget {
  static const routeName = '/profile';
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    super.initState();
  }

  _fetchUser() {
    return UserService.getMe();
  }

  void _onLogoutPressed() {
    Navigator.pushNamedAndRemoveUntil(
      context,
      LoginPage.routeName,
      (_) => false,
    );

    var snackBar = const SnackBar(
      content: Text('Succesfully logged out.'),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    late Future<User> futureUser = _fetchUser();

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.orange,
        //TODO: do not do this. The previous button is hidden then if redirected from other page.
        // leading: IconButton(
        //   icon: const Icon(
        //     Icons.settings,
        //     color: Colors.white,
        //   ),
        //   onPressed: () => Navigator.pushNamed(
        //     context,
        //     ProfileSettingsPage.routeName,
        //   ),
        // ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.logout,
              color: Colors.white,
            ),
            onPressed: _onLogoutPressed,
          ),
        ],
      ),
      body: Center(
        child: FutureBuilder<User>(
          future: futureUser,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final data = snapshot.data!;

              return _buildBody(data);
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }

            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }

  Widget _buildBody(User user) {
    return SafeArea(
      child: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                width: double.infinity,
                height: 330,
                color: Colors.orange,
              ),
              Column(
                children: <Widget>[
                  Container(
                    height: 90,
                    margin: const EdgeInsets.only(top: 60),
                    child: UserAvatar(
                      user: user,
                      radius: UserAvatar.l,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(4),
                  ),
                  Text(
                    '${user.firstName.toString()} ${user.lastName.toString()}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(4),
                  ),
                  const Text(
                    "Whisky expert",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 77),
                    padding: const EdgeInsets.all(10),
                    child: Card(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Container(
                                padding:
                                    const EdgeInsets.only(top: 15, bottom: 5),
                                child: const Text(
                                  "Check-ins",
                                  style: TextStyle(
                                    color: Colors.black54,
                                  ),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.only(bottom: 15),
                                child: Text(
                                  '${user.checkinCount}',
                                  style: const TextStyle(
                                    color: Colors.black87,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Container(
                                padding:
                                    const EdgeInsets.only(top: 15, bottom: 5),
                                child: const Text(
                                  "Friends",
                                  style: TextStyle(
                                    color: Colors.black54,
                                  ),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.only(bottom: 15),
                                child: Text(
                                  "${user.friendsCount}",
                                  style: const TextStyle(
                                    color: Colors.black87,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Container(
                                padding:
                                    const EdgeInsets.only(top: 10, bottom: 5),
                                child: const Text(
                                  "Followers",
                                  style: TextStyle(
                                    color: Colors.black54,
                                  ),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: const Text(
                                  "???",
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
