import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static late SharedPreferences sharedPreference;
  static Future<void> init() async {
    sharedPreference = await SharedPreferences.getInstance();
    print('Successfully init');
  }

  static Future<void> saveData(Map<String, dynamic> token) async {
    await sharedPreference.setString('token', token['token']);
    print('Data saved');
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
