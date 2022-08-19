import 'package:devcademy_flutter/http.dart';
import 'package:devcademy_flutter/router.dart';
import 'package:devcademy_flutter/shared/models/accomodation.dart';
import 'package:devcademy_flutter/shared/providers/places_provider.dart';
import 'package:devcademy_flutter/shared/utils/basic_utils.dart';
import 'package:devcademy_flutter/shared/widgets/app_bar.dart';
import 'package:devcademy_flutter/shared/widgets/bottom_nav_bar.dart';
import 'package:devcademy_flutter/shared/widgets/custom_leading.dart';
import 'package:devcademy_flutter/shared/widgets/my_actions.dart';
import 'package:devcademy_flutter/shared/widgets/places.dart';
import 'package:devcademy_flutter/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyPlacesScreen extends StatelessWidget {
  const MyPlacesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PlacesProvider(),
      child: Material(
        child: Scaffold(
          appBar: MyAppBar(
            leading: const CustomLeading(
                icon: Icon(Icons.arrow_back), tooltip: "Go back"),
            name: "My Places",
            actions: [
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
                padding: const EdgeInsets.only(bottom: 50),
                children: places,
              );
            },
          ),
          floatingActionButton: MaterialButton(
            height: 46,
            color: ThemeColors.mint500,
            shape: const CircleBorder(),
            onPressed: () {
              router.navigateTo(context, Routes.addEditPlaces);
            },
            child: const Padding(
              padding: EdgeInsets.all(10),
              child: Icon(
                size: 18,
                Icons.add,
                color: Colors.white,
              ),
            ),
          ),
          bottomNavigationBar:
              MyBottomNavBar(currentIndex: 2, key: UniqueKey()),
        ),
      ),
    );
  }
}
