import 'package:devcademy_flutter/router.dart';
import 'package:flutter/material.dart';
import '../../theme.dart';

class MyBottomNavBar extends StatefulWidget {
  final int currentIndex;

  const MyBottomNavBar({required this.currentIndex, Key? key})
      : super(key: key);

  @override
  State<MyBottomNavBar> createState() => _MyBottomNavBarState();
}

class _MyBottomNavBarState extends State<MyBottomNavBar> {
  List<String> routes = [Routes.homeScreen, Routes.myBookings, Routes.myPlaces];

  _onTapped(int index) {
    if (widget.currentIndex != index) router.navigateTo(context, routes[index]);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.12),
              offset: Offset(0, 3),
              spreadRadius: 2,
              blurRadius: 14),
          BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.14),
              offset: Offset(0, 8),
              spreadRadius: 1,
              blurRadius: 10),
          BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.2),
              offset: Offset(0, 5),
              spreadRadius: -3,
              blurRadius: 5),
        ],
      ),
      child: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'My Bookings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.place),
            label: 'My Places',
          ),
        ],
        currentIndex: widget.currentIndex,
        selectedItemColor: ThemeColors.mint500,
        selectedLabelStyle: textTheme.caption,
        enableFeedback: false,
        onTap: _onTapped,
      ),
    );
  }
}
