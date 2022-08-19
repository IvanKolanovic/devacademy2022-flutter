import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Routes {
  static String homeScreen = 'homeScreen';
  static String appList = 'appList';
  static String popLocationList = 'popLocationList';
  static String appDetails = 'appDetails';
  static String myBookings = 'myBookings';
  static String myPlaces = 'myPlaces';
  static String addEditPlaces = 'addPlaces';
}

class Router {
  void goBack(BuildContext context) {
    Navigator.pop(context);
  }

  Future<void> navigateTo(BuildContext context, String route) {
    return Navigator.pushNamed(context, route);
  }
}

Router router = Router();
