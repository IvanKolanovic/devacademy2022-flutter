import 'package:devcademy_flutter/http.dart';
import 'package:flutter/foundation.dart';

class PlacesProvider with ChangeNotifier {
  void delete(String id) {
    http.deleteMyPlaces(id);
    notifyListeners();
  }
}
