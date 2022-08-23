import 'package:dio/dio.dart';

import 'models/location.dart';
import 'models/accommodation.dart';
import 'models/reservation.dart';

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

  Future<List<Accommodation>> getPopularHomes() async {
    Response response = await client.get(
      'homes',
    );
    return response.data
        .map<Accommodation>((json) => Accommodation.fromJson(json))
        .toList();
  }

  Future<List<Accommodation>> getAllHomes() async {
    Response response = await client.get(
      'homes-all',
    );
    return response.data
        .map<Accommodation>((json) => Accommodation.fromJson(json))
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

  Future<List<Accommodation>> getMyPlaces() async {
    Response response = await client.get(
      'myplaces',
    );
    return response.data
        .map<Accommodation>((json) => Accommodation.fromJson(json))
        .toList();
  }

  Future<Accommodation> addMyPlace(Accommodation newAccommodation) async {
    Response response = await client.post(
      'myplaces',
      data: newAccommodation,
    );

    return Accommodation.fromJson(response.data);
  }

  Future<Accommodation> deleteMyPlace(String id) async {
    Response response = await client.delete(
      'myplaces/$id',
    );

    return Accommodation.fromJson(response.data);
  }

  Future<Accommodation> editMyPlace(Accommodation accommodation) async {
    Response response = await client.put(
      'myplaces/${accommodation.id}',
      data: accommodation,
    );

    return Accommodation.fromJson(response.data);
  }

  Future<Reservation> addMyReservation(Reservation newReservation) async {
    Response response = await client.post(
      'homes-all/1/reservation',
      data: newReservation,
    );

    return Reservation.fromJson(response.data);
  }
}

final http = HTTP();
