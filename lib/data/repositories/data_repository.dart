import 'package:marvel_app/data/data_sources/get_onboarding_data.dart';
import 'package:marvel_app/domain/repositories/repository_impl.dart';
import 'package:marvel_app/domain/usecases/onboarding_data_usecase.dart';

class DataRepository extends RepositoryImpl {
  @override
  Future<OnboardingDataUseCase> getOnboardingData() async {
    final data = await GetOnboardingData().getOnboardingData();
    final usecase = OnboardingDataUseCase(data);
    return usecase;
  }
}