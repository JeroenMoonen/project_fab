import 'package:flutter/material.dart';
import 'package:project_fab/pages/feed_page.dart';
import 'package:project_fab/pages/forgot_password_page.dart';
import 'package:project_fab/pages/login_page.dart';
import 'package:project_fab/pages/register_page.dart';
import 'package:project_fab/config.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  //todo: check if we have a token in our storage. If not: show login page.

  @override
  Widget build(BuildContext context) {
    final samples = [
      Sample(
        'Login page',
        'Inlogpagina',
        Icons.home,
        () => Navigator.of(context).push<void>(MaterialPageRoute(
          builder: (c) => const LoginPage(),
        )),
      ),
      Sample(
        'Feed page',
        'Feed',
        Icons.home,
        () => Navigator.of(context).push<void>(MaterialPageRoute(
          builder: (c) => const FeedPage(),
        )),
      ),
      Sample(
        'Register page',
        'Registreer page',
        Icons.home,
        () => Navigator.of(context).push<void>(MaterialPageRoute(
          builder: (c) => const RegisterPage(),
        )),
      ),
      Sample(
        'Forgot password page',
        'Wachtwoord vergeten page',
        Icons.home,
        () => Navigator.of(context).push<void>(MaterialPageRoute(
          builder: (c) => const ForgotPasswordPage(),
        )),
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          appName,
        ),
      ),
      body:
          ListView(children: samples.map((s) => SampleItem(item: s)).toList()),
    );
  }
}

class SampleItem extends StatelessWidget {
  const SampleItem({
    required this.item,
    Key? key,
  }) : super(key: key);
  final Sample item;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () => item.onTap(),
        child: ListTile(
          leading: Icon(item.icon),
          title: Text(
            item.title,
            style: Theme.of(context).textTheme.subtitle1,
          ),
          subtitle: Text(
            item.description,
            style: Theme.of(context).textTheme.subtitle2,
          ),
        ),
      ),
    );
  }
}

class Sample {
  const Sample(this.title, this.description, this.icon, this.onTap);
  final String title;
  final String description;
  final IconData icon;
  final Function onTap;
}
