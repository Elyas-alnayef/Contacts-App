import 'dart:convert';

import 'package:contacts_app/features/contacts/data/models/contatc_model.dart';
import 'package:contacts_app/features/contacts/domain/entities/contact_entity.dart';
import 'package:contacts_app/features/contacts/domain/repositories/contatc_repository.dart';
import 'package:dio/dio.dart';

import '../../../../core/constant/api_end_points.dart';
import '../../../../core/utils/shared_perferances_service.dart';

abstract class ContactRemoteDataSource {
  Future<List<dynamic>> getContacts();
  Future<Map<String, dynamic>> createNewContact(
      {required CreateNewContactUseCaseParams params});
  Future sendEmail({required SendContactEmailUseCaseParams params});
  Future<ContactEntity> toggleFavorite({required String contactId});
  Future<Map<String, dynamic>> updateContact();
  Future<Map<String, dynamic>> getContactById({required String contactId});
  Future deleteContactById({required String contactId});
  Future<String> getContatcImage({required String contactId});
}

class ContactRemoteDataSourceImpl extends ContactRemoteDataSource {
  final Dio dio;
  final String baseUrl = ApiEndPoints.apiBaseUrl;
  final String endPoint = ApiEndPoints.contactsEndPoint;
  String token = SharedPrefs.getData("token");
  ContactRemoteDataSourceImpl({required this.dio});

  @override
  Future<Map<String, dynamic>> createNewContact(
      {required CreateNewContactUseCaseParams params}) async {
    FormData formData = FormData.fromMap({
      "FirstName": params.firstName,
      "LastName": params.lastName,
      "Email": params.email,
      "PhoneNumber": params.phoneNumber,
      "Address": params.address,
      "AddressTwo": params.addressTwo,
      "EmailTwo": params.emailTwo,
      "MobileNumber": params.phoneNumberTwo,
      "ImageUploadFile": await MultipartFile.fromFile(
        params.image!.path,
        filename: params.image!.name,
      )
    });
    var response = await dio.post("$baseUrl$endPoint",
        data: formData,
        options: Options(headers: {
          "Authorization": "Bearer $token",
          "Content-Type": "multipart/form-data"
        }));
    return response.data;
  }

  @override
  Future deleteContactById({required String contactId}) async {
    var response = await dio.delete(
      "$baseUrl$endPoint/$contactId",
      options: Options(
        headers: {
          "Authorization": "Bearer $token",
        },
      ),
    );
    return response.data;
  }

  Future<Map<String, dynamic>> getContactById(
      {required String contactId}) async {
    var response = await dio.get(
      "$baseUrl$endPoint/$contactId",
      options: Options(
        headers: {
          "Authorization": "Bearer $token",
        },
      ),
    );

    return response.data;
  }

  @override
  Future<List<dynamic>> getContacts() async {
    var response = await dio.get("$baseUrl$endPoint",
        options: Options(headers: {
          "Authorization": "Bearer $token",
        }));
    print(response);
    return response.data;
  }

  @override
  Future<ContactEntity> toggleFavorite({required String contactId}) async {
    var response = await dio.patch(
      "$baseUrl${ApiEndPoints.contactsToggleFavoriteEndPoint}/$contactId",
      options: Options(
        headers: {
          "Authorization": "Bearer $token",
        },
      ),
    );
    ContactEntity contact = ContactModel.fromJson(response.data);
    return contact;
  }

  @override
  Future sendEmail({required SendContactEmailUseCaseParams params}) async {
    final response = await dio.post(
      "$baseUrl$endPoint/${ApiEndPoints.contactsSendEmailEndPoint}",
      data: {
        "to": params.to,
        "cc": params.cc,
        "bcc": params.bcc,
        "subject": params.subject,
        "body": params.body,
      },
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
        },
      ),
    );
    return response.data;
  }

  @override
  Future<String> getContatcImage({required String contactId}) async {
    var response;
    try {
      response = await dio.get(
        "$baseUrl${ApiEndPoints.contactsEndPoint}/$contactId/${ApiEndPoints.contactsGetImageUrlEndPoint}",
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
          },
        ),
      );
      return response.data;
    } on DioException catch (e) {
      // Log the error details
      print("DioException: ${e.message}");
      if (e.response != null) {
        print("Response data: ${e.response?.data}");
        print("Response headers: ${e.response?.headers}");
        print("Response request: ${e.response?.requestOptions}");
      }
      // Re-throw the exception if necessary
      throw e;
    }
  }

  @override
  Future<Map<String, dynamic>> updateContact() {
    // TODO: implement updateContact
    throw UnimplementedError();
  }
}
