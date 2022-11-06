import 'package:flutter/material.dart';
import 'package:fresh_food/constants/app_constant.dart';
import 'package:fresh_food/views/Home_screen/cart_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class ViewMealsScreen extends StatefulWidget {
  final String image;
  final int count;
  final String name;
  final String desc;
  final String time;
  final int people;
  final int meals;
  final String address;
  final String contact;
  const ViewMealsScreen({Key? key, required this.image, required this.count, required this.name, required this.desc, required this.time, required this.people, required this.meals, required this.address, required this.contact}) : super(key: key);

  @override
  State<ViewMealsScreen> createState() => _ViewMealsScreenState();
}

class _ViewMealsScreenState extends State<ViewMealsScreen> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(onPressed: (){
                  Navigator.pop(context);
                }, icon: const Icon(Icons.arrow_back)),
                Center(
                  child: CircleAvatar(
                    radius: 100,
                    backgroundColor: Colors.grey,
                    backgroundImage: NetworkImage(widget.image),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Center(
                  child: Container(
                    width: 120,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child:    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(onPressed: (){
                          if(count <1){

                          }else{
                            setState(() {
                              count--;
                            });
                          }
                        }, icon: Icon(Icons.remove, color: Colors.white, size: 20,)),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(child: Text(count.toString(), style: TextStyle(color: Colors.white, fontSize: 20),)),
                        ),
                        IconButton(onPressed: (){
                          setState(() {
                            count++;
                          });
                        }, icon: Icon(Icons.add, color: Colors.white,size: 20,)),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                 Text(widget.name , style: GoogleFonts.poppins(
                     fontSize: 28,
                     fontWeight: FontWeight.bold
                 )),
                SizedBox(
                  height: 10,
                ),
                Text(widget.desc, style: GoogleFonts.poppins(
                    fontSize: 17,
                )),
                SizedBox(
                  height: 10,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:  [
                    Text("Time" , style:  GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                    )),
                    Text(widget.time, style: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.bold,
                        fontSize: 20
                    ),),

                  ],
                ),
                SizedBox(
                  height: 50,
                ),

                Expanded(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: MaterialButton(
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
                          contact: widget.contact
                        )));

                      },
                      child : Container(
                        height: 50,
                        width: 320,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("0 / 5", style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold
                            ),),
                            const Text("Go to Cart", style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.bold
                            ),),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),


              ],
            ),
          )),
    );
  }
}
