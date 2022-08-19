import 'package:devcademy_flutter/router.dart';
import 'package:devcademy_flutter/screens/apartments-screen/apartments_list_screen.dart';
import 'package:devcademy_flutter/screens/bookings-screen/my_bookings_screen.dart';
import 'package:devcademy_flutter/screens/forms-screens/add_place_screen.dart';
import 'package:devcademy_flutter/screens/home-screen/home_screen.dart';
import 'package:devcademy_flutter/screens/location-screen/pop_locations_screen.dart';
import 'package:devcademy_flutter/screens/places-screen/my_places_screen.dart';
import 'package:devcademy_flutter/theme.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.homeScreen,
      routes: {
        Routes.homeScreen: (context) => const HomeScreen(),
        Routes.appList: (context) => const ApartmentsListScreen(),
        Routes.popLocationList: (context) => const PopLocationScreen(),
        Routes.myBookings: (context) => const MyBookingsScreen(),
        Routes.myPlaces: (context) => const MyPlacesScreen(),
        Routes.addEditPlaces: (context) => const AddEditPlacesScreen(),
      },
    );
  }
}
