import 'package:flutter/material.dart';
import 'package:testaapp/presentation/constants%20and%20components/constants.dart';

class SignupButton extends StatelessWidget {
  const SignupButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8), color: Colors.blue[100]),
      width: 150,
      height: 50,
      child: Center(
        child: Text(
          'sign in',
          style: acmestyle,
        ),
      ),
    );
  }
}
