import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:devcademy_flutter/assets.dart';


class StarsBar extends StatelessWidget {
  final int categorization;
  
  const StarsBar({
    Key? key,
    required this.categorization
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ...List<Widget>.generate(
          categorization,
          (index) => SvgPicture.asset(Assets.icons.star),
        ),
      ],
    );
  }
}

