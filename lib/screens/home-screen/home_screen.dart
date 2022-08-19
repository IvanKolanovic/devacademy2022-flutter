import 'package:devcademy_flutter/router.dart';
import 'package:devcademy_flutter/shared/models/accomodation.dart';
import 'package:devcademy_flutter/shared/utils/basic_utils.dart';
import 'package:devcademy_flutter/shared/widgets/bottom_nav_bar.dart';
import 'package:devcademy_flutter/shared/widgets/home_guests_love.dart';
import 'package:devcademy_flutter/shared/widgets/my_actions.dart';
import 'package:devcademy_flutter/shared/widgets/popular_location.dart';
import 'package:devcademy_flutter/theme.dart';
import 'package:flutter/material.dart';

import '../../shared/widgets//app_bar.dart';
import '../../shared/widgets//feature_header.dart';
import '../../http.dart';
import '../../shared/models/location.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: MyAppBar(
          name: "Staycation",
          actions: [
            CustomAction(
              tooltip: "Search",
              actionWidget: Icon(
                Icons.search,
                color: ThemeColors.teal800,
              ),
            ),
            CustomAction(
              tooltip: "More",
              actionWidget: Icon(
                Icons.more_vert,
                color: ThemeColors.teal800,
              ),
            )
          ],
          key: UniqueKey(),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FeatureHeader(
                  title: 'Popular locations',
                  onPressed: () =>
                      router.navigateTo(context, Routes.popLocationList),
                ),
                FutureBuilder(
                    future: http.getPopularLocations(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      BasicUtils.futureCheck(snapshot);

                      List<Location> locations = snapshot.data;

                      List<Widget> pop = locations
                          .map((e) => PopularLocation(
                                location: e,
                                key: UniqueKey(),
                              ))
                          .toList();

                      return Container(
                        margin: const EdgeInsets.only(left: 20),
                        child: Wrap(
                          direction: Axis.horizontal,
                          runAlignment: WrapAlignment.spaceEvenly,
                          children: [
                            Row(
                              children: [pop[0], pop[1]],
                            ),
                            Row(
                              children: [pop[2], pop[3]],
                            )
                          ],
                        ),
                      );
                    }),
                FeatureHeader(
                  title: 'Home guests love',
                  onPressed: (() => router.navigateTo(context, Routes.appList)),
                ),
                FutureBuilder(
                  future: http.getPopularHomes(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    BasicUtils.futureCheck(snapshot);

                    List<Accomodation> accomodation = snapshot.data;

                    List<Widget> homes = accomodation
                        .map((e) => GuestsLove(
                              accomodation: e,
                              key: UniqueKey(),
                            ))
                        .toList();

                    return Container(
                      margin: const EdgeInsets.only(left: 20),
                      height: 316,
                      width: double.infinity,
                      child: Expanded(
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: homes.length,
                          itemBuilder: (BuildContext context, int index) =>
                              homes[index],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: MyBottomNavBar(currentIndex: 0, key: UniqueKey()),
        // bottomNavigationBar: MyBottomNavBar(key: UniqueKey()),
      ),
    );
  }
}
