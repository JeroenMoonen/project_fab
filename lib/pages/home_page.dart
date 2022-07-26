import 'package:flutter/material.dart';
import 'package:project_fab/pages/discover/discover_page.dart';
import 'package:project_fab/pages/feed_page.dart';
import 'package:project_fab/pages/people/people_page.dart';
import 'package:project_fab/pages/profile/profile_page.dart';

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
          DiscoverPage(),
          PeoplePage(),
          ProfilePage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 12,
        // unselectedFontSize: 13,
        onTap: (index) {
          _pageController.jumpToPage(index);
          setState(() {
            _activePageIndex = index;
          });
        },
        currentIndex: _activePageIndex,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'discover',
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
  }
}
