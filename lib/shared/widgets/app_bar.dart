import 'package:devcademy_flutter/shared/widgets/my_actions.dart';
import 'package:flutter/material.dart';
import 'package:devcademy_flutter/theme.dart';

class MyAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String name;
  final List<CustomAction>? actions;
  final Widget? leading;
  const MyAppBar({this.leading, this.name = "", this.actions, Key? key})
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
        leading: widget.leading,
        title: Text(
          widget.name,
          style:
              textTheme.headline6!.merge(TextStyle(color: ThemeColors.teal800)),
        ),
        actions: widget.actions,
      ),
    );
  }
}
