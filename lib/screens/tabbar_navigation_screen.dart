import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '/screens/home_screen.dart';
import '/screens/openers_screen.dart';
import 'places_screen/places_screen.dart';

class TabbarNavigationScreen extends StatefulWidget {
  const TabbarNavigationScreen({Key? key}) : super(key: key);

  @override
  State<TabbarNavigationScreen> createState() => _TabbarNavigationScreenState();
}

class _TabbarNavigationScreenState extends State<TabbarNavigationScreen> {
  Color primaryColor = const Color.fromRGBO(60, 60, 60, 1);
  Color secondaryColor = const Color.fromRGBO(150, 150, 150, 1);

  int _page = 0;
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  void onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  void navigationTapped(int page) {
    pageController.jumpToPage(page);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        onPageChanged: onPageChanged,
        children: const [
          HomePage(),
          PlacesPage(),
          OpenersPage(),
          Center(child: Text("Climbers", style: TextStyle(fontSize: 20))),
          Center(child: Text("Account", style: TextStyle(fontSize: 20))),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(top: 24.0),
        child: CupertinoTabBar(
          backgroundColor: Colors.transparent,
          border: const Border(top: BorderSide(color: Colors.transparent)),
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: (_page == 0) ? primaryColor : secondaryColor,
              ),
              label: '',
              backgroundColor: primaryColor,
            ),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.list,
                  color: (_page == 1) ? primaryColor : secondaryColor,
                ),
                label: '',
                backgroundColor: primaryColor),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.lock_open,
                  color: (_page == 2) ? primaryColor : secondaryColor,
                ),
                label: '',
                backgroundColor: primaryColor),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.hiking,
                color: (_page == 3) ? primaryColor : secondaryColor,
              ),
              label: '',
              backgroundColor: primaryColor,
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                color: (_page == 4) ? primaryColor : secondaryColor,
              ),
              label: '',
              backgroundColor: primaryColor,
            ),
          ],
          onTap: navigationTapped,
          currentIndex: _page,
        ),
      ),
    );
  }
}
