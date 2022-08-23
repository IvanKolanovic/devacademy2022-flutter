import 'package:flutter/material.dart';

import 'package:devcademy_flutter/theme.dart';

import 'package:devcademy_flutter/assets.dart';

import 'package:flutter_svg/flutter_svg.dart';

import 'package:devcademy_flutter/screens/home-screen/home_screen.dart';
import 'package:devcademy_flutter/screens/my-bookings-screen/my_bookings_screen.dart';
import 'package:devcademy_flutter/screens/my-places-screen/my_places_screen.dart';


class BottomNavigationTabs extends StatefulWidget {
  const BottomNavigationTabs({Key? key}) : super(key: key);

  @override
  State<BottomNavigationTabs> createState() => _BottomNavigationTabsState();
}

class _BottomNavigationTabsState extends State<BottomNavigationTabs> {
  final List<Widget> _pages = [
    const HomeScreen(),
    const MyBookingsScreen(),
    const MyPlacesScreen(),
  ];

  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedPageIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: ThemeColors.white,
        selectedItemColor: ThemeColors.mint500,
        currentIndex: _selectedPageIndex,
        elevation: 8,
        items: [
          BottomNavigationBarItem(
            label: 'Home',
            icon: SvgPicture.asset(Assets.icons.home, color: ThemeColors.gray500,),
            activeIcon: SvgPicture.asset(Assets.icons.home, color: ThemeColors.mint500,),
          ),
          BottomNavigationBarItem(
            label: 'My bookings',
            icon: SvgPicture.asset(Assets.icons.list, color: ThemeColors.gray500,),
            activeIcon: SvgPicture.asset(Assets.icons.list, color: ThemeColors.mint500,),
          ),
          BottomNavigationBarItem(
            label: 'My places',
            icon: SvgPicture.asset(Assets.icons.places, color: ThemeColors.gray500,),
            activeIcon: SvgPicture.asset(Assets.icons.places, color: ThemeColors.mint500,),
          ),
        ]
      ),
    );
  }
}