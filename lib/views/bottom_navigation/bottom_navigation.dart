
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:fresh_food/constants/app_constant.dart';
import 'package:fresh_food/views/Home_screen/home_screen.dart';
import 'package:fresh_food/views/Home_screen/select_plan_screen.dart';
import 'package:fresh_food/views/Home_screen/weeekly_plan_screen.dart';
import 'package:fresh_food/views/profile_screen/profile_screen.dart';


class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();
  FirebaseAuth auth = FirebaseAuth.instance;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: PageView(
        onPageChanged: (page) {
          setState(() {
            _selectedIndex = page;
          });
        },
        controller: _pageController,
        children:  const <Widget>[



         HomeScreen(),
         WeeklyPlan(),
         ProfileScreen(),

        ],
      ),


      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.grey.withAlpha(50),
              blurRadius: 5,
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          type: BottomNavigationBarType.fixed,
          onTap: _onTappedBar,
          selectedItemColor: appColor,

          showSelectedLabels: true,
          showUnselectedLabels: true,
          elevation: 5,
          items: [
            BottomNavigationBarItem(
              icon: Image.asset(
                'images/home.png',
                height: 25,
                width: 25,
                color: _selectedIndex == 0
                    ? appColor
                    : Colors.black,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'images/cutlery.png',
                height: 25,
                width: 25,
                color: _selectedIndex == 1
                    ? appColor
                    : Colors.black,
              ),
              label: 'Explore',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'images/profile.png',
                height: 25,
                width: 25,
                color: _selectedIndex == 2
                    ? appColor
                    : Colors.black,
              ),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }

  void _onTappedBar(int value) {
    setState(() {
      _selectedIndex = value;
    });
    _pageController.jumpToPage(value);
  }
}
