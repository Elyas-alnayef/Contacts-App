import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static late SharedPreferences sharedPreference;
  static Future<void> init() async {
    sharedPreference = await SharedPreferences.getInstance();
    print('Successfully init');
  }

  static Future<void> saveToken(Map<String, dynamic> token) async {
    await sharedPreference.setString('token', token['token']);
    print('token saved');
  }

  static Future<void> saveUserInfo(Map<String, dynamic> user) async {
    await sharedPreference.setString('id', user['id']);
    await sharedPreference.setString('email', user['email']);
    await sharedPreference.setString('firstName', user['firstName']);
    await sharedPreference.setString('lastName', user['lastName']);

    print('user saved');
  }

  static getData(String key) {
    String? data = sharedPreference.getString(key);
    return data;
  }

  static Future<void> clear(String key) async {
    await sharedPreference.clear();
    print("cleared");
  }
}
