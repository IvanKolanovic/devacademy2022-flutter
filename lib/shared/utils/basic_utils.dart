import 'package:devcademy_flutter/screens/apartments-screen/apratment_details_screen.dart';
import 'package:devcademy_flutter/shared/models/accomodation.dart';
import 'package:devcademy_flutter/theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BasicUtils {
  static createRating(int num) {
    var stars = <Icon>[];

    for (var i = 0; i < num; i++) {
      stars.add(Icon(
        Icons.star,
        color: ThemeColors.coral400,
      ));
    }
    return stars;
  }

  static void navigateToNextScreen(
      BuildContext context, Accomodation accomodation) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => ApartmentDetals(
        accomodation: accomodation,
        key: UniqueKey(),
      ),
    ));
  }

  static futureCheck(AsyncSnapshot snapshot) {
    if (snapshot.hasError) {
      return const Center(child: Text('error'));
    }
    if (snapshot.connectionState == ConnectionState.waiting) {
      return Center(
          child: CircularProgressIndicator(
        color: ThemeColors.mint500,
      ));
    }
  }

  static final DateFormat dM = DateFormat('dd MMM');
  static final DateFormat dMY = DateFormat('dd MMM yyyy');
}
