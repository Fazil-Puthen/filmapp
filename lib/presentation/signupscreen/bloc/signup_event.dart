part of 'signup_bloc.dart';

@immutable
sealed class SignupEvent {}

class SignUp extends SignupEvent{
  final String name,mail,password,profession;
  final String phonenumber;
  SignUp({
    required this.mail,
    required this.name,
    required this.phonenumber,
    required this.password,
    required this.profession
    // required this.profession
  });
}

