import 'package:devcademy_flutter/theme.dart';
import 'package:flutter/material.dart';

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
}
