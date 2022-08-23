import 'package:flutter/material.dart';

import 'package:devcademy_flutter/theme.dart';

import '../../shared-widgets/searchbar.dart';
import '../../shared-widgets/city_card.dart';
import 'package:devcademy_flutter/shared-widgets/accommodation_card.dart';
import 'package:devcademy_flutter/screens/home-screen/category_title.dart';

import 'package:devcademy_flutter/models/location.dart';
import 'package:devcademy_flutter/models/accommodation.dart';

import 'package:devcademy_flutter/http.dart';

import 'package:devcademy_flutter/router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SearchBar(title: 'Staycation', hideLeading: true, showSearch: true, showOptions: true,),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CategoryTitle(category: 'Popular locations', onPressed: () => router.navigateTo(context, Routes.locationListScreen),),
            FutureBuilder(
              future: http.getPopularLocations(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
              
                if(snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(
                    color: ThemeColors.mint500,
                  ),);
                }

                if(snapshot.hasData) {
                  List<Location> locations = snapshot.data;

                  return GridView.count(
                      primary: false,
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      crossAxisCount: 2,
                      shrinkWrap: true,
                      children: List.generate(locations.length, (index) {
                        return (CityCards(
                          locationCard: locations[index],
                        ));
                      }),
                    );
                } else if(snapshot.hasError) {
                  return const Center(child: Text('Snapshot has errors!'));
                }

                return const Center(child: Text('Error!'));
              },
            ),
            CategoryTitle(category: 'Homes guests love', onPressed: () => router.navigateTo(context, Routes.apartmentsListScreen),),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.420,
              child: FutureBuilder(
                future: http.getPopularHomes(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                
                  if(snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(
                      color: ThemeColors.mint500,
                    ),);
                  }

                  if(snapshot.hasData) {
                    List<Accommodation> accommodations = snapshot.data;

                    return //Expanded(
                      //child: 
                      ListView(
                        primary: false,
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        children: List.generate(
                          accommodations.length,
                          (index) {
                            return AcommodationCards(
                              house: accommodations[index],
                            );
                          },
                        ),
                      //),
                    );
                  } else if(snapshot.hasError) {
                    return const Center(child: Text('Snapshot has errors!'));
                  }

                  return const Center(child: Text('Error!'));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}