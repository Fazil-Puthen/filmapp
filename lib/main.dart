import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testaapp/presentation/homescreen/bloc/home_bloc.dart';
import 'package:testaapp/presentation/loginscreen/bloc/login_bloc.dart';
import 'package:testaapp/presentation/loginscreen/loginpage.dart';
import 'package:testaapp/presentation/signupscreen/bloc/signup_bloc.dart';
import 'package:testaapp/presentation/splashscreen/splashscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SignupBloc(),
        ),
        BlocProvider(
          create: (context) => LoginBloc(),
          child: Container(),
        ),
           BlocProvider(
          create: (context) => HomeBloc(),
          child: Container(),
        ),
        
      ],
        child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: LoginPage(),
      ),
    );
  }
}

