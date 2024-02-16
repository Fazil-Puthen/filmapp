part of 'login_bloc.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

class Loginfail extends LoginState{}

class Loginsuccess extends LoginState{}

class Loginloading  extends LoginState{}
