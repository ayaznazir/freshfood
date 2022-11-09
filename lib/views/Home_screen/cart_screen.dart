import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fresh_food/views/Home_screen/order_succes.dart';
import 'package:fresh_food/views/Home_screen/pasta_screen2.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/app_constant.dart';
class CartScreen extends StatefulWidget {
  final int people;
  final int meals;
  final String address;
  final String contact;
  const CartScreen({Key? key, required this.people, required this.meals, required this.address, required this.contact}) : super(key: key);


  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int count = 0;
  void add (int index){
    setState(() {
      count++;
    });
  }
  void remove (int index){
    setState(() {
      count--;
    });
  }
  List list = [];
  List list2 = [];
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: ListView(
              scrollDirection: Axis.vertical,
              children: [
                const SizedBox(height: 5,),

                Row(
                  children: [
                    IconButton(onPressed: (){
                      Navigator.pop(context);
                    }, icon: const Icon(Icons.arrow_back, size: 30,)) ,
                    const SizedBox(
                      width: 20,
                    ),
                    Text("Cart Items" , style:  GoogleFonts.poppins(
                        fontSize: 28,
                        fontWeight: FontWeight.bold
                    )),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Text("You selected correctly ", style: GoogleFonts.poppins(
                      fontSize: 13,

                    )),
                    StreamBuilder(
                      stream: FirebaseFirestore.instance.collection("Cart").doc(FirebaseAuth.instance.currentUser!.uid).collection("YourCart").snapshots(),
                      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                          if(!snapshot.hasData){
                            return Text("0");
                          }else{
                          return Text(snapshot.data!.docs.length.toString(), style: GoogleFonts.poppins(
                            fontSize: 13,
                           ));
                        }
                      }
                    ),
                    Text(" meals for this week", style: GoogleFonts.poppins(
                      fontSize: 13,

                    )),
                  ],
                ),

                const SizedBox(
                  height: 20,
                ),
                StreamBuilder(
                    stream: FirebaseFirestore.instance.collection("Cart").doc(FirebaseAuth.instance.currentUser!.uid).collection("YourCart").snapshots(),
                    builder: (context , AsyncSnapshot<QuerySnapshot> snapshot){
                      if(!snapshot.hasData){
                        return Center(child: CircularProgressIndicator());
                      }else {

                       return Container(

                         child : ListView.builder(
                              itemCount: snapshot.data!.docs.length,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              physics: const ScrollPhysics(),
                              itemBuilder: (context , index) {
                              list.add(snapshot.data!.docs[index]["cartName"]);

                                return Column(
                                  children: [
                                    Container(
                                      width: screenSize.width,
                                      height: screenSize.height * 0.2,
                                      decoration: BoxDecoration(
                                        color: Colors.grey.shade300,
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Row(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  width: screenSize.width * 0.36,
                                                  height: screenSize.height * 0.17,
                                                  decoration:  BoxDecoration(
                                                      color: Colors.white,
                                                    borderRadius: BorderRadius.circular(15),
                                                    image: DecorationImage(image: NetworkImage(snapshot.data!.docs[index]["cartImage"]),
                                                    fit: BoxFit.cover)
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 15,
                                                ),
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                     Text(snapshot.data!.docs[index]["cartName"], style: GoogleFonts.poppins(
                                                       fontWeight: FontWeight.bold,
                                                       color: Colors.black,
                                                       fontSize: 20
                                                     )),
                                                    const SizedBox(
                                                      height: 5,
                                                    ),
                                                    Text(snapshot.data!.docs[index]["time"], style: TextStyle(
                                                      color: Colors.grey , fontSize: 15,),),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        InkWell(
                                                          onTap : (){
                                                            logEvent2("recipeData", snapshot.data!.docs[index].id);
                                                            logEvent4("Cart", FirebaseAuth.instance.currentUser!.uid,  "YourCart",snapshot.data!.docs[index].id);


                                                            FirebaseFirestore.instance
                                                                .collection("Cart")
                                                                .doc(FirebaseAuth.instance.currentUser!.uid)
                                                                .collection("YourCart")
                                                                .doc(snapshot.data!.docs[index].id)
                                                                .set({
                                                              "contact" : widget.contact,
                                                              "address" : widget.address,
                                                              "meals" : widget.meals,
                                                              "people" : widget.people,
                                                              "cartId": snapshot.data!.docs[index].id,
                                                              "cartName": snapshot.data!.docs[index]["cartName"],
                                                              "cartImage": snapshot.data!.docs[index]["cartImage"],
                                                              "cartQuantity" :  snapshot.data!.docs[index]["cartQuantity"],
                                                              "time" : snapshot.data!.docs[index]["time"],
                                                              "isAdd":true,
                                                             },
                                                            );

                                                          },
                                                          child: Container(
                                                            width: 40,
                                                            height: 40,
                                                            decoration: BoxDecoration(
                                                              color: Colors.white,
                                                              borderRadius: BorderRadius.circular(20),
                                                            ),
                                                            child: const Center(child: Text("-", style: TextStyle(color: Colors.black, fontSize: 30),)),
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          width: 5,
                                                        ),
                                                        Container(
                                                          width: 60,
                                                          height: 40,
                                                          decoration: BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius: BorderRadius.circular(30),
                                                          ),
                                                          child:  Center(child: Text(snapshot.data!.docs[index]["cartQuantity"].toString(), style: TextStyle(color: Colors.black, fontSize: 15),)),
                                                        ),

                                                        const SizedBox(
                                                          width: 5,
                                                        ),
                                                        InkWell(
                                                          onTap:  (){
                                                            logEvent("recipeData", snapshot.data!.docs[index].id);
                                                            logEvent3("Cart", FirebaseAuth.instance.currentUser!.uid,  "YourCart",snapshot.data!.docs[index].id);


                                                            FirebaseFirestore.instance
                                                                .collection("Cart")
                                                                .doc(FirebaseAuth.instance.currentUser!.uid)
                                                                .collection("YourCart")
                                                                .doc(snapshot.data!.docs[index].id)
                                                                .set({
                                                              "contact" : widget.contact,
                                                              "address" : widget.address,
                                                              "meals" : widget.meals,
                                                              "people" : widget.people,
                                                              "cartId": snapshot.data!.docs[index].id,
                                                              "cartName": snapshot.data!.docs[index]["cartName"],
                                                              "cartImage": snapshot.data!.docs[index]["cartImage"],
                                                              "cartQuantity" :  snapshot.data!.docs[index]["cartQuantity"],
                                                              "time" : snapshot.data!.docs[index]["time"],
                                                              "isAdd":true,
                                                            },
                                                            );




                                                          },
                                                          child: Container(
                                                            width: 40,
                                                            height: 40,
                                                            decoration: BoxDecoration(
                                                              color: Colors.white,
                                                              borderRadius: BorderRadius.circular(20),
                                                            ),
                                                            child: const Center(child: Text("+", style: TextStyle(color: Colors.black, fontSize: 25),)),
                                                          ),
                                                        ),

                                                      ],
                                                    )
                                                  ],
                                                ),

                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    )
                                  ],
                                );
                              }),
                       );
                      }
                    }),
              ],
            ),
          )),
      bottomNavigationBar:  Padding(
        padding: const EdgeInsets.all(15.0),
        child: StreamBuilder(
          stream: FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser!.uid).snapshots(),
          builder: (context, AsyncSnapshot snapshot) {
            return MaterialButton(
              height: 50,
              minWidth: 320,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              color: appColor,
              onPressed: (){
                int randomNumber = random.nextInt(9000) + 1000;
                print(randomNumber);
                FirebaseFirestore.instance.collection("totalOrder").doc(FirebaseAuth.instance.currentUser!.uid).set({
                  "name" : snapshot.data["name"],
                  "email" : snapshot.data["email"],
                  "address" : widget.address,
                  "contact" : widget.contact,
                  "people" : widget.people,
                  "orderId" : "#$randomNumber",
                  "meals" : FieldValue.arrayUnion(list),
                 // "quantity" : list2,


                }).then((value) {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const OrderSuccessScreen()));
                });

              },
              child :  Text("Make the Order", style: GoogleFonts.poppins(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              )),
            );
          }
        ),
      ),
    );
  }
  Random random = Random();



  getUsers() async {
    final snapshot = await FirebaseFirestore.instance.collection("Cart").doc("").collection("shhhwd").get();

    final map = snapshot.docs as Map<dynamic, dynamic>;

    map.forEach((key, value) {
     // list.add(value);
    });




  }

  logEvent(String coll , String id,) async {
    DocumentSnapshot<Object?> snapshot = await FirebaseFirestore.instance.collection(coll).doc(id).get();

    if (snapshot.data() != null) {
      Map<dynamic, dynamic> analyticsData = snapshot.data() as Map<dynamic, dynamic>;
      BeAnalytics analytics = BeAnalytics.fromJson(analyticsData);

      analytics.likes++; //userShares, feedbacks, userRates,
      await FirebaseFirestore.instance.collection(coll).doc(id).update(analytics.toJson());
    } else {
      BeAnalytics analytics = BeAnalytics();
      analytics.likes++; //userShares, feedbacks, userRates,

      await FirebaseFirestore.instance.collection(coll).doc(id).set(analytics.toJson());
    }
  }

  logEvent2(String coll , String id,) async {
    DocumentSnapshot<Object?> snapshot = await FirebaseFirestore.instance.collection(coll).doc(id).get();

    if (snapshot.data() != null) {
      Map<dynamic, dynamic> analyticsData = snapshot.data() as Map<dynamic, dynamic>;
      BeAnalytics analytics = BeAnalytics.fromJson(analyticsData);
      if(analytics.likes == 0){
        print("limit");
      }else{
        analytics.likes--;
      }
      //userShares, feedbacks, userRates,
      await FirebaseFirestore.instance.collection(coll).doc(id).update(analytics.toJson());
    } else {
      BeAnalytics analytics = BeAnalytics();
      if(analytics.likes == 0){
        print("limit");
      }else{
        analytics.likes--;
      } //userShares, feedbacks, userRates,

      await FirebaseFirestore.instance.collection(coll).doc(id).set(analytics.toJson());
    }
  }

  logEvent3(String coll , String id, String col1 , String id1) async {
    DocumentSnapshot<Object?> snapshot = await FirebaseFirestore.instance.collection(coll).doc(id).collection(col1).doc(id1).get();

    if (snapshot.data() != null) {
      Map<dynamic, dynamic> analyticsData = snapshot.data() as Map<dynamic, dynamic>;
      BeAnalytics2 analytics = BeAnalytics2.fromJson(analyticsData);

      analytics.likes++; //userShares, feedbacks, userRates,
      await FirebaseFirestore.instance.collection(coll).doc(id).collection(col1).doc(id1).update(analytics.toJson());
    } else {
      BeAnalytics2 analytics = BeAnalytics2();
      analytics.likes++; //userShares, feedbacks, userRates,

      await FirebaseFirestore.instance.collection(coll).doc(id).collection(col1).doc(id1).set(analytics.toJson());
    }
  }
  logEvent4(String coll , String id, String col1 , String id1) async {
    DocumentSnapshot<Object?> snapshot = await FirebaseFirestore.instance.collection(coll).doc(id).collection(col1).doc(id1).get();

    if (snapshot.data() != null) {
      Map<dynamic, dynamic> analyticsData = snapshot.data() as Map<dynamic, dynamic>;
      BeAnalytics2 analytics = BeAnalytics2.fromJson(analyticsData);
      if(analytics.likes == 0){
        print("limit");
      }else{
        analytics.likes--;
      }
      //userShares, feedbacks, userRates,
      await FirebaseFirestore.instance.collection(coll).doc(id).collection(col1).doc(id1).update(analytics.toJson());

    } else {
      BeAnalytics2 analytics = BeAnalytics2();
      if(analytics.likes == 0){
        print("limit");
      }else{
        analytics.likes--;
      } //userShares, feedbacks, userRates,
      await FirebaseFirestore.instance.collection(coll).doc(id).collection(col1).doc(id1).update(analytics.toJson());

    }
  }
}
