import 'dart:convert';

import 'package:flutter/services.dart';

import '../models/onboarding_data_model.dart';

class GetOnboardingData {
  Future<List<OnboardingDataModel>> getOnboardingData() async {
    final file = await rootBundle.loadString("assets/json/onboarding_data.json");
    final data = await json.decode(file);
    return (data["data"] as List).map((value) => OnboardingDataModel.fromJson(value)).toList();
  }
}