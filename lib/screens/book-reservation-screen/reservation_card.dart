import 'package:devcademy_flutter/shared-widgets/starsbar.dart';
import 'package:flutter/material.dart';
import 'package:devcademy_flutter/theme.dart';

import '../../models/accommodation.dart';

class ReservationCard extends StatelessWidget {
  final Accommodation accommodation;

  const ReservationCard({
    Key? key,
    required this.accommodation,
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: ThemeColors.gray100),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: Image.network(
              accommodation.imageUrl,
              width: 134,
              height: 156,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(accommodation.title,
                  style: textTheme.bodyText1!
                    .merge(TextStyle(color: ThemeColors.black))),
                StarsBar(categorization: accommodation.categorization),
                Text(accommodation.accommodationType,
                  style: textTheme.bodyText2!
                    .merge(TextStyle(color: ThemeColors.teal800))),
                Text(accommodation.location,
                  style: textTheme.bodyText2!
                    .merge(TextStyle(color: ThemeColors.teal800))),
                Text(accommodation.postalCode,
                  style: textTheme.bodyText2!
                    .merge(TextStyle(color: ThemeColors.teal800))),
                Text('EUR ${accommodation.price} per night',
                  style: textTheme.bodyText2!
                    .merge(TextStyle(color: ThemeColors.teal800))),
              ],
            ),
          ),
        ],
      ),
    );
  }
}