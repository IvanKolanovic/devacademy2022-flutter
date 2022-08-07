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
}

final http = HTTP();
