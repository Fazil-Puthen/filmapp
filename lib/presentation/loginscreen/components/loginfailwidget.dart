import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginFail extends StatelessWidget {
  const LoginFail({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.error,color: Colors.grey,size: 15,),
        const SizedBox(
          width: 5,
        ),
        Text('Invalid credential', style: GoogleFonts.acme(color: Colors.red)),
      ],
    );
  }
}
