import 'package:flutter/material.dart';
import 'package:fresh_food/constants/app_constant.dart';
import 'package:fresh_food/views/Home_screen/weeekly_plan_screen.dart';
import 'package:fresh_food/views/bottom_navigation/bottom_navigation.dart';

class OrderSuccessScreen extends StatefulWidget {
  const OrderSuccessScreen({Key? key}) : super(key: key);

  @override
  State<OrderSuccessScreen> createState() => _OrderSuccessScreenState();
}

class _OrderSuccessScreenState extends State<OrderSuccessScreen> {

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2) , (){
      Navigator.push(context, MaterialPageRoute(builder: (context) => MainPage()));
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
        children: const [
          Center(
            child: Text("Order" , style: TextStyle(
                color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold
            ),),
          ),
          Center(
            child: Text("Successful" , style: TextStyle(
                color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold
            ),),
          )
        ],
      )
      ),
    );
  }
}
