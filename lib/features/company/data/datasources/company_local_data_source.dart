import 'package:contacts_app/core/constant/hive_boxs.dart';
import 'package:contacts_app/core/utils/hive_service.dart';
import 'package:contacts_app/features/company/domain/entities/company_entity.dart';

abstract class CompayLocalDataSource {
  CompanyEntity? fetchtheAuthUserCompany();
}

class CompayLocalDataSourceImpl extends CompayLocalDataSource {
  @override
  CompanyEntity? fetchtheAuthUserCompany() {
    return CompanyHiveServices.getData(BoxesName.companyBox, "userCompany");
  }
}
