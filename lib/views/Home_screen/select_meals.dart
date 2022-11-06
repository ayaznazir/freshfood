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
                           Text("Select Meals" , style:GoogleFonts.poppins(
                             fontSize: 25,
                             fontWeight: FontWeight.bold,
                           )),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                       Text("Select your 5 meals for this week", style:  GoogleFonts.poppins(
                         color: Colors.grey.shade600,
                         fontSize: 16

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
                          style:  GoogleFonts.poppins(
                            color: Colors.grey.shade600,
                          ),
                          decoration:  const InputDecoration(
                              hintText: "Search",
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(vertical: 18, horizontal: 20),
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
                      SizedBox(
                        height: 50,
                        child: AppBar(
                          elevation: 0.0,
                          backgroundColor: Colors.white,
                          bottom:   TabBar(
                            labelColor: Colors.white,
                            labelStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                            unselectedLabelColor: Colors.grey,
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
                            PastaScreen2(
                              query: _queryText!,
                              people: widget.people,
                              meals: widget.meals,
                              contact: widget.contact,
                              address: widget.address,
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
