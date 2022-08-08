import 'package:devcademy_flutter/shared/models/accomodation.dart';
import 'package:devcademy_flutter/shared/widgets/apartment_details_sheat.dart';
import 'package:devcademy_flutter/shared/widgets/custom_leading.dart';
import 'package:devcademy_flutter/shared/widgets/my_actions.dart';
import 'package:devcademy_flutter/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../shared/widgets/app_bar.dart';

class ApartmentDetals extends StatefulWidget {
  final Accomodation accomodation;

  const ApartmentDetals({required this.accomodation, Key? key})
      : super(key: key);

  @override
  State<ApartmentDetals> createState() => _ApartmentDetalsState();
}

class _ApartmentDetalsState extends State<ApartmentDetals> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Scaffold(
          /*  appBar: MyAppBar(
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
          ),*/
          body: Stack(
            children: [
              Align(
                alignment: AlignmentDirectional.topStart,
                child: Image.network(
                  widget.accomodation.imageUrl,
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height / 2.2,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 10,
                left: 10,
                child: CustomLeading(
                  icon: const Icon(Icons.arrow_back),
                  tooltip: "Go back",
                  color: ThemeColors.teal800,
                ),
              ),
              SizedBox.expand(
                child: DraggableScrollableSheet(
                  initialChildSize: 0.65,
                  minChildSize: 0.65,
                  builder: (BuildContext context,
                      ScrollController scrollController) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(12.0),
                      child: Container(
                        color: Colors.white,
                        child: SingleChildScrollView(
                          controller: scrollController,
                          child: DetailsSheat(
                            accomodation: widget.accomodation,
                            key: UniqueKey(),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Align(
                alignment: AlignmentDirectional.bottomCenter,
                child: Container(
                  width: 330,
                  padding: const EdgeInsets.only(top: 20, bottom: 0, right: 10),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: ThemeColors.mint400,
                      onPrimary: Colors.white,
                      textStyle: textTheme.button,
                    ),
                    onPressed: () {},
                    child: const Text('BOOK YOUR STAY'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
