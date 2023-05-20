import 'package:marvel_app/data/data_sources/get_local_data.dart';
import 'package:marvel_app/data/data_sources/get_onboarding_data.dart';
import 'package:marvel_app/data/data_sources/save_local_data.dart';
import 'package:marvel_app/domain/repositories/repository_impl.dart';
import 'package:marvel_app/domain/usecases/onboarding_data_usecase.dart';
import 'package:marvel_app/domain/usecases/user_data_usecase.dart';

class DataRepository extends RepositoryImpl {
  @override
  Future<OnboardingDataUseCase> getOnboardingData() async {
    final data = await GetOnboardingData().getOnboardingData();
    final usecase = OnboardingDataUseCase(data);
    return usecase;
  }

  @override
  Future<void> saveOnboardingShowed() async {
    await SaveLocalData().saveOnboardingShowed();
  }

  @override
  Future<bool> getOnboardingShowed() async {
    final data = await GetLocalData().getOnboardingShowed();
    return data;
  }

  @override
  Future<void> saveUserData(String email, String password) async {
    await SaveLocalData().saveUserData(email, password);
  }

  @override
  Future<UserDataUseCase?> getUserData() async {
    final data = await GetLocalData().getUserData();
    if(data != null) {
      final usecase = UserDataUseCase(data.email, data.password);
      return usecase;
    }
    else {
      return null;
    }
  }
}