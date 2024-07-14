
import 'package:contacts_app/features/company/data/models/company_model.dart';
import 'package:contacts_app/features/company/domain/entities/company_entity.dart';
import 'package:contacts_app/features/user/data/model/user_model.dart';
import 'package:contacts_app/features/user/domain/entities/user_entity.dart';
import 'package:hive_flutter/adapters.dart';

class CompanyHiveServices {
  static void boxinit<T>(TypeAdapter<T> adapter, String boxName) async {
    Hive.registerAdapter<T>(adapter);
    await Hive.openBox(boxName);
  }

  static dynamic getData(String boxName, String key) {
    var box = Hive.box(boxName);
    var data = box.get(key);
    return data;
  }

  static void upadateData(
      String boxName, String key, Map<String, dynamic> entity) {
    var box = Hive.box(boxName);
    CompanyEntity company = CompanyModel.fromJson(entity);
    box.put(key, company);
    print("company updated locally");
  }

  static void saveData(
      Map<String, dynamic> entity, String boxName, String key) async {
    var box = Hive.box(boxName);

    CompanyEntity company = CompanyModel.fromJson(entity);
    await box.put(key, company);
    print("company saved locally");
  }
}

class UserHiveServices {
  static void boxinit<T>(TypeAdapter<T> adapter, String boxName) async {
    Hive.registerAdapter<T>(adapter);
    await Hive.openBox(boxName);
    print("users box created ");
  }

  static List<UserEntity> getData(String boxName) {
    var box = Hive.box(boxName);
    List<UserEntity> users = [];
    for (var i = 0; i < box.values.length; i++) {
      users.add(box.values.elementAt(i));
    }
    return users;
  }

  static UserEntity getUserData(String boxName, String id) {
    var box = Hive.box(boxName);
    UserEntity user = box.values.where((element) => element.id == id).first;
    return user;
  }

  static void upadateData(
      String boxName, String key, Map<String, dynamic> entity) {
    var box = Hive.box(boxName);
    // UserEntity company = UserEntity.fromJson(entity);
    // box.put(key, company);
    print("user updated locally");
  }

  static void saveData(List<dynamic> users, String boxName) async {
    var box = Hive.box(boxName);
    for (var i = 0; i < users.length; i++) {
      UserEntity userEntity = UserModel.fromJson(users[i]);
      await box.put("user$i", userEntity);
    }
    print("users saved locally");
  }
}
