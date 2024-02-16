part of 'signup_bloc.dart';

@immutable
sealed class SignupState {}

final class SignupInitial extends SignupState {}

class SignupSuccess extends SignupState{}

class Signupfail extends SignupState{}
