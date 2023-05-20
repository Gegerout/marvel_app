import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/user_data_model.dart';

class GetLocalData {
  Future<bool> getOnboardingShowed() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final data = prefs.getBool("onboardingShowed");
    if(data != null) {
      return data;
    }
    else {
      return false;
    }
  }
  Future<UserDataModel?> getUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final data = prefs.getString("userData");
    if(data != null) {
      return UserDataModel.fromJson(json.decode(data));
    }
    else {
      return null;
    }
  }
}