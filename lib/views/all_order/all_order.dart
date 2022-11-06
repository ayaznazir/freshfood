import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fresh_food/constants/app_constant.dart';
import 'package:fresh_food/views/all_order/edit_screen.dart';
import 'package:google_fonts/google_fonts.dart';
class AllOrderScreen extends StatefulWidget {
  const AllOrderScreen({Key? key}) : super(key: key);

  @override
  State<AllOrderScreen> createState() => _AllOrderScreenState();
}

class _AllOrderScreenState extends State<AllOrderScreen> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                const SizedBox(height: 5,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     Text("All Orders" , style: GoogleFonts.poppins(
                        fontSize: 26,
                        fontWeight: FontWeight.bold
                    )),
                    MaterialButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) =>  const EditScreen()));
                    },
                    color: appColor,
                     child: const Text("Edit", style: TextStyle(color: Colors.white),),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    )
                  ],
                ),

                const SizedBox(height: 20,),
               StreamBuilder(
                stream: FirebaseFirestore.instance.collection("totalOrder").snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if(!snapshot.hasData) {
                    return const Center(child: CircularProgressIndicator());
                  }else {
                    return ListView.builder(
                        itemCount: snapshot.data!.docs.length,
                        shrinkWrap: true,
                        physics: const ScrollPhysics(),
                        itemBuilder: (context , index){
                          return Column(
                            children: [
                              Container(
                                width: screenSize.width,
                                height: screenSize.height * 0.54,
                                decoration: BoxDecoration(
                                    color: Colors.grey.shade300
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [

                                       Text(snapshot.data!.docs[index]["name"] , style:GoogleFonts.poppins(
                                           fontSize: 20,
                                           fontWeight: FontWeight.bold
                                       )),
                                       Text(snapshot.data!.docs[index]["email"] , style: GoogleFonts.poppins(
                                           fontSize: 16,
                                       )),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children:  [
                                           Text("Address" , style: GoogleFonts.poppins(
                                            fontSize: 16,
                                          )),
                                          Text(snapshot.data!.docs[index]["address"], style:  GoogleFonts.poppins(
                                            fontSize: 16,
                                          )),

                                        ],
                                      ),

                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children:  [
                                           Text("Phone" , style:  GoogleFonts.poppins(
                                             fontSize: 16,
                                           )),
                                          Text(snapshot.data!.docs[index]["contact"], style:  GoogleFonts.poppins(
                                            fontSize: 16,
                                          )),

                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children:  [
                                           Text("Number of people" , style:  GoogleFonts.poppins(
                                            fontSize: 16,
                                          )),
                                          Text(snapshot.data!.docs[index]["people"].toString(), style:  GoogleFonts.poppins(
                                            fontSize: 16,
                                          )),

                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      const Text("Meals" , style: TextStyle(
                                          color: Colors.black, fontWeight: FontWeight.bold,
                                          fontSize: 20
                                      ),),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                    Container(
                                      width: screenSize.width,
                                      height: 100,
                                      child: ListView.builder(
                                        shrinkWrap: true,
                                        itemCount: snapshot.data!.docs[index]["meals"].length,
                                          itemBuilder: (context , i) {
                                            return Text(snapshot.data!.docs[index]["meals"][i] , style: GoogleFonts.poppins(
                                              fontSize: 16,
                                            ));
                                          }),
                                    ),


                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children:  [
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Text("Order ${snapshot.data!.docs[index]["orderId"]}" , style: const TextStyle(
                                              color: Colors.black, fontWeight: FontWeight.bold,
                                              fontSize: 20
                                          ),),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                            ],
                          );
                        });
                  }
                })



              ],
            ),
          ),
        ),
      ),
    );
  }
}
