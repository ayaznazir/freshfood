import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fresh_food/views/all_order/all_order.dart';
import 'package:fresh_food/views/bottom_navigation/bottom_navigation.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AppServices {

  Future<User?> login(String email , String password,  context)async{
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      // ignore: unnecessary_null_comparison
      if(userCredential != null){
        if (kDebugMode) {
          print("Login SuccessFul");
        }
        Fluttertoast.showToast(msg: "Login SuccessFul");
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder:  (context) => const MainPage()), (route) => false);
      }else{
        if (kDebugMode) {
          print("user not found");
        }
        Fluttertoast.showToast(msg: "No user found for that email.");
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        if (kDebugMode) {
          print('No user found for that email.');
        }
        Fluttertoast.showToast(msg: "No user found for that email.");
      } else if (e.code == 'wrong-password') {
        if (kDebugMode) {
          print('Wrong password provided for that user.');
        }
        Fluttertoast.showToast(msg: "Wrong password provided for that user.");
      }
    }
    return null;
  }
  Future<User?> adminLogin(String email , String password,  context)async{
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      // ignore: unnecessary_null_comparison
      if(userCredential != null){
        if (kDebugMode) {
          print("Login SuccessFul");
        }
        Fluttertoast.showToast(msg: "Login SuccessFul");
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder:  (context) => const AllOrderScreen()), (route) => false);
      }else{
        if (kDebugMode) {
          print("user not found");
        }
        Fluttertoast.showToast(msg: "No user found for that email.");
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        if (kDebugMode) {
          print('No user found for that email.');
        }
        Fluttertoast.showToast(msg: "No user found for that email.");
      } else if (e.code == 'wrong-password') {
        if (kDebugMode) {
          print('Wrong password provided for that user.');
        }
        Fluttertoast.showToast(msg: "Wrong password provided for that user.");
      }
    }
    return null;
  }
  Future<User?> signUp(String name , String email, String password, context)async{
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email:email,
        password: password,
      );
      // ignore: unnecessary_null_comparison
      if(userCredential != null){
        Fluttertoast.showToast(msg: "Congratulation your account has been Created");
        await firestore.collection("users").doc(FirebaseAuth.instance.currentUser!.uid).set({
          "name" : name,
          "email": email,
          "password" : password,
          "contact" : "",
          "address" : ""
        });


        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder:  (context) => const MainPage()), (route) => false);
      }else{
        if (kDebugMode) {
          print("Account Created");
        }
      }
    }on FirebaseAuthException catch (e) {


      if (e.code == 'weak-password') {
        if (kDebugMode) {
          print('The password provided is too weak.');
        }
        Fluttertoast.showToast(msg: "The password provided is too weak.");

      } else if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(customSnackBar(content: "The account already exists for that email"));
        if (kDebugMode) {
          Fluttertoast.showToast(msg: "The account already exists for that email.");

          print('The account already exists for that email.');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }

    }
    return null;
  }

  static UploadTask? uploadFile(String destination, File file) {
    try {
      final ref = FirebaseStorage.instance.ref(destination);

      return ref.putFile(file);
    } on FirebaseException catch (e) {
      return null;
    }
  }



  static SnackBar customSnackBar({@required String? content}) {
    return SnackBar(
      backgroundColor: Colors.black,
      content: Text(
        content!,
        style: const TextStyle(color: Colors.white, letterSpacing: 0.3),
      ),
      margin: const EdgeInsets.all(25.0),
      behavior: SnackBarBehavior.floating,
    );
  }
}