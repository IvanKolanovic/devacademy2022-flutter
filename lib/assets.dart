class Assets {
  static _Icons icons = _Icons();
  static _Images images = _Images();
}

class _Icons {
  String devcademy = 'assets/icons/devcademy.png';
}

class _Images {
  String london = 'assets/popular_locations/London.png';
  String barcelona = 'assets/popular_locations/Barcelona.png';
  String tokyo = 'assets/popular_locations/Tokyo.png';
  String ny = 'assets/popular_locations/NewYork.png';

  String ap1 = 'assets/guests_love/ap1.png';
  String ap2 = 'assets/guests_love/ap2.png';

  String getImage(String name) {
    switch (name) {
      case 'London':
        return london;
      case 'Barcelona':
        return barcelona;
      case 'Tokyo':
        return tokyo;
      case 'New York':
        return ny;
      default:
        return "error";
    }
  }
}
