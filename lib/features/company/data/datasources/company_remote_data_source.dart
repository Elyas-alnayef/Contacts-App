import 'package:contacts_app/core/constant/api_end_points.dart';
import 'package:contacts_app/core/constant/hive_boxs.dart';
import 'package:contacts_app/core/utils/api_company_service.dart';
import 'package:contacts_app/core/utils/hive_service.dart';
import 'package:contacts_app/core/utils/shared_perferances_service.dart';
import 'package:contacts_app/features/company/data/models/company_model.dart';
import 'package:contacts_app/features/company/domain/repositories/company_repository.dart';
import '../../domain/entities/company_entity.dart';

abstract class CompanyRemoteDataSource {
  Future<CompanyEntity> fetchTheAutUserCompany();
  Future<CompanyEntity> editTheAutUserCompany(
      EditCompanyUseCaseParameters params);
}

class CompanyRemoteDataSourceImpl extends CompanyRemoteDataSource {
  final CompanyApiService apiService;

  CompanyRemoteDataSourceImpl({required this.apiService});
  @override
  Future<CompanyEntity> editTheAutUserCompany(
      EditCompanyUseCaseParameters params) async {
    var data = await apiService.editCompany(
        endPoint: ApiEndPoints.companyEndPoint,
        params: params,
        token: SharedPrefs.getData("token"));
    CompanyHiveServices.upadateData(BoxesName.companyBox, "userCompany", data);
    return CompanyModel.fromJson(data);
  }

  @override
  Future<CompanyEntity> fetchTheAutUserCompany() async {
    var data = await apiService.getCompany(
        endPoint: ApiEndPoints.companyEndPoint,
        token: SharedPrefs.getData("token"));
    CompanyHiveServices.saveData(data, BoxesName.companyBox, 'userCompany');
    return CompanyModel.fromJson(data);
  }
}
