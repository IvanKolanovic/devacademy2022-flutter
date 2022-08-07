import 'package:devcademy_flutter/http.dart';
import 'package:devcademy_flutter/shared/models/accomodation.dart';
import 'package:devcademy_flutter/shared/utils/basic_utils.dart';
import 'package:devcademy_flutter/shared/widgets/app_bar.dart';
import 'package:devcademy_flutter/shared/widgets/custom_leading.dart';
import 'package:devcademy_flutter/shared/widgets/home_guests_love.dart';
import 'package:devcademy_flutter/shared/widgets/home_guests_love_alt.dart';
import 'package:devcademy_flutter/shared/widgets/my_actions.dart';
import 'package:devcademy_flutter/theme.dart';
import 'package:flutter/material.dart';

class ApartmentsListScreen extends StatelessWidget {
  const ApartmentsListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: MyAppBar(
          leading: const CustomLeading(
              icon: Icon(Icons.arrow_back), tooltip: "Go back"),
          name: "Homes guests love",
          actions: [
            CustomAction(
              tooltip: "Search",
              icon: Icon(
                Icons.search,
                color: ThemeColors.teal800,
              ),
            ),
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
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            child: FutureBuilder(
              future: http.getAllAccomodations(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                BasicUtils.futureCheck(snapshot);

                double top =
                    MediaQuery.of(context).padding.top + kToolbarHeight - 80;

                List<Accomodation> acc = snapshot.data;
                List<Widget> homes = acc
                    .map((e) => Container(
                          margin: EdgeInsets.only(left: 20, top: top.abs()),
                          child: GuestsLoveAlt(
                            accomodation: e,
                            key: UniqueKey(),
                          ),
                        ))
                    .toList();

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: homes,
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
