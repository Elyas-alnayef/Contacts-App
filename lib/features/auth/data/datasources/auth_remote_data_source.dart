import 'package:contacts_app/core/utils/api_auth_service.dart';

import '../../../../core/constant/api_end_points.dart';
import '../../domain/repositories/auth_repository.dart';

abstract class AuthRemoteDataSource {
  Future<Map<String, dynamic>> logIn(String emial, String password);
  Future<String> signUp(SignUpUseCaseParameters params);
  Future<String> resetPassword();
}

class AuthRemoteDataSourceImp extends AuthRemoteDataSource {
  final ApiService apiService;

  AuthRemoteDataSourceImp({required this.apiService});

  @override
  Future<Map<String, dynamic>> logIn(String email, String password) async {
    var data = await apiService.logIn(
        endPoint: ApiEndPoints.loginEndPoint, email: email, password: password);
    return data;
  }

  @override
  Future<String> resetPassword() {
    // TODO: implement resetPassword
    throw UnimplementedError();
  }

  @override
  Future<String> signUp(SignUpUseCaseParameters params) async {
    var data = await apiService.signUp(
      endPoint: ApiEndPoints.registerEndPoint,
      params: params,
    );

    return data.toString();
  }
}
