part of 'profile_bloc.dart';

@immutable
abstract class ProfileEvent {}

class GetAvatarEvent extends ProfileEvent {
  final int index;

  GetAvatarEvent(this.index);
}
