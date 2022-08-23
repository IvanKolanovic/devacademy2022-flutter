import 'package:flutter/cupertino.dart';
import 'package:devcademy_flutter/models/accommodation.dart';

class Routes {
  static String authenticationScreen = 'authenticationScreen';
  static String bottomNavigationTabsScreen = 'bottomNavigationTabsScreen';
  static String homeScreen = 'homeScreen';
  static String apartmentsListScreen = 'apartmentsListScreen';
  static String locationListScreen = 'locationListScreen';
  static String apartmentDetailsScreen = 'apartmentDetailsScreen';
  static String myBookingsScreen = 'myBookingsScreen';
  static String myPlacesScreen = 'myPlacesScreen';
  static String editNewPlaceScreen = 'editNewPlaceScreen';
  static String searchFilterScreen = 'searchFilterScreen';
  static String bookReservationScreen = 'bookReservationScreen';
}

class Router {
  void goBack(BuildContext context){
    return Navigator.pop(context);
  }

  Future<void> navigateTo(BuildContext context, String route){
    return Navigator.pushNamed(context, route);
  }

  Future<void> toAccommodationDetails(BuildContext context, String route, Accommodation house){
    return Navigator.pushNamed(context, route, arguments: house);
  }

  Future<void> toFilteredAccommodations(BuildContext context, String route, FormScreenArguments? filterData){
    return Navigator.pushNamed(context, route, arguments: filterData);
  }

  Future<void> toMyPlacesForm(BuildContext context, String route, Accommodation? myAccommodation){
    return Navigator.pushNamed(context, route, arguments: myAccommodation);
  }
}

class FormScreenArguments {
  final String query;
  final bool onlyLocation;

  FormScreenArguments(this.query, this.onlyLocation);
}

Router router = Router();
