import 'package:flutter/material.dart';

import 'package:devcademy_flutter/theme.dart';

import 'package:devcademy_flutter/shared-widgets/starsbar.dart';

import 'package:devcademy_flutter/models/accommodation.dart';
import 'package:devcademy_flutter/models/reservation.dart';

import 'package:intl/intl.dart';

class AcommodationCards extends StatelessWidget {
  final Accommodation house;
  final bool showSideToSide;
  final bool isMyPlace;
  final Reservation? booking;
  final VoidCallback? onPressed;

  const AcommodationCards({
    Key? key,
    required this.house,
    this.showSideToSide = false,
    this.isMyPlace = false,
    this.booking,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var newBooking;
    var months;

    if (booking != null) {
      newBooking = booking!;

      months = {
        1: 'Jan',
        2: 'Feb',
        3: 'Mar',
        4: 'Apr',
        5: 'May',
        6: 'Jun',
        7: 'Jul',
        8: 'Aug',
        9: 'Sep',
        10: 'Oct',
        11: 'Nov',
        12: 'Dec',
      };
    }

    return InkWell(
      onTap: onPressed,
      child: Flex(
        direction: showSideToSide ? Axis.horizontal : Axis.vertical,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: showSideToSide ? const EdgeInsets.fromLTRB(10, 10, 0, 10) : const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: 
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  house.imageUrl,
                  width: showSideToSide ? 158 : 187,
                  height: showSideToSide ? 158 : 154,
                  fit: BoxFit.cover,
                ),
              ),
          ),
          showSideToSide ? const SizedBox(width: 20) : const SizedBox(width: 0),
          Container(
            padding: showSideToSide ? const EdgeInsets.fromLTRB(0, 10, 0, 0) : const EdgeInsets.fromLTRB(10, 0, 0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 8),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: Text(house.title,
                      style: textTheme.bodyText1!
                          .merge(TextStyle(color: ThemeColors.black))),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: Text(house.location,
                      style: textTheme.bodyText2!
                          .merge(TextStyle(color: ThemeColors.gray300))),
                ),
                const SizedBox(height: 8),
                
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: isMyPlace ? Text('Renting the entire unit', style: textTheme.bodyText1!.merge(TextStyle(color: ThemeColors.teal800)))
                                   : booking == null ? Text('EUR ${house.price}', style: textTheme.bodyText1!.merge(TextStyle(color: ThemeColors.teal800)))
                                                     : Text('${DateFormat('dd MMMM').format(newBooking.checkIn)} - ${DateFormat('dd MMMM y').format(newBooking.checkOut)}',
                                                            style: textTheme.bodyText1!.merge(TextStyle(color: ThemeColors.teal800))),
                ),
                const SizedBox(height: 14),
                SizedBox(
                  child: StarsBar(categorization: house.categorization,),
                ),
                showSideToSide ? const SizedBox(height: 24,) : const SizedBox(height: 0,),  
              ],
            ),
          ),
        ],
      ),
    );
  }
}
