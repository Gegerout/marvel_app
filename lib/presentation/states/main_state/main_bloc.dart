import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:marvel_app/data/repositories/data_repository.dart';
import 'package:marvel_app/domain/usecases/user_data_usecase.dart';
import 'package:meta/meta.dart';

part 'main_event.dart';
part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc() : super(MainState()) {
    on<GetAllDataEvent>((event, emit) async {
      final onboardingDataShowed = await DataRepository().getOnboardingShowed();
      final userData = await DataRepository().getUserData();
      emit(MainState(onboardingShowed: onboardingDataShowed, userData: userData));
    });
  }
}
