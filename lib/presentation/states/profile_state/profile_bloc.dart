import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitial()) {
    on<GetAvatarEvent>((event, emit) {
      emit(AvatarSelectedState(event.index));
    });
    on<GetUserNameEvent>((event, emit) {
      if(event.userName.length > 4) {
        emit(UserNameSetState());
      }
      else {
        emit(UserNameWrongState());
      }
    });
    on<GetPasswordEvent>((event, emit) {
      if(event.password.length > 7) {
        emit(PasswordSetState());
      }
      else {
        emit(PasswordWrongState());
      }
    });
    on<GetPinCodeEvent>((event, emit) {
      if(event.pincode.length == 4) {
        emit(PinCodeSetState());
      }
      else {
        emit(PinCodeWrongState());
      }
    });
  }
}
