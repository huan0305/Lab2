

import 'package:encrypted_shared_preferences/encrypted_shared_preferences.dart';

// Lab 5 - Data repository to store variables.
class DataRepository {
  static String firstName = "";
  static String lastName = "";
  static String phoneNumber = "";
  static String email = "";
  static String userName = "";

  static Future<void> loadData() async {
    var prefs = EncryptedSharedPreferences();

    prefs.getString("firstName").then((first) {firstName = first;});
    prefs.getString("lastName").then((last) {lastName = last;});
    prefs.getString("phoneNumber").then((phone) {phoneNumber = phone;});
    prefs.getString("email").then((email1) {email = email1;});
    prefs.getString("userName").then((user) {userName = user;});
  }

  static void saveData() {
    var prefs = EncryptedSharedPreferences();

    prefs.setString("firstName", firstName);
    prefs.setString("lastName", lastName);
    prefs.setString("phoneNumber", phoneNumber);
    prefs.setString("email", email);
    prefs.setString("userName", userName);
  }

  // Lab 5 - Created to set login name from main.
  static void setLogin(String name) {
    userName = name;
  }

  // Lab 5 - Created to retrieve login name for ProfilePage
  static String getLogin() {
    return userName;
  }
}