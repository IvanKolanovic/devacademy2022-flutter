import 'package:flutter/material.dart';

import 'package:devcademy_flutter/theme.dart';
import '../../shared-widgets/searchbar.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:devcademy_flutter/assets.dart';

import 'package:devcademy_flutter/shared-widgets/accommodation_card.dart';
import '../../models/accommodation.dart';

import 'package:devcademy_flutter/router.dart';

import 'package:devcademy_flutter/http.dart';

class MyPlacesScreen extends StatefulWidget {
  const MyPlacesScreen({Key? key}) : super(key: key);

  @override
  State<MyPlacesScreen> createState() => _MyPlacesScreenState();
}

class _MyPlacesScreenState extends State<MyPlacesScreen> {
  Future<dynamic>? future = http.getMyPlaces();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SearchBar(title: 'My places', hideLeading: true, showOptions: true),
      body: SafeArea(
        child: Column(
          children: [
            FutureBuilder(
                future: future,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: ThemeColors.mint500,
                      ),
                    );
                  }

                  if (snapshot.hasData) {
                    List<Accommodation> places = snapshot.data;

                    return Expanded(
                      child: ListView.builder(
                          itemCount: places.length,
                          primary: false,
                          padding: const EdgeInsets.fromLTRB(10, 14, 0, 10),
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemBuilder: (context, index) => Dismissible(
                                key: ObjectKey(places[index]),
                                background: Container(
                                  color: Colors.redAccent,
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          0, 0, 40, 0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          SvgPicture.asset(
                                            Assets.icons.delete,
                                            color: ThemeColors.white,
                                            width: 32,
                                            height: 32,
                                          ),
                                          Text(
                                            'Delete',
                                            style: textTheme.bodyText1!.merge(
                                                TextStyle(
                                                    color: ThemeColors.white)),
                                            textAlign: TextAlign.right,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                direction: DismissDirection.endToStart,
                                resizeDuration:
                                    const Duration(milliseconds: 150),
                                movementDuration:
                                    const Duration(milliseconds: 200),
                                onDismissed:
                                    (DismissDirection direction) async {
                                  await http.deleteMyPlace(places[index].id);
                                },
                                child: AcommodationCards(
                                  house: places[index],
                                  showSideToSide: true,
                                  isMyPlace: true,
                                  onPressed: () => router.toMyPlacesForm(
                                    context,
                                    Routes.editNewPlaceScreen,
                                    places[index]).then((_) {
                                      setState(() {
                                        future = http.getMyPlaces();
                                      });
                                    }
                                  ),
                                ),
                              )),
                    );
                  } else {
                    return const Center(child: Text('Snapshot has errors!'));
                  }
                })
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        foregroundColor: ThemeColors.white,
        backgroundColor: ThemeColors.mint400,
        onPressed: () => router.navigateTo(
          context,
          Routes.editNewPlaceScreen).then((_) {
            setState(() {
              future = http.getMyPlaces();
            });
          }
        ),
        child: SvgPicture.asset(
          Assets.icons.add,
          color: ThemeColors.white,
        ),
      ),
    );
  }
}