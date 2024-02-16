import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testaapp/presentation/constants%20and%20components/constants.dart';

class UserTextfield extends StatelessWidget {
  final  TextEditingController controller;
  final String labeltext;
  final bool hide;
  final String? Function(String?)? validation;
  final TextInputType? input;
  

  const UserTextfield({Key? key,
  required this.validation,
  required this.controller,
  required this.labeltext,
  required this.hide,
  this.input,
  }):super(key:key);
  
  @override
  Widget build(BuildContext context) {
    return   Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextFormField(
              keyboardType:input??TextInputType.name ,
              style: acmestyle,
              obscureText: hide,
              validator:validation ,
              decoration:  InputDecoration(
                labelText: labeltext,
                labelStyle: GoogleFonts.acme(color: Colors.black.withOpacity(0.5)),
                enabledBorder: const OutlineInputBorder(
                  borderSide:BorderSide(color: Colors.black), ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue))
              ),
            ),
          ); 
  }
}