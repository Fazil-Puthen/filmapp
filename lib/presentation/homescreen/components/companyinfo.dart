import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testaapp/presentation/constants%20and%20components/constants.dart';

class Companyinfowidget extends StatelessWidget {
  const Companyinfowidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      elevation: 100,
      shadowColor: Colors.black,
      title: Text('Company Info',style: GoogleFonts.acme(color: Colors.blue),),
      content: Column(mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
        children: [Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Text('Company :',style: acmeboldstyle,),
          Text('Geeksynergy Technologies',style: acmestyle,)],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Text('Address :',style: acmeboldstyle,),
          Text('Sanjayanagr, Bengaluru-56',style: acmestyle,)],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Text('Phone :',style: acmeboldstyle,),
          Text('XXXXXXXXX9',style: acmestyle,)],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Text('Email :',style: acmeboldstyle,),
          Text('XXXXX@gmail.com',style: acmestyle,)],
        ),],
      ),
    );
  }
}