import 'package:contacts_app/core/utils/api_auth_service.dart';

import '../../domain/entities/user_entity.dart';

abstract class AuthRemoteDataSource {
  Future<Map<String, dynamic>> logIn();
  Future<String> signUp();
  Future<String> resetPassword();
  Future<UserEntity> fetchCurrentAuthenticatedUser();
}

class AuthRemoteDataSourceImp extends AuthRemoteDataSource {
  final ApiService apiService;

  AuthRemoteDataSourceImp({required this.apiService});
  @override
  Future<UserEntity> fetchCurrentAuthenticatedUser() {
    // TODO: implement fetchCurrentAuthenticatedUser
    //after fetch the user we will save the entity in hive 
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> logIn() async {
    var data =
        await apiService.logIn(endPoint: "login", email: "", password: "");
    return data;
  }

  @override
  Future<String> resetPassword() {
    // TODO: implement resetPassword
    throw UnimplementedError();
  }

  @override
  Future<String> signUp() {
    // TODO: implement signUp
    throw UnimplementedError();
  }
}
