part of 'login_bloc.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class CredsChecked extends LoginState {}

class CredsWrong extends LoginState {}