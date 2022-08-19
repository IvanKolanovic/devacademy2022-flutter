import 'package:devcademy_flutter/http.dart';
import 'package:devcademy_flutter/router.dart';
import 'package:devcademy_flutter/shared/models/accomodation.dart';
import 'package:devcademy_flutter/shared/models/reservations.dart';
import 'package:devcademy_flutter/shared/providers/places_provider.dart';
import 'package:devcademy_flutter/shared/utils/basic_utils.dart';
import 'package:devcademy_flutter/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

class Places extends StatelessWidget {
  final Accomodation accomodation;

  const Places({required this.accomodation, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double top = MediaQuery.of(context).padding.top + kToolbarHeight - 80;

    return Slidable(
      key: key,
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            flex: 1,
            onPressed: ((context) => showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text(
                      'Delete listing?',
                      style: textTheme.headline5!
                          .merge(const TextStyle(color: Colors.black)),
                    ),
                    content: Text(
                      'Are you sure you want to delete this listing? This action cannot be reversed.',
                      style: textTheme.bodyMedium!
                          .merge(TextStyle(color: ThemeColors.teal600)),
                    ),
                    actions: [
                      TextButton(
                        onPressed: (() => router.goBack(context)),
                        child: Text(
                          'Cancel',
                          style: textTheme.button!
                              .merge(TextStyle(color: ThemeColors.mint500)),
                        ),
                      ),
                      TextButton(
                        onPressed: (() async {
                          await http.deleteMyPlaces(accomodation.id);
                          // ignore: use_build_context_synchronously
                          router.goBack(context);
                        }),
                        child: Text(
                          'Delete',
                          style: textTheme.button!
                              .merge(TextStyle(color: ThemeColors.mint500)),
                        ),
                      )
                    ],
                  ),
                )),
            backgroundColor: ThemeColors.red500,
            foregroundColor: Colors.black,
            icon: Icons.delete,
            label: 'Delete',
          ),
        ],
      ),
      closeOnScroll: true,
      child: InkWell(
        onTap: () => router.navigateTo(context, Routes.addEditPlaces),
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
      ),
    );
  }
}
