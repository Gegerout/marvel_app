class OnboardingDataModel {
  final String image;
  final String title;

  OnboardingDataModel(this.image, this.title);

  factory OnboardingDataModel.fromJson(Map<String, dynamic> json) {
    return OnboardingDataModel(json["image"], json["title"]);
  }
}