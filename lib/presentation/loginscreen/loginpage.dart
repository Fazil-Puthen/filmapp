import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:testaapp/presentation/constants%20and%20components/constants.dart';
import 'package:testaapp/presentation/constants%20and%20components/textfield.dart';
import 'package:testaapp/presentation/homescreen/homescreen.dart';
import 'package:testaapp/presentation/loginscreen/bloc/login_bloc.dart';
import 'package:testaapp/presentation/loginscreen/components/loginfailwidget.dart';
import 'package:testaapp/presentation/signupscreen/signupscreen.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final namecontroller = TextEditingController();
  final passcontroller = TextEditingController();
  final loginformkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    const box = SizedBox(
      height: 15,
    );
    return Scaffold(
        body: Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //welcome back
            Text(
              'Welcome Back',
              style: headingstyle,
            ),
            box,

            //Login error widget
            BlocConsumer<LoginBloc, LoginState>(
              listener: (context, state) {
                if (state is Loginsuccess) {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (ctx) => const HomeScreen()),
                      (route) => false);
                }
              },
              builder: (context, state) {
                if (state is Loginloading) {
                  return Lottie.asset('asset/loadingbar.json', repeat: true);
                } else if (state is Loginfail) {
                  return const LoginFail();
                } else {
                  return const SizedBox();
                }
              },
            ),
            box,

            //username field
            Form(
              key: loginformkey,
              child: Column(
                children: [
                  UserTextfield(
                    controller: namecontroller,
                    hide: false,
                    labeltext: 'username',
                    validation: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your username';
                      } else {
                        return null;
                      }
                    },
                  ),
                  box,

                  //password field
                  UserTextfield(
                    controller: passcontroller,
                    hide: true,
                    labeltext: 'password',
                    validation: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a password';
                      } else {
                        return null;
                      }
                    },
                  ),
                ],
              ),
            ),
            box,

            //button to login
            InkWell(
              onTap: () {
                if (loginformkey.currentState!.validate()) {
                  context.read<LoginBloc>().add(Login(
                      usernaame: namecontroller.text.trim(),
                      password: passcontroller.text.trim()));
                }
              },
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.blue[100]),
                width: 150,
                height: 50,
                child: Center(
                  child: Text(
                    'Login',
                    style: acmestyle,
                  ),
                ),
              ),
            ),
            box,

            //or signup
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Dont have an account? ',
                  style: acmestyle,
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (ctx) => SignUpPage()));
                    },
                    child: Text(
                      'Sign Up',
                      style: linkstyle,
                    ))
              ],
            )
          ],
        ),
      ),
    ));
  }
}
