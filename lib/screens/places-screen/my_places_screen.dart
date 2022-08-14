import 'package:devcademy_flutter/http.dart';
import 'package:devcademy_flutter/shared/models/accomodation.dart';
import 'package:devcademy_flutter/shared/utils/basic_utils.dart';
import 'package:devcademy_flutter/shared/widgets/app_bar.dart';
import 'package:devcademy_flutter/shared/widgets/bottom_nav_bar.dart';
import 'package:devcademy_flutter/shared/widgets/custom_leading.dart';
import 'package:devcademy_flutter/shared/widgets/my_actions.dart';
import 'package:devcademy_flutter/shared/widgets/places.dart';
import 'package:devcademy_flutter/theme.dart';
import 'package:flutter/material.dart';

class MyPlacesScreen extends StatelessWidget {
  const MyPlacesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: MyAppBar(
          leading: const CustomLeading(
              icon: Icon(Icons.arrow_back), tooltip: "Go back"),
          name: "My Places",
          actions: [
            CustomAction(
              tooltip: "More",
              icon: Icon(
                Icons.more_vert,
                color: ThemeColors.teal800,
              ),
            )
          ],
          key: UniqueKey(),
        ),
        body: FutureBuilder(
          future: http.getMyPlaces(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            BasicUtils.futureCheck(snapshot);

            double top =
                MediaQuery.of(context).padding.top + kToolbarHeight - 80;

            List<Accomodation> acc = snapshot.data;
            List<Widget> places = acc
                .map((e) => Places(
                      accomodation: e,
                      key: UniqueKey(),
                    ))
                .toList();

            return ListView(
              scrollDirection: Axis.vertical,
              children: places,
            );
          },
        ),
        bottomNavigationBar: MyBottomNavBar(currentIndex: 2,key: UniqueKey()),
      ),
    );
  }
}
