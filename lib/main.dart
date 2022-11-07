import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:fresh_food/constants/app_constant.dart';
import 'views/auth_screen/splash_screen.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.white, // navigation bar color
    statusBarColor: Colors.white, // status bar color
    statusBarIconBrightness: Brightness.dark, // status bar icons' color
    systemNavigationBarIconBrightness: Brightness.dark, //navigation bar icons' color
  ));

  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        title: 'Fresh Food',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          appBarTheme: Theme.of(context)
              .appBarTheme
              .copyWith(brightness: Brightness.dark),
        ),
        home: const SplashScreen(),
    );
  }
}

