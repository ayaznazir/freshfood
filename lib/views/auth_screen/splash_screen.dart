import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const LoginScreen()), (route) => false);
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: appColor,
      appBar: AppBar(
          backgroundColor: appColor,
          elevation: 0,
          brightness: Brightness.dark,
        systemOverlayStyle: const SystemUiOverlayStyle(
          systemNavigationBarColor: Colors.white, // navigation bar color
          statusBarColor: appColor, // status bar color
          statusBarIconBrightness: Brightness.dark, // status bar icons' color
          systemNavigationBarIconBrightness: Brightness.dark, //navigation bar icons' color
        ),
      ),
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
