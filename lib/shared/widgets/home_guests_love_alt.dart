import 'package:devcademy_flutter/screens/apartments-screen/apratment_details_screen.dart';
import 'package:devcademy_flutter/shared/models/accomodation.dart';
import 'package:devcademy_flutter/shared/utils/basic_utils.dart';
import 'package:devcademy_flutter/theme.dart';
import 'package:flutter/material.dart';

class GuestsLoveAlt extends StatelessWidget {
  final Accomodation accomodation;

  const GuestsLoveAlt({required this.accomodation, Key? key}) : super(key: key);

  void _navigateToNextScreen(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => ApartmentDetals(
        accomodation: accomodation,
        key: UniqueKey(),
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _navigateToNextScreen(context);
      },
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Image.network(
                accomodation.imageUrl,
                width: 158,
                height: 158,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 158,
                child: Text(accomodation.title,
                    style: textTheme.bodyText1!
                        .merge(const TextStyle(color: Colors.black)),
                    textAlign: TextAlign.left),
              ),
              const SizedBox(
                width: 8,
                height: 8,
              ),
              Text(accomodation.location,
                  style: textTheme.bodyText2!
                      .merge(TextStyle(color: ThemeColors.gray300)),
                  textAlign: TextAlign.left),
              const SizedBox(
                width: 8,
                height: 8,
              ),
              Text('EUR ${accomodation.price}',
                  style: textTheme.bodyText1!
                      .merge(const TextStyle(color: Colors.black)),
                  textAlign: TextAlign.left),
              const SizedBox(
                width: 8,
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: BasicUtils.createRating(accomodation.categorization),
              )
            ],
          ),
        ],
      ),
    );
  }
}
