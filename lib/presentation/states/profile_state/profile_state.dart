part of 'profile_bloc.dart';

@immutable
abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class AvatarSelectedState extends ProfileState {
  final int index;

  AvatarSelectedState(this.index);
}
