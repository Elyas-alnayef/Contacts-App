import 'package:contacts_app/core/constant/hive_boxs.dart';
import 'package:contacts_app/features/user/domain/entities/user_entity.dart';

import '../../../../core/utils/hive_service.dart';

abstract class UserLocalDataSource {
  List<UserEntity> getUsersList();
  UserEntity getUser(String index);
}

class UserLocalDataSourceImpl extends UserLocalDataSource {
  @override
  List<UserEntity> getUsersList() {
    var data = UserHiveServices.getData(BoxesName.usersBox);
    return data;
  }

  @override
  UserEntity getUser(String id) {
    var data = UserHiveServices.getUserData(BoxesName.usersBox, id);
    return data;
  }
}
