part of 'profile_bloc.dart';

@immutable
abstract class ProfileEvent {}

class GetAvatarEvent extends ProfileEvent {
  final int index;

  GetAvatarEvent(this.index);
}

class GetUserNameEvent extends ProfileEvent {
  final String userName;

  GetUserNameEvent(this.userName);
}

class GetPasswordEvent extends ProfileEvent {
  final String password;

  GetPasswordEvent(this.password);
}

class GetPinCodeEvent extends ProfileEvent {
  final String pincode;

  GetPinCodeEvent(this.pincode);
}