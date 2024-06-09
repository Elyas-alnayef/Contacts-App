import 'package:contacts_app/core/utils/shared_perferances_service.dart';
import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio;
  final baseUrl = "https://ms.itmd-b1.com:5123/api/";
  ApiService(this._dio);
  Future<Map<String, dynamic>> logIn(
      {required String endPoint,
      required String email,
      required String password}) async {
    var response = await _dio.post('$baseUrl$endPoint',
        data: {"email": email, "password": password});
    await SharedPrefs.saveData(response.data);
    return response.data;
  }

  Future<Map<String, dynamic>> signUp({
    required String endPoint,
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String companyName,
    required String country,
    required String city,
    required String phoneNumber,
    required String state,
    required String streetOne,
    required String vatNumber,
    required String zip,
  }) async {
    var response = await _dio.post('$baseUrl$endPoint', data: {
      "firstName": firstName,
      "lastName": lastName,
      "email": email,
      "password": password,
      "City": city,
      "CompanyName": companyName,
      "Country": country,
      "PhoneNumber": phoneNumber,
      "State": state,
      "StreetOne": streetOne,
      "VatNumber": vatNumber,
      "Zip": zip,
    });
    return response.data;
  }
}
