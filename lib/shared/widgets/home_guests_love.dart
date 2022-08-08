import 'package:devcademy_flutter/shared/models/accomodation.dart';
import 'package:devcademy_flutter/shared/utils/basic_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';

import '../../../assets.dart';
import '../../../theme.dart';

class GuestsLove extends StatefulWidget {
  final Accomodation accomodation;

  const GuestsLove({required this.accomodation, Key? key}) : super(key: key);

  @override
  State<GuestsLove> createState() => _GuestsLoveState();
}

class _GuestsLoveState extends State<GuestsLove> {
  createRating() {
    var stars = <Icon>[];

    for (var i = 0; i < widget.accomodation.categorization; i++) {
      stars.add(Icon(
        Icons.star,
        color: ThemeColors.coral400,
      ));
    }
    return stars;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 6.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Image.network(
                widget.accomodation.imageUrl,
                width: 158,
                height: 158,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            width: 8,
            height: 8,
          ),
          Text(widget.accomodation.title,
              style: textTheme.bodyText1!
                  .merge(const TextStyle(color: Colors.black)),
              textAlign: TextAlign.left),
          const SizedBox(
            width: 8,
            height: 8,
          ),
          Text(widget.accomodation.location,
              style: textTheme.bodyText2!
                  .merge(TextStyle(color: ThemeColors.gray300)),
              textAlign: TextAlign.left),
          const SizedBox(
            width: 8,
            height: 8,
          ),
          Text('EUR ${widget.accomodation.price}',
              style: textTheme.bodyText1!
                  .merge(const TextStyle(color: Colors.black)),
              textAlign: TextAlign.left),
          const SizedBox(
            width: 8,
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children:
                BasicUtils.createRating(widget.accomodation.categorization),
          )
        ],
      ),
    );
  }
}
