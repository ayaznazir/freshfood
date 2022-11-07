import 'package:flutter/material.dart';
import 'package:fresh_food/views/Home_screen/cart_screen.dart';
import 'package:fresh_food/views/Home_screen/pasta_screen.dart';
import 'package:fresh_food/views/Home_screen/pasta_screen2.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/app_constant.dart';

class SelectMeals extends StatefulWidget {
  final int people;
  final int meals;
  final String address;
  final String contact;
  const SelectMeals({Key? key, required this.people, required this.meals, required this.address, required this.contact}) : super(key: key);

  @override
  State<SelectMeals> createState() => _SelectMealsState();
}

class _SelectMealsState extends State<SelectMeals> {
  String? _queryText = "";
  bool selectedColor = true;
  bool selectedColor1 = false;
  bool selectedColor2 = false;
  bool selectedColor3 = false;
  bool selectedColor4 = false;

  void onSubmitted(String value) {
    setState(() {
      _queryText = value;
    });
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: Stack(
          children: [
            SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: ListView(
                    physics: ScrollPhysics(),
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
                           Text("Select Meals" , style:GoogleFonts.poppins(
                             fontSize: 30,
                             fontWeight: FontWeight.bold,
                           )),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                       Row(
                         children: [
                           Text("Select your ", style:  GoogleFonts.poppins(
                             color: Colors.grey.shade600,
                             fontSize: 16

                           ),),    Text(widget.meals.toString(), style:  GoogleFonts.poppins(
                             color: Colors.grey.shade600,
                             fontSize: 16

                           ),),    Text(" meals for this week ", style:  GoogleFonts.poppins(
                             color: Colors.grey.shade600,
                             fontSize: 16

                           ),),

                         ],
                       ),

                      const SizedBox(height: 15,),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(30),

                        ),
                        child: TextFormField(
                          //    controller: passController,
                          onChanged: onSubmitted,
                          style:  GoogleFonts.poppins(
                            color: Colors.grey.shade600,
                          ),
                          decoration:  const InputDecoration(
                              hintText: "Search",

                              border: InputBorder.none,
                              contentPadding: const EdgeInsets.symmetric(vertical: 13, horizontal: 13),

                              suffixIcon: Padding(
                                padding: EdgeInsets.all(5.0),
                                child: CircleAvatar(
                                  radius: 10,
                                  backgroundColor: Colors.black,
                                  child: Icon(Icons.search, color: Colors.white),
                                ),
                              )
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
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
                      const SizedBox(
                        height: 25,
                      ),

                      selectedColor ?    PastaScreen2(
                        query: _queryText!,
                        people: widget.people,
                        meals: widget.meals,
                        contact: widget.contact,
                        address: widget.address,
                      ) : SizedBox(),
                      selectedColor1 ? Center(child: Text("Breakfast" , style: GoogleFonts.poppins(),)) : SizedBox(),


                      selectedColor2 ? Center(child: Text("Fish" , style: GoogleFonts.poppins(),)) : SizedBox(),

                      selectedColor3 ? Center(child: Text("Pork" , style: GoogleFonts.poppins(),)) : SizedBox(),

                    ],
                  ),
                )),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Positioned(child:  Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    MaterialButton(
                      height: 50,
                      minWidth: 320,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      color: appColor,
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) =>  CartScreen(
                          people: widget.people,
                          meals: widget.meals,
                          address: widget.address,
                          contact: widget.contact,

                        )));

                      },
                      child :Column(
                        children: const [
                          Text("0 / 5", style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold
                          ),),
                          Text("Go to Cart", style: TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.bold
                          ),),
                        ],
                      ),
                    ),
                  ],
                ),
              ),),
            )
          ],
        ),
      ),
    );
  }
}
