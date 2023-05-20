import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:marvel_app/data/repositories/data_repository.dart';
import 'package:meta/meta.dart';

part 'main_event.dart';
part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc() : super(MainInitial()) {
    on<GetAllDataEvent>((event, emit) async {
      final onboardingDataShowed = await DataRepository().getOnboardingShowed();
      final userData = await DataRepository().getUserData();
      if(userData != null) {
        emit(UserLoggedInState());
      }
      else if(onboardingDataShowed && userData != null) {
        emit(OnboardingShowedState());
      }
    });
  }
}
