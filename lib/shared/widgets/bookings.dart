import 'package:devcademy_flutter/http.dart';
import 'package:devcademy_flutter/shared/models/accomodation.dart';
import 'package:devcademy_flutter/shared/models/reservations.dart';
import 'package:devcademy_flutter/shared/utils/basic_utils.dart';
import 'package:devcademy_flutter/theme.dart';
import 'package:flutter/material.dart';

class Bookings extends StatelessWidget {
  final Reservation reservation;
  const Bookings({required this.reservation, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: http.getAccomodation(reservation.homesAllId),
      builder: ((BuildContext context, AsyncSnapshot snapshot) {
        BasicUtils.futureCheck(snapshot);

        Accomodation accomodation = snapshot.data;

        return Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Image.network(
                  accomodation.imageUrl,
                  width: 158,
                  height: 158,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 158,
                  child: Text(accomodation.title,
                      style: textTheme.bodyText1!
                          .merge(const TextStyle(color: Colors.black)),
                      textAlign: TextAlign.left),
                ),
                const SizedBox(
                  width: 8,
                  height: 8,
                ),
                Text(accomodation.location,
                    style: textTheme.bodyText2!
                        .merge(TextStyle(color: ThemeColors.gray300)),
                    textAlign: TextAlign.left),
                const SizedBox(
                  width: 8,
                  height: 8,
                ),
                Text(
                    '${BasicUtils.dM.format(reservation.checkIn)} - ${BasicUtils.dMY.format(reservation.checkOut)}',
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
                      BasicUtils.createRating(accomodation.categorization),
                )
              ],
            ),
          ],
        );
      }),
    );
  }
}
