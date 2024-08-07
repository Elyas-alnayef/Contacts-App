import 'package:contacts_app/core/constant/api_end_points.dart';
import 'package:dio/dio.dart';

import '../../features/company/domain/repositories/company_repository.dart';

class CompanyApiService {
  final Dio dio;
  final baseUrl =ApiEndPoints.apiBaseUrl;
  CompanyApiService(this.dio);

  Future<Map<String, dynamic>> editCompany(
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

    return response.data;
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
