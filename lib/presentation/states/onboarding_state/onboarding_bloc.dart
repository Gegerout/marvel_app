import 'package:bloc/bloc.dart';
import 'package:marvel_app/data/repositories/data_repository.dart';
import 'package:meta/meta.dart';

import '../../../domain/usecases/onboarding_data_usecase.dart';

part 'onboarding_event.dart';
part 'onboarding_state.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  OnboardingBloc() : super(OnboardingState()) {
    on<OnboardingEvent>((event, emit) {
      emit(OnboardingState(page: state.page));
    });
    on<GetOnboardingDataEvent>((event, emit) async {
      final data = await DataRepository().getOnboardingData();
      emit(OnboardingDataLoaded(data));
    });
  }
}
