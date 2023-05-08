import '../usecases/onboarding_data_usecase.dart';

abstract class RepositoryImpl {
  Future<OnboardingDataUseCase> getOnboardingData();
}