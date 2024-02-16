import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testaapp/presentation/constants%20and%20components/constants.dart';
import 'package:testaapp/presentation/homescreen/homescreen.dart';
import 'package:testaapp/presentation/signupscreen/bloc/signup_bloc.dart';
import 'package:testaapp/presentation/signupscreen/components/dropdown.dart';
import 'package:testaapp/presentation/signupscreen/components/formtextfields.dart';
import 'package:testaapp/presentation/signupscreen/components/returntolloginwidget.dart';
import 'package:testaapp/presentation/signupscreen/components/signupbutton.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});

  final signupnamecontroller = TextEditingController();

  final signuppasscontroller = TextEditingController();

  final emailcontroller = TextEditingController();

  final phonecontroller = TextEditingController();

  final formkey = GlobalKey<FormState>();
  // String? selectedprofession;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //signup message
                Text(
                  'Create Account',
                  style: headingstyle,
                ),
                box,

                //Textform
                Formtextfield(signupnamecontroller: signupnamecontroller,
                 signuppasscontroller: signuppasscontroller, 
                 emailcontroller: emailcontroller, 
                 phonecontroller: phonecontroller,
                 formkey: formkey),

                 //Listen to states
               BlocConsumer<SignupBloc, SignupState>(
                listener: (context, state) {
                if(state is SignupSuccess){
                  Navigator.pushAndRemoveUntil(context,
                  MaterialPageRoute(builder: (ctx)=>HomeScreen()),
                  (route) => false);
                }
                else if(state is Signupfail){
                  ScaffoldMessenger.of(context).showMaterialBanner(
                    MaterialBanner(content:Text('Username and password exists',
                    style: GoogleFonts.acme(color: Colors.red),),
                    backgroundColor: Colors.yellow[100],
                     actions:[TextButton(onPressed: (){
                      ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
                     },
                      child: Text('Dismiss',style:GoogleFonts.acme(color: Colors.blueGrey),))]));
                }
                },
                builder: (context, state) {
                  return Container();
                },
               ),
                

                //profession dropdown
                Dropdown(
                  onChanged: (value) => print('the  $value'),
                ),
                box,

                //signupbutton
                InkWell(
                  onTap: () {
                    if (formkey.currentState!.validate()) {
                      final name = signupnamecontroller.text.trim();
                      final password = signuppasscontroller.text.trim();
                      final phone = phonecontroller.text.trim();
                      final email = emailcontroller.text.trim();
                      context.read<SignupBloc>().add(SignUp(
                          mail: email,
                          name: name,
                          phonenumber: phone,
                          password: password,
                          profession: 'to be set'));
                    }
                  },
                  child:const SignupButton()
                ),
                box,

                //go back to login
                const ReturntoLogin()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
