part of 'onboarding_bloc.dart';

class OnboardingState {
  int page;

  OnboardingState({this.page = 0});
}

class OnboardingInitial extends OnboardingState {}

class OnboardingDataLoaded extends OnboardingState {
  final OnboardingDataUseCase data;

  OnboardingDataLoaded(this.data);
}
