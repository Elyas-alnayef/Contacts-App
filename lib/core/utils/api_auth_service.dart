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
    required Map<String,dynamic>params,
  }) async {
    var response = await _dio.post('$baseUrl$endPoint', data: {
      "firstName":params['firstName'] ,
      "lastName": params['lastName'],
      "email": params['email'],
      "password": params["password"],
      "city": params['city'],
      "companyName": params['companyName'],
      "country": params['country'],
      "PhoneNumber": '0531464772',
      "state": params['state'],
      "streetOne": params['streetOne'],
      "vatNumber": params['vatNumber'],
      "zip": params['zip'],
    });

    return response.toString();
  }
}
