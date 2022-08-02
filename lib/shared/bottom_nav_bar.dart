import 'package:flutter/material.dart';
import '../../theme.dart';

class MyBottomNavBar extends StatefulWidget {
  const MyBottomNavBar({Key? key}) : super(key: key);

  @override
  State<MyBottomNavBar> createState() => _MyBottomNavBarState();
}

class _MyBottomNavBarState extends State<MyBottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.2),
              offset: Offset(0, -5),
              blurRadius: 5),
          BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.14),
              offset: Offset(0, 8),
              blurRadius: 10),
          BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.12),
              offset: Offset(0, 3),
              blurRadius: 14),
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
        currentIndex: 0,
        selectedItemColor: ThemeColors.mint500,
        selectedLabelStyle: textTheme.caption,
        onTap: null,
      ),
    );
  }
}
