import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testaapp/presentation/constants%20and%20components/constants.dart';

class Traileralert extends StatelessWidget {
  const Traileralert({super.key});

  @override
  Widget build(BuildContext context) {
    final screenwidth=MediaQuery.of(context).size.width;
    final screenheight=MediaQuery.of(context).size.height;
    return Container(
      width: 200,
      height: 200,
      // color: Colors.white,
      child: Center(child: Container(
        width:screenwidth*0.7 ,
        height: screenheight*0.1,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.white,
        ),
        child: Center(
          child: Text('! Trailer data not availabale in API',
          style: GoogleFonts.acme(color: Colors.red),),
        ),
      ),),
    );
  }
}