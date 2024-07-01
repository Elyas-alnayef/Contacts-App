import 'package:contacts_app/features/company/domain/entities/company_entity.dart';
import 'package:hive_flutter/adapters.dart';

abstract class CompayLocalDataSource {
  CompanyEntity fetchtheAuthUserCompany();
}

class CompayLocalDataSourceImpl extends CompayLocalDataSource {
  @override
  CompanyEntity fetchtheAuthUserCompany() {
     var box = Hive.box<CompanyEntity>("UserCompany");
    return box.values.first;
  }

}
