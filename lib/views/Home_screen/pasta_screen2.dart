import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fresh_food/constants/app_constant.dart';
import 'package:fresh_food/views/Home_screen/view_meals_screen.dart';
import 'package:google_fonts/google_fonts.dart';
class PastaScreen2 extends StatefulWidget {
  final int people;
  final int meals;
  final String address;
  final String contact;
  final String query;
  const PastaScreen2({Key? key, required this.people, required this.meals, required this.address, required this.contact, required this.query}) : super(key: key);

  @override
  State<PastaScreen2> createState() => _PastaScreen2State();
}

class _PastaScreen2State extends State<PastaScreen2> {

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  var count = 0;
  void add (int index){
    setState(() {
      count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: widget.query == "" ? StreamBuilder(
            stream: FirebaseFirestore.instance.collection("recipeData").snapshots(),
            builder: (context , AsyncSnapshot<QuerySnapshot> snapshot){
              if(!snapshot.hasData){
                return const Center(child: CircularProgressIndicator());
              }else {
                return  Container(
                  width: screenSize.width,
                  height: screenSize.height * 0.5,
                  child: GridView.builder(
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      itemCount: snapshot.data!.docs.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: 0.7,
                          mainAxisSpacing: 5,
                          crossAxisSpacing: 5,
                          crossAxisCount: 2),
                      itemBuilder: (context , index) {
                        DocumentSnapshot document = snapshot.data!.docs[index];
                        return  InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) =>  ViewMealsScreen(
                              count: count,
                              image: document["image"],
                              name: document["name"],
                              desc: document["description"],
                              time: document["time"],
                              people: widget.people,
                              meals: widget.meals,
                              address: widget.address,
                              contact: widget.contact,

                            )));
                          },
                          child: Container(
                            width: screenSize.width * 0.4,
                            height: screenSize.width * 0.6,
                            decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(12)
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    width: screenSize.width * 0.4,
                                    height: screenSize.width * 0.3,
                                    decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(12),
                                      image:  DecorationImage(image: NetworkImage(document["image"]),
                                          fit: BoxFit.cover
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8 , right: 8),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Center(
                                        child: Text(document["name"], style: const TextStyle(
                                            color: Colors.black , fontSize: 15, fontWeight: FontWeight.bold),),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),

                                      Center(
                                        child: Text(document["time"], style: const TextStyle(
                                            color: Colors.grey , fontSize: 15, fontWeight: FontWeight.bold),),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          InkWell(
                                            onTap: (){
                                              if (count == 1) {
                                                Fluttertoast.showToast(
                                                  msg:
                                                  "You reach minimum limit",

                                                );
                                              } else {

                                                logEvent2("recipeData", document.id);
                                                logEvent4("Cart", FirebaseAuth.instance.currentUser!.uid,  "YourCart",document.id);


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
                                                  "cartName": snapshot.data!.docs[index]["name"],
                                                  "cartImage": snapshot.data!.docs[index]["image"],
                                                  "time" : snapshot.data!.docs[index]["time"],
                                                  "cartQuantity" : snapshot.data!.docs[index]["count"],
                                                  "isAdd":true,
                                                },
                                                );



                                              }
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
                                          Container(
                                            width: 50,
                                            height: 40,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.circular(10),
                                            ),
                                            child:  Center(child:Text(document['count'].toString(), style: TextStyle(color: Colors.black, fontSize: 15),)
                                            ),
                                          ),
                                          InkWell(
                                            onTap: (){
                                              logEvent("recipeData", document.id,);
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
                                                "cartName": snapshot.data!.docs[index]["name"],
                                                "cartImage": snapshot.data!.docs[index]["image"],
                                                "time" : snapshot.data!.docs[index]["time"],
                                                "cartQuantity" : snapshot.data!.docs[index]["count"],
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
                                ),

                              ],
                            ),
                          ),
                        );

                      }),
                );
              }
            },
          ) :
          StreamBuilder(
            stream: FirebaseFirestore.instance.collection("recipeData").where("name", isEqualTo : widget.query).snapshots(),
            builder: (context , AsyncSnapshot<QuerySnapshot> snapshot){
              if(!snapshot.hasData){
                return const Center(child: CircularProgressIndicator());
              }else {
                return  Container(
                  width: screenSize.width,
                  height: screenSize.height * 0.5,
                  child: GridView.builder(
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      itemCount: snapshot.data!.docs.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: 0.7,
                          mainAxisSpacing: 5,
                          crossAxisSpacing: 5,
                          crossAxisCount: 2),
                      itemBuilder: (context , index) {
                        DocumentSnapshot document = snapshot.data!.docs[index];
                        return  InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) =>  ViewMealsScreen(
                              count: count,
                              image: document["image"],
                              name: document["name"],
                              desc: document["description"],
                              time: document["time"],
                              people: widget.people,
                              meals: widget.meals,
                              address: widget.address,
                              contact: widget.contact,

                            )));
                          },
                          child: Container(
                            width: screenSize.width * 0.4,
                            height: screenSize.width * 0.6,
                            decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(12)
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    width: screenSize.width * 0.4,
                                    height: screenSize.width * 0.3,
                                    decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(12),
                                      image:  DecorationImage(image: NetworkImage(document["image"]),
                                          fit: BoxFit.cover
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8 , right: 8),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Center(
                                        child: Text(document["name"], style: const TextStyle(
                                            color: Colors.black , fontSize: 15, fontWeight: FontWeight.bold),),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),

                                      Center(
                                        child: Text(document["time"], style: const TextStyle(
                                            color: Colors.black , fontSize: 15, fontWeight: FontWeight.bold),),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          InkWell(
                                            onTap: (){
                                              if (count == 1) {
                                                Fluttertoast.showToast(
                                                  msg:
                                                  "You reach minimum limit",

                                                );
                                              } else {

                                                logEvent2("recipeData", document.id);
                                                logEvent4("Cart", FirebaseAuth.instance.currentUser!.uid,  "YourCart",document.id);


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
                                                  "cartName": snapshot.data!.docs[index]["name"],
                                                  "cartImage": snapshot.data!.docs[index]["image"],
                                                  "time" : snapshot.data!.docs[index]["time"],
                                                  "cartQuantity" : snapshot.data!.docs[index]["count"],
                                                  "isAdd":true,
                                                },
                                                );



                                              }
                                            },
                                            child: Container(
                                              width: 40,
                                              height: 40,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.circular(20),
                                              ),
                                              child:  Center(child: Text("-", style:  GoogleFonts.poppins(
                                                color: Colors.grey.shade600,
                                                fontStyle: FontStyle.normal

                                              ), )),
                                            ),
                                          ),
                                          Container(
                                            width: 50,
                                            height: 40,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.circular(10),
                                            ),
                                            child:  Center(child:Text(document['count'].toString(), style: TextStyle(color: Colors.black, fontSize: 15),)
                                            ),
                                          ),
                                          InkWell(
                                            onTap: (){
                                              logEvent("recipeData", document.id,);
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
                                                "cartName": snapshot.data!.docs[index]["name"],
                                                "cartImage": snapshot.data!.docs[index]["image"],
                                                "time" : snapshot.data!.docs[index]["time"],
                                                "cartQuantity" : snapshot.data!.docs[index]["count"],
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
                                ),

                              ],
                            ),
                          ),
                        );

                      }),
                );
              }
            },
          )
      ),
    );
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

/*StreamBuilder<Object>(
                                            stream: FirebaseFirestore.instance.collection("Cart")
                                                .doc(FirebaseAuth.instance.currentUser!.uid).collection("YourCart").doc(snapshot.data!.docs[index].id).snapshots(),
                                            builder: (context,AsyncSnapshot snapshot) {
                                              if(!snapshot.hasData){
                                                return const Text("");
                                              }else {
                                                return Text(snapshot.data["cartQuantity"].toString(), style: const TextStyle(color: Colors.black, fontSize: 15),);
                                              }


                                            }
                                          )*/


class BeAnalytics2 {
  int likes = 0;

  BeAnalytics2(
      {this.likes = 0,
      });

  BeAnalytics2.fromJson(Map<dynamic, dynamic> json) {
    likes = json["cartQuantity"] ?? 0;

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["cartQuantity"] = likes;
    return data;
  }
}

class BeAnalytics {
  int likes = 0;

  BeAnalytics(
      {this.likes = 0,
      });

  BeAnalytics.fromJson(Map<dynamic, dynamic> json) {
    likes = json["count"] ?? 0;

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["count"] = likes;
    return data;
  }
}
