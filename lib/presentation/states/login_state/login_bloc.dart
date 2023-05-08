import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<CheckCredsEvent>((event, emit) {
      if(event.email != "" && RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$").hasMatch(event.email) && event.password != "" && event.password.length > 7) {
        emit(CredsChecked());
      }
      else {
        emit(CredsWrong());
      }
    });
  }
}
