part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class CheckCredsEvent extends LoginEvent {
  final String email;
  final String password;

  CheckCredsEvent(this.email, this.password);
}