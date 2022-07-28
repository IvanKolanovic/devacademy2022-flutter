import 'package:flutter/material.dart';
import '../../theme.dart';

class MyAppBar extends StatefulWidget implements PreferredSizeWidget {
  const MyAppBar({Key? key})
      : preferredSize = const Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  final Size preferredSize;

  @override
  MyAppBarState createState() => MyAppBarState();
}

class MyAppBarState extends State<MyAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(boxShadow: [
        BoxShadow(
            color: Color.fromRGBO(205, 205, 205, 0.25),
            offset: Offset(0, 4),
            blurRadius: 4)
      ]),
      child: AppBar(
        title: Text(
          "Staycation",
          style:
              textTheme.headline6!.merge(TextStyle(color: ThemeColors.teal800)),
        ),
        actions: [
          IconButton(
            onPressed: null,
            icon: Icon(
              Icons.search,
              color: ThemeColors.teal800,
            ),
            tooltip: 'Search',
          ),
          IconButton(
            onPressed: null,
            icon: Icon(
              Icons.more_vert,
              color: ThemeColors.teal800,
            ),
            tooltip: 'More',
            color: ThemeColors.teal800,
          )
        ],
      ),
    );
  }
}
