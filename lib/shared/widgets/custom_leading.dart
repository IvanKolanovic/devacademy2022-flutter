import 'package:devcademy_flutter/router.dart';
import 'package:devcademy_flutter/theme.dart';
import 'package:flutter/material.dart';

class CustomLeading extends StatelessWidget {
  final String tooltip;
  final Icon icon;
  final Color? color;
  const CustomLeading(
      {this.color, required this.icon, required this.tooltip, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (BuildContext context) {
      return IconButton(
        icon: icon,
        onPressed: () => router.goBack(context),
        tooltip: tooltip,
        color: color ?? ThemeColors.teal800,
        enableFeedback: false,
      );
    });
  }
}
