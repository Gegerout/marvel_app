import '../usecases/onboarding_data_usecase.dart';
import '../usecases/user_data_usecase.dart';

abstract class RepositoryImpl {
  Future<OnboardingDataUseCase> getOnboardingData();
  Future<void> saveOnboardingShowed();
  Future<bool> getOnboardingShowed();
  Future<void> saveUserData(String email, String password);
  Future<UserDataUseCase?> getUserData();
}