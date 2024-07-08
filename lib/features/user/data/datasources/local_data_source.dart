import 'package:contacts_app/features/user/domain/entities/user_entity.dart';

abstract class UserLocalDataSource {
  List<UserEntity>getUsersList();
}
class UserLocalDataSourceImpl extends UserLocalDataSource{
  @override
  List<UserEntity> getUsersList() {
    // TODO: implement getUsersList
    throw UnimplementedError();
  }

}
