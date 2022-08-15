import 'package:devcademy_flutter/http.dart';
import 'package:devcademy_flutter/shared/models/reservations.dart';
import 'package:devcademy_flutter/shared/utils/basic_utils.dart';
import 'package:devcademy_flutter/shared/widgets/app_bar.dart';
import 'package:devcademy_flutter/shared/widgets/bookings.dart';
import 'package:devcademy_flutter/shared/widgets/bottom_nav_bar.dart';
import 'package:devcademy_flutter/shared/widgets/custom_leading.dart';
import 'package:devcademy_flutter/shared/widgets/my_actions.dart';
import 'package:devcademy_flutter/theme.dart';
import 'package:flutter/material.dart';

class MyBookingsScreen extends StatelessWidget {
  const MyBookingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: MyAppBar(
          leading: const CustomLeading(
              icon: Icon(Icons.arrow_back), tooltip: "Go back"),
          name: "My Bookings",
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
          future: http.getMyBookings(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            BasicUtils.futureCheck(snapshot);

            double top =
                MediaQuery.of(context).padding.top + kToolbarHeight - 80;

            List<Reservation> acc = snapshot.data;
            List<Widget> homes = acc
                .map((e) => Container(
                      margin: EdgeInsets.only(left: 20, top: top.abs()),
                      child: Bookings(
                        reservation: e,
                        key: UniqueKey(),
                      ),
                    ))
                .toList();

            return ListView(
              scrollDirection: Axis.vertical,
              children: homes,
            );
          },
        ),
        bottomNavigationBar: MyBottomNavBar(currentIndex: 1,key: UniqueKey()),
      ),
    );
  }
}
