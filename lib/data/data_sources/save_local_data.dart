import 'dart:convert';

import 'package:marvel_app/data/models/user_data_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SaveLocalData {
  Future<void> saveOnboardingShowed() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("onboardingShowed", true);
  }
  Future<void> saveUserData(String email, String password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final user = UserDataModel(email, password);
    prefs.setString("userData", json.encode(user));
  }
}