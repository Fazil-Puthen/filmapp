import 'package:flutter/material.dart';
import 'package:testaapp/presentation/constants%20and%20components/constants.dart';

class ReturntoLogin extends StatelessWidget {
  const ReturntoLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Have an account? ',
          style: acmestyle,
        ),
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              'Login',
              style: linkstyle,
            ))
      ],
    );
  }
}
