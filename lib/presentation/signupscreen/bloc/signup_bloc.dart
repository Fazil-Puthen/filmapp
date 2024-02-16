import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:meta/meta.dart';
import 'package:testaapp/presentation/signupscreen/repository/repo.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc() : super(SignupInitial()) {
    on<SignupEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<SignUp>(signuphandler);
  }

  FutureOr<void> signuphandler(SignUp event, Emitter<SignupState> emit) async{
    bool status=await addnewuser(event.name,
     event.password,
    event.phonenumber,
    event.mail,
    event.profession);

    status?emit(SignupSuccess()):emit(Signupfail());
  }
}
