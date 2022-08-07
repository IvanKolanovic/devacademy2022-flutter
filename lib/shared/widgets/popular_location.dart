import 'package:devcademy_flutter/theme.dart';
import 'package:flutter/material.dart';
import '../../../shared/models/location.dart';
import '../../../assets.dart';
import '../../../theme.dart';

class PopularLocation extends StatefulWidget {
  final Location location;
  const PopularLocation({required this.location, Key? key}) : super(key: key);

  @override
  State<PopularLocation> createState() => _PopularLocationState();
}

class _PopularLocationState extends State<PopularLocation> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(10),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(
              widget.location.imageUrl,
              width: 158,
              height: 155,
              fit: BoxFit.cover,
            ),
          ),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Container(
            width: 158,
            height: 155,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color.fromRGBO(0, 0, 0, 0.38),
                    Color.fromRGBO(255, 255, 255, 0)
                  ]),
            ),
          ),
        ),
        Positioned(
          top: 20,
          left: 20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.location.locationName,
                style: textTheme.bodyText1!.merge(const TextStyle(
                  color: Colors.white,
                )),
              ),
              Text(
                '${widget.location.properties}  properties',
                style: textTheme.bodyText2!.merge(const TextStyle(
                  color: Colors.white,
                )),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
