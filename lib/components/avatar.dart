import 'package:flutter/material.dart';
import 'package:project_fab/models/user.dart';
import 'package:project_fab/pages/profile/profile_page.dart';

class UserAvatar extends StatelessWidget {
  final User user;
  final double size;
  static const big = 50.0;
  static const small = 20.0;

  const UserAvatar({
    Key? key,
    required this.user,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _getFontSize() {
      final size = this.size;

      if (size == UserAvatar.big) {
        return 20.0;
      }

      return 15.0;
    }

    return GestureDetector(
      onTap: () => Navigator.pushNamed(
        context,
        ProfilePage.routeName,
        arguments: user,
      ),
      child: CircleAvatar(
        radius: size,
        backgroundColor: Colors.black,
        child: Text(
          'me',
          style: TextStyle(
            color: Colors.white,
            fontSize: _getFontSize(),
          ),
        ),
      ),
    );
  }
}
