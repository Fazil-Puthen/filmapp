part of 'login_bloc.dart';

@immutable
sealed class LoginEvent {}

class Login extends LoginEvent{
  final String usernaame,password;

  Login({required this.usernaame,
  required this.password});

  void eventcall(){
    print('this event is called');
  }
}
