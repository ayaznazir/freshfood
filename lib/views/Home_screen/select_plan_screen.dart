
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fresh_food/constants/app_constant.dart';
import 'package:fresh_food/views/Home_screen/select_meals.dart';
import 'package:google_fonts/google_fonts.dart';
class SelectPlanScreen extends StatefulWidget {
  const SelectPlanScreen({Key? key}) : super(key: key);

  @override
  State<SelectPlanScreen> createState() => _SelectPlanScreenState();
}

class _SelectPlanScreenState extends State<SelectPlanScreen> {
  bool people = true;
  bool people1 = false;
  bool people2 = false;
  bool people3 = false;
  bool people4 = false;
  bool people5 = false;

  bool meal = true;
  bool meal1 = false;
  bool meal2 = false;
  bool meal3 = false;
  bool meal4 = false;
  bool meal5 = false;

  int mealNum = 1;
  int peepleNum = 1;

  var addressController = TextEditingController();
  var contactController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                     Text("Select Plan" , style: GoogleFonts.poppins(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    )),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                 Text("1. Number of People", style: GoogleFonts.poppins(
                    color: Colors.grey.shade600,
                   fontSize: 15
                ),),

                const SizedBox(
                  height: 15,
                ),
                Container(
                  width: screenSize.width,
                  height: screenSize.height * 0.08,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            people = true;
                            people1 = false;
                            people2 = false;
                            people3 = false;
                            people4 = false;
                            people5 = false;
                            peepleNum = 1;
                          });

                        },
                        child: Container(
                          width: screenSize.width * 0.15 ,
                          height: screenSize.height * 0.08,
                          decoration: BoxDecoration(
                            color:people ? appColor : Colors.grey.shade300,
                          ),
                          child: Center(child:  Text("1", style: TextStyle(color:  people ? Colors.white : Colors.black, fontSize: 20),)),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {

                            people1 = true;
                            people = false;
                            people2 = false;
                            people3 = false;
                            people4 = false;
                            people5 = false;
                            peepleNum = 2;
                          });

                        },
                        child: Container(
                          width: screenSize.width * 0.15 ,
                          height: screenSize.height * 0.08,
                          decoration: BoxDecoration(
                              color:people1 ? appColor : Colors.grey.shade300
                          ),
                          child: Center(child:  Text("2", style: TextStyle(color:  people1 ? Colors.white : Colors.black, fontSize: 20),)),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            people2 = true;
                            people1 = false;
                            people = false;
                            people3 = false;
                            people4 = false;
                            people5 = false;
                            peepleNum = 3;
                          });

                        },
                        child: Container(
                          width: screenSize.width * 0.15 ,
                          height: screenSize.height * 0.08,
                          decoration: BoxDecoration(
                              color: people2 ? appColor : Colors.grey.shade300
                          ),
                          child: Center(child:  Text("3", style: TextStyle(color:  people2 ? Colors.white : Colors.black, fontSize: 20),)),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            people3 = true;
                            people2 = false;
                            people1 = false;
                            people = false;
                            people4 = false;
                            people5 = false;
                            peepleNum = 4;
                          });

                        },
                        child: Container(
                          width: screenSize.width * 0.15 ,
                          height: screenSize.height * 0.08,
                          decoration: BoxDecoration(
                              color: people3 ? appColor : Colors.grey.shade300
                          ),
                          child: Center(child:  Text("4", style: TextStyle(color:  people3 ? Colors.white : Colors.black, fontSize: 20),)),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            people4 = true;
                            people3 = false;
                            people2 = false;
                            people1 = false;
                            people = false;

                            people5 = false;
                            peepleNum = 5;
                          });

                        },
                        child: Container(
                          width: screenSize.width * 0.15 ,
                          height: screenSize.height * 0.08,
                          decoration: BoxDecoration(
                              color: people4 ? appColor : Colors.grey.shade300
                          ),
                          child: Center(child:  Text("5", style: TextStyle(color: people4 ? Colors.white : Colors.black, fontSize: 20),)),
                        ),
                      ),

                      InkWell(
                        onTap: () {
                          setState(() {
                            people5 = true;
                            people4 = false;
                            people3 = false;
                            people2 = false;
                            people1 = false;
                            people = false;


                            peepleNum = 6;
                          });

                        },

                        child: Container(
                          width: screenSize.width * 0.16 ,
                          height: screenSize.height * 0.08,
                          decoration: BoxDecoration(
                              color: people5 ? appColor : Colors.grey.shade300
                          ),
                          child: Center(child:  Text("6", style: TextStyle(color:  people5 ? Colors.white : Colors.black, fontSize: 20),)),
                        ),
                      )
                    ],
                  ),
                ),


                const SizedBox(
                  height: 20,
                ),
                 Text("2. Meals per week", style:GoogleFonts.poppins(
                    color: Colors.grey.shade600,
                    fontSize: 15
                ),),

                const SizedBox(
                  height: 15,
                ),
                Container(
                  width: screenSize.width,
                  height: screenSize.height * 0.08,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            meal = true;
                            meal1 = false;
                            meal2 = false;
                            meal3 = false;
                            meal4 = false;
                            meal5 = false;
                            mealNum = 1;
                          });

                        },
                        child: Container(
                          width: screenSize.width * 0.15 ,
                          height: screenSize.height * 0.08,
                          decoration: BoxDecoration(
                            color:meal ? appColor : Colors.grey.shade300,
                          ),
                          child: Center(child:  Text("1", style: TextStyle(color:  meal ? Colors.white : Colors.black, fontSize: 20),)),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            meal1 = true;
                            meal = false;
                            meal2 = false;
                            meal3 = false;
                            meal4 = false;
                            meal5 = false;
                            mealNum = 2;
                          });

                        },
                        child: Container(
                          width: screenSize.width * 0.15 ,
                          height: screenSize.height * 0.08,
                          decoration: BoxDecoration(
                              color:meal1 ? appColor : Colors.grey.shade300
                          ),
                          child: Center(child:  Text("2", style: TextStyle(color:  meal1 ? Colors.white : Colors.black, fontSize: 20),)),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            meal2 = true;
                            meal1 = false;
                            meal = false;

                            meal3 = false;
                            meal4 = false;
                            meal5 = false;
                            mealNum = 3;
                          });

                        },
                        child: Container(
                          width: screenSize.width * 0.15 ,
                          height: screenSize.height * 0.08,
                          decoration: BoxDecoration(
                              color: meal2 ? appColor : Colors.grey.shade300
                          ),
                          child: Center(child:  Text("3", style: TextStyle(color:  meal2 ? Colors.white : Colors.black, fontSize: 20),)),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            meal3 = true;
                            meal2 = false;
                            meal1 = false;
                            meal = false;

                            meal4 = false;
                            meal5 = false;
                            mealNum = 4;
                          });

                        },
                        child: Container(
                          width: screenSize.width * 0.15 ,
                          height: screenSize.height * 0.08,
                          decoration: BoxDecoration(
                              color: meal3 ? appColor : Colors.grey.shade300
                          ),
                          child: Center(child:  Text("4", style: TextStyle(color:  meal3 ? Colors.white : Colors.black, fontSize: 20),)),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            meal4 = true;
                            meal3 = false;
                            meal2 = false;
                            meal1 = false;
                            meal = false;

                            meal5 = false;
                            mealNum = 5;
                          });

                        },
                        child: Container(
                          width: screenSize.width * 0.15 ,
                          height: screenSize.height * 0.08,
                          decoration: BoxDecoration(
                              color: meal4 ? appColor : Colors.grey.shade300
                          ),
                          child: Center(child:  Text("5", style: TextStyle(color: meal4 ? Colors.white : Colors.black, fontSize: 20),)),
                        ),
                      ),

                      InkWell(
                        onTap: () {
                          setState(() {
                            meal5 = true;
                            meal4 = false;
                            meal3 = false;
                            meal2 = false;
                            meal1 = false;
                            meal = false;


                            mealNum = 6;
                          });

                        },

                        child: Container(
                          width: screenSize.width * 0.16 ,
                          height: screenSize.height * 0.08,
                          decoration: BoxDecoration(
                              color: meal5 ? appColor : Colors.grey.shade300
                          ),
                          child: Center(child:  Text("6", style: TextStyle(color:  meal5 ? Colors.white : Colors.black, fontSize: 20),)),
                        ),
                      )
                    ],
                  ),
                ),

                const SizedBox(
                  height: 20,
                ),
                Text("3. Your address", style  :GoogleFonts.poppins(
                    color: Colors.grey.shade600,
                    fontSize: 15
                ),),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10),

                  ),
                  child: TextFormField(
                    controller: addressController,
                    keyboardType: TextInputType.emailAddress,
                    style: GoogleFonts.poppins(
                      color: Colors.grey.shade600,
                  ),

                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(vertical: 13, horizontal: 13),

                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.grey.shade200)
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.grey.shade200),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                 Text("4. Contact Phone Number", style:GoogleFonts.poppins(
                    color: Colors.grey.shade600,
                    fontSize: 15
                ),),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10),

                  ),
                  child: TextFormField(
                    controller: contactController,
                    keyboardType: TextInputType.emailAddress,
                    style: GoogleFonts.poppins(
                        color: Colors.grey.shade600,

                    ),
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(vertical: 13, horizontal: 13),

                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.grey.shade200)
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.grey.shade200),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:  [
                    Text("Total" , style: GoogleFonts.poppins(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    )),

                    Text("S/10" , style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold,
                        fontSize: 24
                    ),),
                  ],
                ),

                const SizedBox(height: 10,),
                Text("You can pay with card , cash or transfer when your order arrive", style: GoogleFonts.poppins(
                    color: Colors.grey.shade600,
                    fontSize: 15
                ),),

                const SizedBox(height: 20,),
                MaterialButton(
                  height: 50,
                  minWidth: 320,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  color: appColor,
                  onPressed: (){
                    if(addressController.text.isEmpty){
                      Fluttertoast.showToast(msg: "Please enter address");
                    }else if(contactController.text.isEmpty){
                      Fluttertoast.showToast(msg: "Please enter phone number");
                    }else {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        Navigator.push(context, MaterialPageRoute(builder: (context) =>  SelectMeals(
                          people: peepleNum,
                          meals: mealNum,
                          address: addressController.text,
                          contact: contactController.text,
                        )));
                      });

                    }
                  },
                  child : Text("Continue", style:  GoogleFonts.poppins(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
