import 'package:flutter/material.dart';
import 'package:project_fab/models/user.dart';
import 'package:project_fab/pages/profile/profile_page.dart';

class UserAvatar extends StatelessWidget {
  final User user;
  final double radius;
  static const l = 50.0;
  static const s = 20.0;
  static const xs = 15.0;

  const UserAvatar({
    Key? key,
    required this.user,
    required this.radius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _getFontSize() {
      final radius = this.radius;

      if (radius == UserAvatar.xs) {
        return 10.0;
      }
      if (radius == UserAvatar.s) {
        return 15.0;
      }
      if (radius == UserAvatar.l) {
        return 25.0;
      }

      return 30.0;
    }

    return GestureDetector(
      onTap: () => Navigator.pushNamed(
        context,
        ProfilePage.routeName,
        arguments: user,
      ),
      child: CircleAvatar(
        radius: radius,
        backgroundColor: Colors.black,
        child: Text(
          '${user.firstName![0]}${user.lastName![0]}',
          style: TextStyle(
            color: Colors.white,
            fontSize: _getFontSize(),
          ),
        ),
      ),
    );
  }
}
