import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';

import '../../../assets.dart';
import '../../../theme.dart';

class GuestsLove extends StatefulWidget {
  final String name;
  final String location;
  final int price;
  final int rating;
  final String image;

  const GuestsLove(
      {this.name = "Default Appartment",
      this.location = 'Zadar',
      this.price = 0,
      this.rating = 1,
      this.image = "",
      Key? key})
      : super(key: key);

  @override
  State<GuestsLove> createState() => _GuestsLoveState();
}

class _GuestsLoveState extends State<GuestsLove> {
  createRating() {
    var stars = <Icon>[];

    for (var i = 0; i < widget.rating; i++) {
      stars.add(Icon(
        Icons.star,
        color: ThemeColors.coral400,
      ));
    }
    return stars;
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 6.0),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Image.asset(widget.image),),
          ),
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Text(widget.name,
                style: textTheme.bodyText1!
                    .merge(const TextStyle(color: Colors.black)),
                textAlign: TextAlign.left),
          ),
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(widget.location,
                  style: textTheme.bodyText2!
                      .merge(TextStyle(color: ThemeColors.gray300)),
                  textAlign: TextAlign.left),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text('EUR ${widget.price}',
                  style: textTheme.bodyText1!
                      .merge(const TextStyle(color: Colors.black)),
                  textAlign: TextAlign.left),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(6),
            child: Row(
              children: [
                Icon(
                  Icons.star,
                  color: ThemeColors.coral400,
                ),
                Icon(
                  Icons.star,
                  color: ThemeColors.coral400,
                ),
                Icon(
                  Icons.star,
                  color: ThemeColors.coral400,
                ),
                Icon(
                  Icons.star,
                  color: ThemeColors.coral400,
                ),
                Icon(
                  Icons.star,
                  color: ThemeColors.coral400,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
