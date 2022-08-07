import 'package:devcademy_flutter/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomAction extends StatelessWidget {
  final void Function()? onPress;
  final Icon icon;
  final String tooltip;
  const CustomAction(
      {required this.tooltip, this.onPress, required this.icon, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPress,
      icon: icon,
      tooltip: tooltip,
    );
  }
}
