import 'package:devcademy_flutter/http.dart';
import 'package:devcademy_flutter/shared/models/accomodation.dart';
import 'package:devcademy_flutter/shared/models/reservations.dart';
import 'package:devcademy_flutter/shared/utils/basic_utils.dart';
import 'package:devcademy_flutter/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Places extends StatelessWidget {
  final Accomodation accomodation;

  const Places({required this.accomodation, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double top = MediaQuery.of(context).padding.top + kToolbarHeight - 80;

    return Slidable(
      key: key,
      endActionPane: ActionPane(motion: const ScrollMotion(), children: [
        SlidableAction(
          flex: 2,
          onPressed: null,
          backgroundColor: ThemeColors.red500,
          foregroundColor: Colors.black,
          icon: Icons.delete,
          label: 'Delete',
        ),
      ]),
      closeOnScroll: true,
      child: Container(
        margin: EdgeInsets.only(left: 20, top: top.abs()),
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
                Text('Renting the entire unit',
                    style: textTheme.bodyText1!
                        .merge(const TextStyle(color: Colors.black)),
                    textAlign: TextAlign.left),
                const SizedBox(
                  width: 8,
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children:
                      BasicUtils.createRating(accomodation.categorization),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
