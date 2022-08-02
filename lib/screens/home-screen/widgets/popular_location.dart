import 'package:devcademy_flutter/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../../assets.dart';
import '../../../theme.dart';

class PopularLocation extends StatefulWidget {
  final String name;
  const PopularLocation({this.name = 'Not Specified', Key? key})
      : super(key: key);

  @override
  State<PopularLocation> createState() => _PopularLocationState();
}

class _PopularLocationState extends State<PopularLocation> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
          ),
          child: Image.asset(Assets.images.getImage(widget.name)),
        ),
        Container(
          width: 158,
          height: 155,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromRGBO(0, 0, 0, 0.38),
                  Color.fromRGBO(255, 255, 255, 0)
                ]),
          ),
        ),
        Positioned(
          top: 20,
          left: 20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.name,
                style: textTheme.bodyText1!.merge(const TextStyle(
                  color: Colors.white,
                )),
              ),
              Text(
                '12,654  properties',
                style: textTheme.bodyText2!.merge(const TextStyle(
                  color: Colors.white,
                )),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
