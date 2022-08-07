import 'package:flutter/material.dart';
import 'package:devcademy_flutter/theme.dart';

class FeatureHeader extends StatelessWidget {
  final String title;
  const FeatureHeader({this.title = 'Default Title', Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10, left: 25, right: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: textTheme.headline5!
                .merge(const TextStyle(color: Colors.black)),
          ),
          TextButton(
            onPressed: () {},
            child: Text('VIEW MORE',
                style: textTheme.button!.merge(TextStyle(
                  color: ThemeColors.mint400,
                ))),
          )
        ],
      ),
    );
  }
}
