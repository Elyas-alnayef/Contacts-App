import 'package:contacts_app/core/utils/shared_perferances_service.dart';
import 'package:dio/dio.dart';

import '../../features/auth/domain/repositories/auth_repository.dart';

class ApiService {
  final Dio _dio;
  final baseUrl = "https://ms.itmd-b1.com:5123/api/";
  ApiService(this._dio);
  Future<Map<String, dynamic>> logIn(
      {required String endPoint,
      required String email,
      required String password}) async {
    var response = await _dio.post('$baseUrl$endPoint',
        data: {"email": email, "password": password},
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ));
    await SharedPrefs.saveData(response.data);
    return response.data;
  }

  Future<String> signUp({
    required String endPoint,
    required SignUpUseCaseParameters params,
  }) async {
    var response = await _dio.post('$baseUrl$endPoint', data: {
      "firstName": params.firstname,
      "lastName": params.lastname,
      "email": params.email,
      "password": params.password,
      "city": params.cityName,
      "companyName": params.companyName,
      "country": params.countryName,
      "PhoneNumber": '0531464772',
      "state": params.satte,
      "streetOne": params.street1,
      "vatNumber": params.vat,
      "zip": params.zip,
    });

    return response.toString();
  }
}
