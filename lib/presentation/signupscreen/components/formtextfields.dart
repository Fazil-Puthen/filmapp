import 'package:flutter/material.dart';
import 'package:testaapp/presentation/constants%20and%20components/constants.dart';
import 'package:testaapp/presentation/constants%20and%20components/textfield.dart';

class Formtextfield extends StatelessWidget {
  final GlobalKey<FormState> formkey;
  final TextEditingController signupnamecontroller,
  signuppasscontroller,emailcontroller,phonecontroller;

  const Formtextfield({super.key,
  required this.signupnamecontroller,
  required this.signuppasscontroller,
  required this.emailcontroller,
  required this.phonecontroller,
  required this.formkey});

  @override
  Widget build(BuildContext context) {
    return Form(
                  key: formkey,
                  child: Column(
                    children: [
                      //name field
                      UserTextfield(
                        controller: signupnamecontroller,
                        hide: false,
                        labeltext: 'Name',
                        validation: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your name';
                          } else {
                            return null;
                          }
                        },
                      ),
                      box,

                      //password field
                      UserTextfield(
                        controller: signuppasscontroller,
                        hide: true,
                        labeltext: 'password',
                        validation: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a new password';
                          } else if (value.length < 8) {
                            return 'password sholud be minimum 8 character';
                          } else {
                            return null;
                          }
                        },
                      ),
                      box,

                      //email field
                      UserTextfield(
                        controller: emailcontroller,
                        hide: false,
                        labeltext: 'Email',
                        validation: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your E-mail';
                          } else if (!value.contains('@')) {
                            return 'Not a valid email';
                          } else {
                            return null;
                          }
                        },
                      ),
                      box,

                      //phone number field
                      UserTextfield(
                        controller: phonecontroller,
                        hide: false,
                        input: TextInputType.phone,
                        labeltext: 'phonenumber',
                        validation: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter Phone number';
                          } else if (value.length < 10) {
                            return 'Phone number should conatain minimum 10 numbers';
                          } else {
                            return null;
                          }
                        },
                      ),
                      box,
                    ],
                  ),
                );
  }
}