import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:testaapp/presentation/constants%20and%20components/constants.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center( 
        child:Column(
          children: [
            Lottie.asset('asset/loadingbar.json',
            repeat: true),
            box,
            Text('Loading',style: acmestyle,)
          ],
        ) ,
    ));
  }
}