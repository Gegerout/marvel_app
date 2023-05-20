part of 'main_bloc.dart';

@immutable
abstract class MainState {}

class MainInitial extends MainState {}

class OnboardingShowedState extends MainState {}

class UserLoggedInState extends MainState {}
