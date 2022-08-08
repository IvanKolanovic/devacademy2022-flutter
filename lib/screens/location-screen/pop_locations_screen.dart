import 'package:devcademy_flutter/http.dart';
import 'package:devcademy_flutter/shared/models/location.dart';
import 'package:devcademy_flutter/shared/utils/basic_utils.dart';
import 'package:devcademy_flutter/shared/widgets/app_bar.dart';
import 'package:devcademy_flutter/shared/widgets/custom_leading.dart';
import 'package:devcademy_flutter/shared/widgets/popular_location.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class PopLocationScreen extends StatelessWidget {
  const PopLocationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: MyAppBar(
          leading: const CustomLeading(
            icon: Icon(Icons.arrow_back),
            tooltip: "Go back",
          ),
          name: "Popular locations",
          actions: const [],
          key: UniqueKey(),
        ),
        body: FutureBuilder(
          future: http.getAllLocations(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            BasicUtils.futureCheck(snapshot);

            List<Location> locations = snapshot.data;

            List<PopularLocation> locationWidgets = locations
                .map((e) => PopularLocation(
                      location: e,
                      key: UniqueKey(),
                    ))
                .toList();

            return GridView.count(
              primary: false,
              padding: const EdgeInsets.all(20),
              crossAxisCount: 2,
              children: locationWidgets,
            );
          },
        ),
      ),
    );
  }
}
