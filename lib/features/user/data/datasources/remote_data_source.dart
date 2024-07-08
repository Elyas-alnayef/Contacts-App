import 'package:contacts_app/core/utils/shared_perferances_service.dart';
import 'package:contacts_app/features/user/domain/repositoies/user_repository.dart';
import 'package:dio/dio.dart';

abstract class UserRemoteDtatSource {
  Future getAllUsers({required String token, required String endPoint});

  Future<Map<String, dynamic>> getCurrentUser({required String endPoint});

  Future<Map<String, dynamic>> getUserById(
      {required String endPoint, required String userId});

  Future deleteAllUsers({required String endPoint});

  Future deleteUSerById({required String endPoint, required String userId});

  Future<Map<String, dynamic>> createNewUser(
      {required String endPoint,
      required CreateNewUserUseCaseParams params,
      required String token});

  Future<Map<String, dynamic>> updateUserInformaion(
      {required String endPoint,
      required UpdateUserInformationUseCaseParams params,
      required String userId});
}

class UserRemoteDtatSourceImpl extends UserRemoteDtatSource {
  final Dio dio;
  final baseUrl = "https://ms.itmd-b1.com:5123/api/";
  UserRemoteDtatSourceImpl({required this.dio});
  @override
  Future<Map<String, dynamic>> createNewUser(
      {required String endPoint,
      required CreateNewUserUseCaseParams params,
      required String token}) async {
    var response = await dio.post('$baseUrl$endPoint',
        options: Options(headers: {
          "Authorization": "Bearer $token",
        }),
        data: {
          "firstName": params.firstname,
          "lastName": params.lastName,
          "email": params.email,
          "phoneNumber": params.phoneNumber,
          "role": params.role,
        });
    return response.data;
  }

  @override
  Future getAllUsers({required String token, required String endPoint}) async {
    var respose = await dio.get("$baseUrl$endPoint",
        options: Options(headers: {
          "Authorization": "Bearer $token",
        }));
    return respose.data;
  }

  @override
  Future<Map<String, dynamic>> getCurrentUser(
      {required String endPoint}) async {
    String token = SharedPrefs.getData("token");
    var respose = await dio.get("$baseUrl$endPoint",
        options: Options(headers: {
          "Authorization": "Bearer $token",
        }));
    return respose.data;
  }

  @override
  Future deleteAllUsers({required String endPoint}) async {
    String token = SharedPrefs.getData("token");
    var respose = await dio.delete("$baseUrl$endPoint",
        options: Options(headers: {
          "Authorization": "Bearer $token",
        }));
    return respose.data;
  }

  @override
  Future deleteUSerById(
      {required String endPoint, required String userId}) async {
    String token = SharedPrefs.getData("token");
    var respose = await dio.delete("$baseUrl$endPoint/$userId",
        options: Options(headers: {
          "Authorization": "Bearer $token",
        }));
    return respose.data;
  }

  @override
  Future<Map<String, dynamic>> getUserById(
      {required String endPoint, required String userId}) async {
    String token = SharedPrefs.getData("token");
    var respose = await dio.get("$baseUrl$endPoint/$userId",
        options: Options(headers: {
          "Authorization": "Bearer $token",
        }));
    return respose.data;
  }

  @override
  Future<Map<String, dynamic>> updateUserInformaion(
      {required String endPoint,
      required UpdateUserInformationUseCaseParams params,
      required String userId}) async {
    String token = SharedPrefs.getData("token");
    var response = await dio.put("$baseUrl$endPoint/$userId",
        options: Options(headers: {
          "Authorization": "Bearer $token",
        }),
        data: {
          "firstName": params.firstname,
          "lastName": params.lastName,
          "email": params.email,
          "phoneNumber": params.phoneNumber,
          "role": params.role,
          "status": params.status
        });
    return response.data;
  }
}
