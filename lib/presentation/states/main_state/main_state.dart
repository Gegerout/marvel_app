part of 'main_bloc.dart';

class MainState {
  bool onboardingShowed;
  UserDataUseCase? userData;

  MainState({this.onboardingShowed = false, this.userData});
}

class MainInitial extends MainState {}
