part of 'profile_bloc.dart';

@immutable
abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class AvatarSelectedState extends ProfileState {
  final int index;

  AvatarSelectedState(this.index);
}

class UserNameSetState extends ProfileState {}

class UserNameWrongState extends ProfileState {}

class PasswordSetState extends ProfileState {}

class PasswordWrongState extends ProfileState {}

class PinCodeSetState extends ProfileState {}

class PinCodeWrongState extends ProfileState {}
