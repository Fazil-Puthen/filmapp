import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:testaapp/presentation/loginscreen/repo/repo.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<Login>(loginhandler);
  }
  bool status=false;
  FutureOr<void> loginhandler(Login event, Emitter<LoginState> emit)async {
  print('the bloc of login');
  
  emit(Loginloading());
  status=await logincheck(event.usernaame, event.password);
  print('the status at the momnet $status');
  status?emit(Loginsuccess()):emit(Loginfail());
   
  }
}
