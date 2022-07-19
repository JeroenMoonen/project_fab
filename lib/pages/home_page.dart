import 'package:flutter/material.dart';
import 'package:project_fab/pages/feed_page.dart';
import 'package:project_fab/pages/people_page.dart';
import 'package:project_fab/pages/profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PageController _pageController;
  int _activePageIndex = 0;

  @override
  void initState() {
    _pageController = PageController();

    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  //todo: check if we have a token in our storage. If not: show login page.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _activePageIndex = index;
          });
        },
        children: const [
          FeedPage(),
          PeoplePage(),
          ProfilePage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          _pageController.jumpToPage(index);
          setState(() {
            _activePageIndex = index;
          });
        },
        currentIndex: _activePageIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'people',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'profile',
          ),
        ],
      ),
    );

    // final samples = [
    //   Sample(
    //     'Login page',
    //     'Inlogpagina',
    //     Icons.home,
    //     () => Navigator.of(context).push<void>(MaterialPageRoute(
    //       builder: (c) => const LoginPage(),
    //     )),
    //   ),
    //   Sample(
    //     'Feed page',
    //     'Feed',
    //     Icons.home,
    //     () => Navigator.of(context).push<void>(MaterialPageRoute(
    //       builder: (c) => const FeedPage(),
    //     )),
    //   ),
    //   Sample(
    //     'Register page',
    //     'Registreer page',
    //     Icons.home,
    //     () => Navigator.of(context).push<void>(MaterialPageRoute(
    //       builder: (c) => const RegisterPage(),
    //     )),
    //   ),
    //   Sample(
    //     'Forgot password page',
    //     'Wachtwoord vergeten page',
    //     Icons.home,
    //     () => Navigator.of(context).push<void>(MaterialPageRoute(
    //       builder: (c) => const ForgotPasswordPage(),
    //     )),
    //   ),
    // ];

    // return Scaffold(
    //   appBar: AppBar(
    //     title: const Text(
    //       appName,
    //     ),
    //   ),
    //   body:
    //       ListView(children: samples.map((s) => SampleItem(item: s)).toList()),
    // );
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
