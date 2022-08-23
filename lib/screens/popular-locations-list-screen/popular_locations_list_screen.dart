import 'package:flutter/material.dart';

import 'package:devcademy_flutter/theme.dart';
import '../../shared-widgets/searchbar.dart';

import 'package:devcademy_flutter/shared-widgets/city_card.dart';
import '../../models/location.dart';

import 'package:devcademy_flutter/http.dart';

import 'package:devcademy_flutter/router.dart';

class LocationsListScreen extends StatelessWidget {
  const LocationsListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: const SearchBar(title: 'Popular locations'),
      body: SafeArea(
        child: Column(
          children: [
            FutureBuilder(
              future: http.getAllLocations(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
              
                if(snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(
                    color: ThemeColors.mint500,
                  ),);
                }

                if(snapshot.hasData) {
                  List<Location> locations = snapshot.data;

                  return Expanded(
                    child: GridView.count(
                      primary: false,
                      padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      crossAxisCount: 2,
                      shrinkWrap: true,
                      children: List.generate(locations.length, (index) {
                        return (CityCards(
                          locationCard: locations[index],
                          onPressed: () => router.toFilteredAccommodations(context, Routes.apartmentsListScreen, FormScreenArguments(locations[index].locationName, true)),
                        ));
                      }),
                    ),
                  );
                } else if(snapshot.hasError) {
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
}
