import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
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
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 5,),
                 Text("Get the Best\n"
                    "Food Packs" , style:  GoogleFonts.poppins(
                  color: Colors.black,
                   fontWeight: FontWeight.bold,
                   fontSize: 25
                ),),
                const SizedBox(height: 15,),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
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
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(vertical: 18, horizontal: 20),
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
                  height: 50,
                  minWidth: 350,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  color: appColor,
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const SelectPlanScreen()));
                  },
                  child :const Text("Start New Plan this week", style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                  ),),
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
                SizedBox(
                  height: 50,
                  child: AppBar(
                    toolbarHeight: 40,
                    elevation: 0.0,
                    backgroundColor: Colors.white,
                    bottom:   TabBar(
                      labelColor: Colors.white,
                      labelStyle: GoogleFonts.poppins(
                          color: Colors.grey.shade700,
                        fontWeight: FontWeight.bold,
                        fontSize: 13
                      ),
                      unselectedLabelColor: Colors.grey,
                      isScrollable: false,
                      indicator: BoxDecoration(
                          color: Colors.black,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      tabs: const [
                        Tab(
                         text: "Pasta",
                        ),
                        Tab(
                          text: "Breakfast",
                        ),

                        Tab(
                          text: "Fish",
                        ),

                        Tab(
                          text: "Porks",
                        ),

                      ],
                    ),
                  ),
                ),
               Expanded(
              child: TabBarView(
                children: [
                  // first tab bar view widget
               _queryText == "" ?     StreamBuilder(
                 stream: FirebaseFirestore.instance.collection("recipeData").snapshots(),
                 builder: (context , AsyncSnapshot<QuerySnapshot> snapshot){
                   if(!snapshot.hasData){
                     return const Center(child: CircularProgressIndicator());
                   }else {
                     return  GridView.builder(
                         shrinkWrap: true,
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
                                         Center(
                                           child: MaterialButton(
                                             onPressed: (){
                                               Navigator.push(context, MaterialPageRoute(builder: (context) => ViewMealsScreen(
                                                   image: document["image"], count: 0, name: document["name"], desc: document["description"],
                                                   time:  document["time"], people: 0, meals: 0, address: "", contact: "")));
                                             },
                                             color: Colors.black,
                                             minWidth: 120,
                                             height:40,
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
                             mainAxisSpacing: 5,
                             crossAxisSpacing: 5,
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
                                           child: Text(document["time"], style: GoogleFonts.poppins(
                                               color: Colors.grey.shade600,
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
                                             height:40,
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
               ),


                  // second tab bar viiew widget
                  Container(
                    child: const Center(
                      child: Text(
                        'Breakfast',
                      ),
                    ),
                  ),

                  Container(
                    child: const Center(
                      child: Text(
                        'Fish',
                      ),
                    ),
                  ),

                  Container(
                    child: const Center(
                      child: Text(
                        'Porks',
                      ),
                    ),
                  ),
                ],
              ),
            ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
