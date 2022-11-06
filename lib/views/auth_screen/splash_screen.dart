import 'package:flutter/material.dart';
import 'package:fresh_food/constants/app_constant.dart';
import 'package:google_fonts/google_fonts.dart';

import 'login_screen.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2) , (){
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => LoginScreen()), (route) => false);
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appColor,
      body: SafeArea(child:
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children:  [
          Center(
            child: Text("Fresh Food" , style: GoogleFonts.poppins(
                color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold
            ), /* TextStyle(
              color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold
            ),*/),
          )
        ],
      )
      ),
    );
  }
}
