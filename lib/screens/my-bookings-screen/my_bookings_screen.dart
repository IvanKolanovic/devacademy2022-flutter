import 'package:flutter/material.dart';

import 'package:devcademy_flutter/theme.dart';
import '../../shared-widgets/searchbar.dart';

import 'package:devcademy_flutter/shared-widgets/accommodation_card.dart';
import '../../models/accommodation.dart';
import '../../models/reservation.dart';

import 'package:devcademy_flutter/http.dart';

class MyBookingsScreen extends StatelessWidget {
  const MyBookingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: const SearchBar(title: 'My bookings', hideLeading: true, showOptions: true),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FutureBuilder(
              future: Future.wait([
                http.getAllHomes(),
                http.getMyBookings(),
              ]),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
              
                if(snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(
                    color: ThemeColors.mint500,
                  ),);
                }
      
                if(snapshot.hasData) { 
                  List<Accommodation> accommodations = snapshot.data[0];
                  List<Reservation> reservations = snapshot.data[1];
      
                  return ListView(
                    primary: false,
                    padding: const EdgeInsets.fromLTRB(10, 14, 0, 10),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    children: List.generate(
                      reservations.length,
                      (index) {
                        for(int i = 0; i < accommodations.length; i++){
                          if(accommodations[i].id == reservations[index].homesAllId) {
                              return AcommodationCards(
                                house: accommodations[i],
                                showSideToSide: true,
                                booking: reservations[index],
                              );
                          }
                        }
      
                        return const Center(child: Text('No data found!'));
                      },
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
