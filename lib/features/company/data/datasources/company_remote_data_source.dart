import 'package:contacts_app/core/constant/api_end_points.dart';
import 'package:contacts_app/core/utils/api_company_service.dart';
import 'package:contacts_app/core/utils/shared_perferances_service.dart';
import 'package:contacts_app/features/company/domain/repositories/company_repository.dart';

abstract class CompanyRemoteDataSource {
  Future<Map<String, dynamic>> fetchTheAutUserCompany();
  Future<Map<String, dynamic>> editTheAutUserCompany(
      EditCompanyUseCaseParameters params);
}

class CompanyRemoteDataSourceImpl extends CompanyRemoteDataSource {
  final CompanyApiService apiService;

  CompanyRemoteDataSourceImpl({required this.apiService});
  @override
  Future<Map<String, dynamic>> editTheAutUserCompany(
      EditCompanyUseCaseParameters params) async {
    var data = await apiService.editCompany(
        endPoint: ApiEndPoints.companyEndPoint,
        params: params,
        token: SharedPrefs.getData("token"));
    return data;
  }

  @override
  Future<Map<String, dynamic>> fetchTheAutUserCompany() async {
    var data = await apiService.getCompany(
        endPoint: ApiEndPoints.companyEndPoint,
        token: SharedPrefs.getData("token"));
    return data;
  }
}
