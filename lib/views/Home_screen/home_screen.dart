import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fresh_food/views/Home_screen/pasta_screen.dart';
import 'package:fresh_food/views/Home_screen/select_plan_screen.dart';
import 'package:fresh_food/views/Home_screen/view_meals_screen.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/app_constant.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? _queryText = "";

  void onSubmitted(String value) {
    setState(() {
      _queryText = value;
    });
  }
  bool selectedColor = true;
  bool selectedColor1 = false;
  bool selectedColor2 = false;
  bool selectedColor3 = false;
  bool selectedColor4 = false;
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.white, // navigation bar color
      statusBarColor: Colors.white, // status bar color
      statusBarIconBrightness: Brightness.dark, // status bar icons' color
      systemNavigationBarIconBrightness: Brightness.dark, //navigation bar icons' color
    ));
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: ListView(
              children: [
                const SizedBox(height: 10,),
                 Text("Get the Best\n"
                    "Food Packs" , style:  GoogleFonts.poppins(
                  color: Colors.black,
                   fontWeight: FontWeight.bold,
                   fontSize: 28
                ),),
                const SizedBox(height: 20,),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(30),

                  ),
                  child: TextFormField(
                    //    controller: passController,
                    onChanged: onSubmitted,
                    style: GoogleFonts.poppins(
                        color: Colors.grey.shade600
                    ),
                    decoration:   InputDecoration(
                      hintText: "Search",
                      hintStyle: GoogleFonts.poppins(
                          color: Colors.grey.shade600
                      ),
                        contentPadding: const EdgeInsets.symmetric(vertical: 13, horizontal: 13),
                        border: InputBorder.none,
                      suffixIcon: Padding(
                        padding: EdgeInsets.all(5.0),
                        child: CircleAvatar(
                          radius: 10,
                          child: Icon(Icons.search, color: Colors.white),
                          backgroundColor: Colors.black,
                        ),
                      )
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                MaterialButton(
                  height: 45,
                  minWidth: 350,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  color: appColor,
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const SelectPlanScreen()));
                  },
                  child : Text("Start New Plan this week", style: GoogleFonts.poppins(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  )),
                ),
                const SizedBox(
                  height: 20,
                ),

                 Text("View all", style:  GoogleFonts.poppins(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20
                ),),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 50,
                  decoration: BoxDecoration(

                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: (){
                          setState(() {
                            selectedColor = true;
                            selectedColor1 = false;
                            selectedColor2 = false;
                            selectedColor3 = false;
                            selectedColor4 = false;
                          });
                        },
                        child: selectedColor ? Container(
                          width: 80,
                          height: 40,
                          decoration: BoxDecoration(
                            color:  selectedColor ? Colors.black : Colors.grey,
                            borderRadius: BorderRadius.circular(13),
                          ),
                          child:  Center(child: Text("Pasta",style:GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              color: Colors.white
                          ),)),
                        ) : Container(
                          width: 80,
                          height: 30,
                          child:  Center(child: Text("Pasta", style:GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              color: Colors.grey.shade600
                          ),)),
                        ) ,
                      ),

                      InkWell(
                        onTap: (){
                          setState(() {
                            selectedColor1 = true;
                            selectedColor = false;
                            selectedColor2 = false;
                            selectedColor3 = false;
                            selectedColor4 = false;
                          });
                        },
                        child: selectedColor1 ? Container(
                          width: 90,
                          height: 40,
                          decoration: BoxDecoration(
                            color:  selectedColor1 ? Colors.black : Colors.grey,
                            borderRadius: BorderRadius.circular(13),
                          ),
                          child:  Center(child: Text("Breakfast",style:GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              color: Colors.white
                          ),)),
                        ) : Container(
                          width: 80,
                          height: 30,
                          child:  Center(child: Text("Breakfast", style:GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              color: Colors.grey.shade600
                          ),)),
                        ) ,
                      ),

                      InkWell(
                        onTap: (){
                          setState(() {
                            selectedColor2 = true;
                            selectedColor1 = false;
                            selectedColor = false;
                            selectedColor3 = false;
                            selectedColor4 = false;
                          });
                        },
                        child: selectedColor2 ? Container(
                          width: 65,
                          height: 40,
                          decoration: BoxDecoration(
                            color:  selectedColor2 ? Colors.black : Colors.grey,
                            borderRadius: BorderRadius.circular(13),
                          ),
                          child:  Center(child: Text("Fish",style:GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              color: Colors.white
                          ),)),
                        ) : Container(
                          width: 80,
                          height: 30,
                          child:  Center(child: Text("Fish", style:GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              color: Colors.grey.shade600
                          ),)),
                        ) ,
                      ),

                      InkWell(
                        onTap: (){
                          setState(() {
                            selectedColor3 = true;
                            selectedColor1 = false;
                            selectedColor2 = false;
                            selectedColor = false;
                            selectedColor4 = false;
                          });
                        },
                        child: selectedColor3 ? Container(
                          width: 65,
                          height: 40,
                          decoration: BoxDecoration(
                            color:  selectedColor3 ? Colors.black : Colors.grey,
                            borderRadius: BorderRadius.circular(13),
                          ),
                          child:  Center(child: Text("Pork",style:GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              color: Colors.white
                          ),)),
                        ) : Container(
                          width: 80,
                          height: 30,
                          child:  Center(child: Text("Pork", style:GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              color: Colors.grey.shade600
                          ),)),
                        ) ,
                      ),

                    ],
                  ),
                ),

                SizedBox(
                  height: 15,
                ),
                selectedColor ?      _queryText == "" ?     StreamBuilder(
                  stream: FirebaseFirestore.instance.collection("recipeData").snapshots(),
                  builder: (context , AsyncSnapshot<QuerySnapshot> snapshot){
                    if(!snapshot.hasData){
                      return const Center(child: CircularProgressIndicator());
                    }else {
                      return  GridView.builder(
                          shrinkWrap: true,
                          itemCount: snapshot.data!.docs.length,
                          physics: ScrollPhysics(),
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              childAspectRatio: 0.7,
                              mainAxisSpacing: 15,
                              crossAxisSpacing: 15,
                              crossAxisCount: 2),
                          itemBuilder: (context , index) {
                            DocumentSnapshot document = snapshot.data!.docs[index];
                            return  InkWell(
                              onTap: (){
                                //   Navigator.push(context, MaterialPageRoute(builder: (context) => ShowScreen(
                                //     collection: "maps",
                                //     id: document.id,
                                //     image: document["image"],
                                //     title: "Maps",
                                //     photoTitle: document["title"],
                                //     description: document["description"],
                                //     download:  document["download"].toString(),
                                //     likes:  document["likes"].toString(),
                                //     share:  document["share"].toString(),
                                //   )));
                                //
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
                                      padding: const EdgeInsets.all(10.0),
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
                                            child: Text(document["name"], style:  GoogleFonts.poppins(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                                fontSize: 18
                                            )),
                                          ),
                                          Center(
                                            child: Text(document["time"], style: const TextStyle(
                                                color: Colors.grey , fontSize: 15, ),),
                                          ),
                                          Center(
                                            child: MaterialButton(
                                              onPressed: (){
                                                Navigator.push(context, MaterialPageRoute(builder: (context) => ViewMealsScreen(
                                                    image: document["image"], count: 0, name: document["name"], desc: document["description"],
                                                    time:  document["time"], people: 0, meals: 0, address: "", contact: "")));
                                              },
                                              color: Colors.black,
                                              minWidth: 130,
                                              height:35,
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(10),
                                              ),
                                              child: const Text("More Info", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                                            ),
                                          )

                                        ],
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                            );

                          });
                    }
                  },
                ) :
                StreamBuilder(
                  stream: FirebaseFirestore.instance.collection("recipeData").where("name",isEqualTo: _queryText).snapshots(),
                  builder: (context , AsyncSnapshot<QuerySnapshot> snapshot){
                    if(!snapshot.hasData){
                      return const Center(child: CircularProgressIndicator());
                    }else {
                      return  GridView.builder(
                          shrinkWrap: true,
                          itemCount: snapshot.data!.docs.length,
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              childAspectRatio: 0.7,
                              mainAxisSpacing: 15,
                              crossAxisSpacing: 15,
                              crossAxisCount: 2),
                          itemBuilder: (context , index) {
                            DocumentSnapshot document = snapshot.data!.docs[index];
                            return  InkWell(
                              onTap: (){
                                //   Navigator.push(context, MaterialPageRoute(builder: (context) => ShowScreen(
                                //     collection: "maps",
                                //     id: document.id,
                                //     image: document["image"],
                                //     title: "Maps",
                                //     photoTitle: document["title"],
                                //     description: document["description"],
                                //     download:  document["download"].toString(),
                                //     likes:  document["likes"].toString(),
                                //     share:  document["share"].toString(),
                                //   )));
                                //
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
                                      padding: const EdgeInsets.all(13.0),
                                      child: Container(
                                        width: screenSize.width * 0.4,
                                        height: screenSize.width * 0.3,
                                        decoration: BoxDecoration(
                                          color: Colors.grey,
                                          borderRadius: BorderRadius.circular(10),
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
                                            child: Text(document["name"], style:  GoogleFonts.poppins(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                                fontSize: 18
                                            )),
                                          ),
                                          Center(
                                            child: Text(document["time"], style: TextStyle(
                                              color: Colors.grey,
                                            ),),
                                          ),
                                          Center(
                                            child: MaterialButton(
                                              onPressed: (){
                                                Navigator.push(context, MaterialPageRoute(builder: (context) => ViewMealsScreen(
                                                    image: document["image"], count: 0, name: document["name"], desc: document["description"],
                                                    time:  document["time"], people: 0, meals: 0, address: "", contact: "")));
                                              },
                                              color: Colors.black,
                                              minWidth: 120,
                                              height:35,
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(10),
                                              ),
                                              child: const Text("More Info", style: TextStyle(color: Colors.white),),
                                            ),
                                          )

                                        ],
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                            );

                          });
                    }
                  },
                ) : SizedBox(),

                selectedColor1 ? Center(child: Text("Breakfast" , style: GoogleFonts.poppins(),)) : SizedBox(),


                selectedColor2 ? Center(child: Text("Fish" , style: GoogleFonts.poppins(),)) : SizedBox(),

                selectedColor3 ? Center(child: Text("Pork" , style: GoogleFonts.poppins(),)) : SizedBox(),





              ],
            ),
          ),
        ),
      ),
    );
  }
}
