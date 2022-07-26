import 'package:flutter/material.dart';
import 'package:project_fab/models/user.dart';
import 'package:project_fab/pages/onboarding/login_page.dart';
import 'package:project_fab/services/authentication_service.dart';
import 'package:project_fab/services/user_service.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late Future<User> futureUser;

  @override
  void initState() {
    super.initState();
    futureUser = UserService.getMe();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.orange,
        // title: const Text('Profile'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.logout,
              color: Colors.white,
            ),
            onPressed: () {
              AuthenticationService.logout();

              Navigator.pushNamedAndRemoveUntil(
                context,
                '/login',
                (_) => false,
              );

              var snackBar = const SnackBar(
                content: Text('Succesfully logged out.'),
              );

              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
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

  Widget _buildBody(User data) {
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
              // const Positioned(
              //   top: 10,
              //   right: 30,
              //   child: Icon(
              //     Icons.settings,
              //     color: Colors.white,
              //   ),
              // ),
              Column(
                children: <Widget>[
                  Container(
                    height: 90,
                    margin: const EdgeInsets.only(top: 60),
                    child: const CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.white,
                      child: Text('plaatje'),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(4),
                  ),
                  Text(
                    '${data.firstName.toString()} ${data.lastName.toString()}',
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
                    "Whisky kenner",
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
                                padding: EdgeInsets.only(top: 15, bottom: 5),
                                child: const Text(
                                  "Check-ins",
                                  style: TextStyle(
                                    color: Colors.black54,
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(bottom: 15),
                                child: Text(
                                  '${data.checkinCount}',
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
                                  "${data.friendsCount}",
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
                  // UserInfo()
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
