import 'package:dio/dio.dart';

import '../../features/company/domain/repositories/company_repository.dart';

class CompanyApiService {
  final Dio dio;
  final baseUrl = "https://ms.itmd-b1.com:5123/api/";
  CompanyApiService(this.dio);

  Future<String> editCompany(
      {required String endPoint,
      required EditCompanyUseCaseParameters params,
      required String token}) async {
    var response = await dio.put('$baseUrl$endPoint',
        data: {
          "companyName": params.companyName,
          "vatNumber": params.vatNumber,
          "streetOne": params.streetOne,
          "streetTwo": params.streetTwo,
          "city": params.city,
          "state": params.state,
          "zip": params.zip,
          "country": params.country
        },
        options: Options(headers: {
          "Authorization": "Bearer $token",
        }));

    return response.toString();
  }

  Future<Map<String, dynamic>> getCompany({
    required String endPoint,
    required String token,
  }) async {
    var response = await dio.get('$baseUrl$endPoint',
        options: Options(headers: {
          "Authorization": "Bearer $token",
        }));

    return response.data;
  }
}
