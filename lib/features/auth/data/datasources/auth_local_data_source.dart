import 'package:hive_flutter/adapters.dart';

import '../../domain/entities/user_entity.dart';

abstract class AuthLocalDataSource {
  UserEntity fetchCurrentAuthenticatedUser();
}

class AuthLocalDataSourceImp extends AuthLocalDataSource {
  @override
  UserEntity fetchCurrentAuthenticatedUser() {
    var box = Hive.box<UserEntity>("AuthenticatedUser");
    return box.values.first;
  }
}
