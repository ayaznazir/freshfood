import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fresh_food/constants/app_constant.dart';
import 'package:fresh_food/views/Home_screen/view_meals_screen.dart';
class PastaScreen extends StatefulWidget {
  const PastaScreen({Key? key}) : super(key: key);

  @override
  State<PastaScreen> createState() => _PastaScreenState();
}

class _PastaScreenState extends State<PastaScreen> {

FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: StreamBuilder(
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
          )),
    );
  }
}
