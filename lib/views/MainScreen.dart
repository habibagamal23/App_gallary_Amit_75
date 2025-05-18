import 'package:flutter/material.dart';
import 'package:gallerymobile/views/myHome.dart';

import 'UserProfile.dart';

class Mainscreen extends StatefulWidget {
  const Mainscreen({super.key});

  @override
  State<Mainscreen> createState() => _MainscreenState();
}

class _MainscreenState extends State<Mainscreen> {
  late PageController pageController;
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController = PageController();
  }
  int currentIndex = 0;

  void navigation(int index) {
    pageController.jumpToPage(index);
  }

  void onpageChange(int idex) {
    setState(() {
      currentIndex = idex;
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    pageController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        children: [MyHomePage(), MyHomePage(), MyHomePage()],
        onPageChanged: onpageChange,
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: navigation,
          selectedItemColor: Theme.of(context).primaryColor,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: 'Settings'),
          ]),
    );
  }
}
