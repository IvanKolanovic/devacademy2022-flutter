import 'package:devcademy_flutter/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomAction extends StatelessWidget {
  final void Function()? onPress;
  final Widget actionWidget;
  final String tooltip;
  const CustomAction(
      {required this.tooltip, this.onPress, required this.actionWidget, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      child: IconButton(
        onPressed: onPress,
        icon: actionWidget,
        tooltip: tooltip,
      ),
    );
  }
}
