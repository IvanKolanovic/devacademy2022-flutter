import 'package:flutter/material.dart';

import 'package:devcademy_flutter/theme.dart';

import 'package:devcademy_flutter/router.dart';
import 'package:devcademy_flutter/screens/bottom-navigation-tabs-screen/bottom_navigation_tabs_screen.dart';
import 'package:devcademy_flutter/screens/home-screen/home_screen.dart';
import 'package:devcademy_flutter/screens/apartments-list-screen/apartments_list_screen.dart';
import 'package:devcademy_flutter/screens/popular-locations-list-screen/popular_locations_list_screen.dart';
import 'package:devcademy_flutter/screens/apartment-details-screen/apartment_details_screen.dart';
import 'package:devcademy_flutter/screens/my-bookings-screen/my_bookings_screen.dart';
import 'package:devcademy_flutter/screens/my-places-screen/my_places_screen.dart';
import 'package:devcademy_flutter/screens/edit-new-place-screen/edit_new_place_screen.dart';
import 'package:devcademy_flutter/screens/search-filter-screen/search_filter_screen.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        FormBuilderLocalizations.delegate,
      ],
      theme: theme,
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.bottomNavigationTabsScreen,
      //initialRoute: Routes.searchFilterScreen,

      routes: {
        Routes.bottomNavigationTabsScreen: (context) =>
            const BottomNavigationTabs(),
        Routes.homeScreen: (context) => const HomeScreen(),
        Routes.apartmentsListScreen: (context) => const ApartmentsListScreen(),
        Routes.locationListScreen: (context) => const LocationsListScreen(),
        Routes.apartmentDetailsScreen: (context) =>
            const ApartmentDetailsScreen(),
        Routes.myBookingsScreen: (context) => const MyBookingsScreen(),
        Routes.myPlacesScreen: (context) => const MyPlacesScreen(),
        Routes.editNewPlaceScreen: (context) => const EditNewPlaceScreen(),
        Routes.searchFilterScreen: (context) => const SearchFilterScreen(),
      },
    );
  }
}
