import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fresh_food/constants/app_constant.dart';
import 'package:fresh_food/views/Home_screen/order_succes.dart';
import 'package:fresh_food/views/Home_screen/pasta_screen2.dart';
import 'package:fresh_food/views/all_order/all_order.dart';
import 'package:google_fonts/google_fonts.dart';

class WeeklyPlan extends StatefulWidget {
  const WeeklyPlan({Key? key}) : super(key: key);

  @override
  State<WeeklyPlan> createState() => _WeeklyPlanState();
}

class _WeeklyPlanState extends State<WeeklyPlan> {

  List list = [];
  int count = 0;
  String? address = "";
  int? people;
  String? contact = "";


  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
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
                color: Colors.black,
                onPressed: (){
                  int randomNumber = random.nextInt(9000) + 1000;
                  print(randomNumber);
                  FirebaseFirestore.instance.collection("totalOrder").doc(FirebaseAuth.instance.currentUser!.uid).set({
                    "name" : snapshot.data["name"],
                    "email" : snapshot.data["email"],
                    "address" : address,
                    "contact" : contact,
                    "people" : people,
                    "orderId" : "#$randomNumber",
                    "meals" : FieldValue.arrayUnion(list),
                    // "quantity" : list2,


                  }).then((value) {
                    Fluttertoast.showToast(msg: "updated Successfully");
                   // Navigator.push(context, MaterialPageRoute(builder: (context) => const AllOrderScreen()));
                  });

                },
                child : const Text("Edit the Order", style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                ),),
              );
            }
        ),
      ),
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: ListView(
              children: [
                const SizedBox(height: 5,),

                Row(
                  children: [
                     Text("Weekly Plan" , style:  GoogleFonts.poppins(
                         fontSize: 26,
                         fontWeight: FontWeight.bold
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
                                address = snapshot.data!.docs[index]["address"];
                                contact = snapshot.data!.docs[index]["contact"];
                                people = snapshot.data!.docs[index]["people"];
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
                                                      height: 15,
                                                    ),
                                                    Text(snapshot.data!.docs[index]["cartName"], style: TextStyle(
                                                        color: Colors.black, fontWeight: FontWeight.bold,
                                                        fontSize: 20
                                                    ),),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    Text(snapshot.data!.docs[index]["time"], style: TextStyle(color: Colors.grey, fontSize: 15),),
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
                                                          width: 50,
                                                          height: 40,
                                                          decoration: BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius: BorderRadius.circular(10),
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
    );
  }
  Random random =  Random();

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
        await FirebaseFirestore.instance.collection(coll).doc(id).collection(col1).doc(id1).delete();

      }else{

        analytics.likes--;
      }
      //userShares, feedbacks, userRates,
      await FirebaseFirestore.instance.collection(coll).doc(id).collection(col1).doc(id1).update(analytics.toJson());

    } else {
      BeAnalytics2 analytics = BeAnalytics2();
      if(analytics.likes == 0){
        print("limit");
        await FirebaseFirestore.instance.collection(coll).doc(id).collection(col1).doc(id1).delete();

      }else{
        analytics.likes--;
      } //userShares, feedbacks, userRates,
      await FirebaseFirestore.instance.collection(coll).doc(id).collection(col1).doc(id1).update(analytics.toJson());

    }
  }

}
