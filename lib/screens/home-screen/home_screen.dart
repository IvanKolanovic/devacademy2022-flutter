import 'package:flutter/material.dart';

import '../../shared/app_bar.dart';
import '../../shared/feature_header.dart';
import './widgets/popular_location.dart';
import './widgets/home_guests_love.dart';
import '../../../assets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: MyAppBar(
          key: UniqueKey(),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const FeatureHeader(
                  title: 'Popular locations',
                ),
                Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(left: 15),
                  child: Row(
                    children: [
                      PopularLocation(
                        name: 'London',
                        key: UniqueKey(),
                      ),
                      PopularLocation(name: 'Tokyo', key: UniqueKey()),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(left: 15),
                  child: Row(
                    children: [
                      PopularLocation(
                        name: 'Barcelona',
                        key: UniqueKey(),
                      ),
                      PopularLocation(
                        name: 'New York',
                        key: UniqueKey(),
                      )
                    ],
                  ),
                ),
                const FeatureHeader(
                  title: 'Home guests love',
                ),
                Container(
                  margin: const EdgeInsets.only(left: 15, bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GuestsLove(
                        name: 'Sugar & Spice Apartments',
                        location: 'Split',
                        price: 75,
                        rating: 5,
                        image: Assets.images.ap1,
                        key: UniqueKey(),
                      ),
                      GuestsLove(
                        name: 'Lemon Luxury Apartments',
                        location: 'Saint Tropez',
                        price: 174,
                        rating: 5,
                        image: Assets.images.ap2,
                        key: UniqueKey(),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        // bottomNavigationBar: MyBottomNavBar(key: UniqueKey()),
      ),
    );
  }
}
