import 'package:flutter/material.dart';

import 'package:devcademy_flutter/theme.dart';
import '../../shared-widgets/searchbar.dart';

import 'package:devcademy_flutter/shared-widgets/accommodation_card.dart';
import '../../models/accommodation.dart';

import 'package:devcademy_flutter/http.dart';

import 'package:devcademy_flutter/router.dart';

class ApartmentsListScreen extends StatefulWidget {
  const ApartmentsListScreen({Key? key}) : super(key: key);

  @override
  State<ApartmentsListScreen> createState() => _ApartmentsListScreenState();
}

class _ApartmentsListScreenState extends State<ApartmentsListScreen> {
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as FormScreenArguments?;

    bool filteredView = false;

    if (routeArgs != null) {
      filteredView = true;
    }

    return Scaffold(
      appBar: const SearchBar(title: 'Homes guests love', showSearch: true),
      body: SafeArea(
        child: Column(
          children: [
            FutureBuilder(
              future: http.getAllHomes(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: ThemeColors.mint500,
                    ),
                  );
                }

                if (snapshot.hasData) {
                  List<Accommodation> accommodations = snapshot.data;
                  List<Accommodation> filteredAccommodations = [];

                  if (filteredView) {
                    filteredAccommodations = accommodations
                        .where((element) =>
                            element.title
                                .toLowerCase()
                                .contains(routeArgs!.query.toLowerCase()) ||
                            element.location
                                .toLowerCase()
                                .contains(routeArgs.query.toLowerCase()))
                        .toList();
                  } else {
                    filteredAccommodations = accommodations;
                  }

                  return Expanded(
                    child: ListView(
                      primary: false,
                      padding: const EdgeInsets.fromLTRB(10, 14, 0, 10),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      children: List.generate(
                        filteredAccommodations.length,
                        (index) {
                          return AcommodationCards(
                            house: filteredAccommodations[index],
                            showSideToSide: true,
                            onPressed: () => router.toAccommodationDetails(
                                context,
                                Routes.apartmentDetailsScreen,
                                filteredAccommodations[index]),
                          );
                        },
                      ),
                    ),
                  );
                } else if (snapshot.hasError) {
                  return const Center(child: Text('Snapshot has errors!'));
                }

                return const Center(child: Text('Error!'));
              },
            ),
          ],
        ),
      ),
    );
  }

  bool checkFormatch(String query, Accommodation accommodation) {
    if (query.toLowerCase() == accommodation.title.toLowerCase() ||
        query.toLowerCase() == accommodation.shortDescription.toLowerCase() ||
        query.toLowerCase() == accommodation.shortDescription.toLowerCase() ||
        query.toLowerCase() == accommodation.location.toLowerCase() ||
        query.toLowerCase() == accommodation.price.toString() ||
        query.toLowerCase() == accommodation.categorization.toString() ||
        query.toLowerCase() == accommodation.capacity.toString() ||
        query.toLowerCase() == accommodation.postalCode ||
        query.toLowerCase() == accommodation.accommodationType.toLowerCase())
      return true;

    return false;
  }
}
