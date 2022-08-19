import 'package:devcademy_flutter/shared/models/reservations.dart';
import 'package:dio/dio.dart';

import './shared/models/location.dart';
import './shared/models/accomodation.dart';

class HTTPInterceptor extends InterceptorsWrapper {
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    print(err);
    return super.onError(err, handler);
  }
}

class HTTP {
  late Dio client;
  HTTP() {
    client = Dio(BaseOptions(
      baseUrl: 'https://62a17fb4cd2e8da9b0f28a7a.mockapi.io/api/staycation/',
      receiveDataWhenStatusError: true,
      contentType: 'application/json',
      validateStatus: (status) => status! < 400,
    ));
    client.interceptors.add(
      HTTPInterceptor(),
    );
  }

  Future<List<Location>> getPopularLocations() async {
    Response response = await client.get(
      'locations',
    );
    return response.data
        .map<Location>((json) => Location.fromJson(json))
        .toList();
  }

  Future<List<Location>> getAllLocations() async {
    Response response = await client.get(
      'locations-all',
    );
    return response.data
        .map<Location>((json) => Location.fromJson(json))
        .toList();
  }

  Future<List<Accomodation>> getPopularHomes() async {
    Response response = await client.get(
      'homes',
    );
    return response.data
        .map<Accomodation>((json) => Accomodation.fromJson(json))
        .toList();
  }

  Future<List<Accomodation>> getAllAccomodations() async {
    Response response = await client.get(
      'homes-all',
    );
    return response.data
        .map<Accomodation>((json) => Accomodation.fromJson(json))
        .toList();
  }

  Future<List<Accomodation>> getMyPlaces() async {
    Response response = await client.get(
      'myplaces',
    );
    return response.data
        .map<Accomodation>((json) => Accomodation.fromJson(json))
        .toList();
  }

  Future<List<Reservation>> getMyBookings() async {
    Response response = await client.get(
      'homes-all/1/reservation',
    );
    return response.data
        .map<Reservation>((json) => Reservation.fromJson(json))
        .toList();
  }

  Future<Accomodation> getAccomodation(String id) async {
    Response response = await client.get(
      'homes-all/$id',
    );
    return Accomodation.fromJson(response.data);
  }

  Future<List<Reservation>> getReservation(String id) async {
    Response response = await client.get(
      'homes-all/$id/reservation',
    );
    return response.data
        .map<Reservation>((json) => Reservation.fromJson(json))
        .toList();
  }

  Future<void> deleteMyPlaces(String id) async {
    Response response = await client.delete(
      'myplaces/$id',
    );
  }

  Future<Accomodation> addMyPlace(Accomodation accomodation) async {
    Response response = await client.post('myplaces', data: accomodation);
    return Accomodation.fromJson(response.data);
  }

  Future<Accomodation> editMyPlace(Accomodation accomodation) async {
    Response response = await client.put('myplaces', data: accomodation);
    return Accomodation.fromJson(response.data);
  }
}

final http = HTTP();
