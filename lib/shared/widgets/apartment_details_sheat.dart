import 'package:devcademy_flutter/shared/models/accomodation.dart';
import 'package:devcademy_flutter/shared/utils/basic_utils.dart';
import 'package:devcademy_flutter/theme.dart';
import 'package:flutter/material.dart';

class DetailsSheat extends StatelessWidget {
  final Accomodation accomodation;
  const DetailsSheat({required this.accomodation, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, top: 36),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Center(
          child: SizedBox(
            width: 28,
            child: Divider(
              thickness: 3,
              color: ThemeColors.gray200,
            ),
          ),
        ),
        Text(accomodation.title,
            style: textTheme.headline6!
                .merge(const TextStyle(color: Colors.black)),
            textAlign: TextAlign.left),
        const SizedBox(
          width: 6,
          height: 6,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: BasicUtils.createRating(accomodation.categorization),
        ),
        const SizedBox(
          width: 10,
          height: 10,
        ),
        Text('Stay in the heart of ${accomodation.location}!',
            style: textTheme.bodyText2!
                .merge(TextStyle(color: ThemeColors.gray500)),
            textAlign: TextAlign.left),
        const SizedBox(
          width: 10,
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              Icons.calendar_today,
              color: ThemeColors.coral500,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
                accomodation.freeCancelation
                    ? 'Free cancellation available'
                    : 'Free cancellation not available',
                style: textTheme.bodyText2!
                    .merge(const TextStyle(color: Colors.black)),
                textAlign: TextAlign.left),
          ],
        ),
        const SizedBox(
          width: 15,
          height: 15,
        ),
        SizedBox(
          width: 336,
          child: Text(
            accomodation.shortDescription,
            style: textTheme.bodyText1!.merge(
              TextStyle(color: ThemeColors.teal800),
            ),
            textAlign: TextAlign.left,
          ),
        ),
        const SizedBox(
          width: 30,
          height: 30,
        ),
        SizedBox(
          width: 336,
          child: Text(
            accomodation.longDescription,
            style: textTheme.bodyText1!.merge(
              TextStyle(color: ThemeColors.teal800),
            ),
            textAlign: TextAlign.left,
          ),
        ),
        const SizedBox(
          width: 20,
          height: 20,
        ),
        SizedBox(
          width: 336,
          child: Text(
            "Property info:",
            style: textTheme.bodyText1!.merge(
              const TextStyle(color: Colors.black),
            ),
            textAlign: TextAlign.left,
          ),
        ),
        const SizedBox(
          width: 16,
          height: 16,
        ),
        FittedBox(
          fit: BoxFit.fitWidth,
          child: Text(
            '${accomodation.capacity} guests',
            style: textTheme.bodyText2!.merge(
              TextStyle(color: ThemeColors.teal800),
            ),
            textAlign: TextAlign.left,
          ),
        ),
        const SizedBox(
          width: 10,
          height: 10,
        ),
        FittedBox(
          fit: BoxFit.fitWidth,
          child: Text(
            accomodation.accommodationType,
            style: textTheme.bodyText2!.merge(
              TextStyle(color: ThemeColors.teal800),
            ),
            textAlign: TextAlign.left,
          ),
        ),
        const SizedBox(
          width: 10,
          height: 10,
        ),
        FittedBox(
          fit: BoxFit.fitWidth,
          child: Text(
            'EUR ${accomodation.price} per night',
            style: textTheme.bodyText2!.merge(
              TextStyle(color: ThemeColors.teal800),
            ),
            textAlign: TextAlign.left,
          ),
        ),
        const SizedBox(
          width: 10,
          height: 10,
        ),
        FittedBox(
          fit: BoxFit.fitWidth,
          child: Text(
            accomodation.location,
            style: textTheme.bodyText2!.merge(
              TextStyle(color: ThemeColors.teal800),
            ),
            textAlign: TextAlign.left,
          ),
        ),
        const SizedBox(
          width: 10,
          height: 10,
        ),
        FittedBox(
          fit: BoxFit.fitWidth,
          child: Text(
            accomodation.postalCode,
            style: textTheme.bodyText2!.merge(
              TextStyle(color: ThemeColors.teal800),
            ),
            textAlign: TextAlign.left,
          ),
        ),
         const SizedBox(
          width: 10,
          height: 60,
        ),
      ]),
    );
  }
}
