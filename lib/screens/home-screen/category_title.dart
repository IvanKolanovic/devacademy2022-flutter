import 'package:flutter/material.dart';

import 'package:devcademy_flutter/theme.dart';

class CategoryTitle extends StatelessWidget {
  final String category;
  final VoidCallback onPressed;
  //final String route;

  const CategoryTitle({
    Key? key,
    required this.category,
    required this.onPressed
    //required this.route,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(19, 24, 0, 24),
          child: Text(category,
              style: textTheme.headline5!
                  .merge(TextStyle(color: ThemeColors.black))),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(0, 25, 19, 25),
          child: TextButton(
            style: TextButton.styleFrom(
              primary: ThemeColors.mint400,
              textStyle: textTheme.button,
            ),
            onPressed: onPressed,
            child: const Text('VIEW MORE'),
          ),
        ),
      ],
    );
  }
}
