import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:iconsax/iconsax.dart';
import 'package:moodinger/constants/constants.dart';
import 'package:moodinger/screens/activity_screen.dart';
import 'package:moodinger/screens/add_post_screen.dart';
import 'package:moodinger/screens/explore_screen.dart';
import 'package:moodinger/screens/home_screen.dart';
import 'package:moodinger/screens/profile_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedItem = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBody: true,
      bottomNavigationBar: _getBottomNavigation(),
      body: IndexedStack(
        index: _selectedItem,
        children: _getScreens(),
      ),
    );
  }

  List<Widget> _getScreens() {
    return <Widget>[
      HomeScreen(),
      ExploreScreen(),
      AddPostScreen(),
      ActivityScreen(),
      ProfileScreen(),
    ];
  }

  Widget _getBottomNavigation() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(14),
          topRight: Radius.circular(14),
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(14),
          topRight: Radius.circular(14),
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: blackColor,
          currentIndex: _selectedItem,
          onTap: (index) {
            setState(() {
              _selectedItem = index;
            });
          },
          selectedIconTheme: IconThemeData(
            color: primaryColor,
          ),
          unselectedIconTheme: IconThemeData(
            color: whiteColor,
          ),
          showUnselectedLabels: false,
          showSelectedLabels: false,
          items: [
            BottomNavigationBarItem(
              label: "",
              icon: Icon(
                Iconsax.home,
                size: 26,
              ),
            ),
            BottomNavigationBarItem(
              label: "",
              icon: Icon(
                Iconsax.search_normal_1,
                size: 26,
              ),
            ),
            BottomNavigationBarItem(
              label: "",
              icon: Icon(
                Iconsax.add_square,
                size: 26,
              ),
            ),
            BottomNavigationBarItem(
              label: "",
              icon: Icon(
                Iconsax.heart,
                size: 26,
              ),
            ),
            BottomNavigationBarItem(
              label: "",
              icon: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  "images/profile.png",
                  width: 26,
                ),
              ),
              activeIcon: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: primaryColor,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: EdgeInsets.all(1),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      "images/profile.png",
                      width: 22,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
