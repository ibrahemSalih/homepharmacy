import 'package:shared_preferences/shared_preferences.dart';

class UserCred {
  static const String keyUserCred = "user_cred";

  // An object of shared preferences
  static SharedPreferences? _preferences;

  static Future init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  // Store the string value in SharedPreferences
  static Future<void> setUserCredentials(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(keyUserCred, value);
  }

  // Retrieve the string value from SharedPreferences
  static getUserCredentials() => _preferences!.getString(keyUserCred);
}
