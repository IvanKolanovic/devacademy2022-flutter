import 'package:devcademy_flutter/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:devcademy_flutter/theme.dart';
import 'package:devcademy_flutter/assets.dart';

import '../../shared-widgets/searchbar.dart';
import 'package:devcademy_flutter/shared-widgets/starsbar.dart';

import '../../models/accommodation.dart';

class ApartmentDetailsScreen extends StatelessWidget {
  const ApartmentDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context)!.settings.arguments as Accommodation;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const SearchBar(isTransparent: true,),
      body: Stack(
        children: [
          LayoutBuilder(builder: (BuildContext context, BoxConstraints constrainst) {
            return SizedBox(
              height: constrainst.maxHeight/0.55,
              child: Image.network(
                routeArgs.imageUrl,
                fit: BoxFit.cover,
              ),
            );
          }),
          DraggableScrollableSheet(
            initialChildSize: 0.5,
            minChildSize: 0.5,
            maxChildSize: 0.85,
            snapSizes: const [0.5, 0.85],
            snap: true,
            builder: (BuildContext context, ScrollController scrollController) {

            return Container(
              decoration: BoxDecoration(
                color: ThemeColors.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
              ),
              child: SingleChildScrollView(
                controller: scrollController,
                child: Container(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 75),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Container(
                          padding: const EdgeInsets.fromLTRB(0, 10, 0, 15),
                          width: 28,
                          child: const Divider(
                            thickness: 3,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 6, 0, 6),
                        child: Text(
                          routeArgs.title,
                          style: textTheme.headline6!.merge(TextStyle(color: ThemeColors.black))
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.fromLTRB(0, 6, 0, 6),
                        child: SizedBox(
                          child: StarsBar(categorization: 5),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 4, 0, 4),
                        child: Text(
                          routeArgs.shortDescription,
                          style: textTheme.bodyText2!.merge(TextStyle(color: ThemeColors.gray500))
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(Assets.icons.calendar, color: ThemeColors.coral400,),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                              child: routeArgs.freeCancelation ? Text('Free cancellation available', style: textTheme.bodyText2!.merge(TextStyle(color: ThemeColors.teal800)))
                                                               : Text('Free cancellation not available', style: textTheme.bodyText2!.merge(TextStyle(color: ThemeColors.teal800))),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 25, 0, 20),
                        child: Text(routeArgs.longDescription,style: textTheme.bodyText1!.merge(TextStyle(color: ThemeColors.teal800))),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 5, 0, 10),
                        child: Text(
                          'Property info:',
                          style: textTheme.bodyText1!.merge(TextStyle(color: ThemeColors.black))
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                        child: Text('${routeArgs.capacity} quests', style: textTheme.bodyText2!.merge(TextStyle(color: ThemeColors.teal800))),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                        child: Text(routeArgs.accommodationType, style: textTheme.bodyText2!.merge(TextStyle(color: ThemeColors.teal800))),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                        child: Text('EUR ${routeArgs.price} per night', style: textTheme.bodyText2!.merge(TextStyle(color: ThemeColors.teal800))
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                        child: Text(routeArgs.location, style: textTheme.bodyText2!.merge(TextStyle(color: ThemeColors.teal800))),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                        child: Text(routeArgs.postalCode, style: textTheme.bodyText2!.merge(TextStyle(color: ThemeColors.teal800))),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
          Align(
            alignment: Alignment.bottomCenter, 
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: ThemeColors.mint400,
                  onPrimary: ThemeColors.white,
                  textStyle: const TextStyle(fontSize: 15),
                ),
                onPressed: () => router.toAccommodationDetails(context, Routes.bookReservationScreen, routeArgs),
                child: const Text('BOOK YOUR STAY'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
