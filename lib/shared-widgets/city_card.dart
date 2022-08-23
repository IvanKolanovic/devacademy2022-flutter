import 'package:flutter/material.dart';

import 'package:devcademy_flutter/theme.dart';

import 'package:devcademy_flutter/models/location.dart';

class CityCards extends StatelessWidget {
  final Location locationCard;
  final VoidCallback? onPressed;

  const CityCards({
    Key? key,
    required this.locationCard,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          image: DecorationImage(
            image: NetworkImage(locationCard.imageUrl,
            ),
            fit: BoxFit.cover,
          ),
        ),
        width: 158,
        height: 155,
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
        //color: Colors.teal[100],
        child: Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              gradient: LinearGradient(
                  colors: [
                    ThemeColors.black.withOpacity(0.38),
                    ThemeColors.white.withOpacity(0),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: const [0.0, 1.0],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8, 16, 0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(locationCard.locationName,
                      style: textTheme.bodyText1!
                          .merge(TextStyle(color: ThemeColors.white))),
                  const SizedBox(width: 50),
                  Text('${locationCard.properties} properties',
                      style: textTheme.bodyText2!
                          .merge(TextStyle(color: ThemeColors.white))),
                ],
              ),
            )),
      ),
    );
  }
}
