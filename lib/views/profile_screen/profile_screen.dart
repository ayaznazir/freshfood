import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fresh_food/views/auth_screen/login_screen.dart';
import 'package:fresh_food/views/bottom_navigation/bottom_navigation.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/app_constant.dart';
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  var mailController = TextEditingController();
  var nameController = TextEditingController();
  var addressController = TextEditingController();
  var contactController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: SingleChildScrollView(
              child: StreamBuilder(
                stream: FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser!.uid).snapshots(),
                builder: (context,AsyncSnapshot snapshot) {
                 if(!snapshot.hasData){
                   return Center(child: CircularProgressIndicator());
                 }else {
                   mailController.text = snapshot.data["email"];
                   nameController.text = snapshot.data["name"];
                   addressController.text = snapshot.data["address"];
                   contactController.text = snapshot.data["contact"];
                   return Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       const SizedBox(height: 5,),

                       Row(
                         children:  [
                           Text("Profile" , style:  GoogleFonts.poppins(
                               fontSize: 30,
                               fontWeight: FontWeight.bold
                           )),
                         ],
                       ),

                       const SizedBox(
                         height: 20,
                       ),
                        Text("Mail", style: GoogleFonts.poppins(
                           fontSize: 16,
                       )),
                       const SizedBox(
                         height: 15,
                       ),
                       Container(
                         decoration: BoxDecoration(
                           color: Colors.grey[200],
                           borderRadius: BorderRadius.circular(10),

                         ),
                         child: TextFormField(
                           controller: mailController,
                           keyboardType: TextInputType.emailAddress,
                           style:  GoogleFonts.poppins(
                             fontSize: 16,
                           ),
                           decoration: InputDecoration(
                             hintStyle:  GoogleFonts.poppins(
                               fontSize: 16,
                             ),
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
                        Text("Name", style: GoogleFonts.poppins(
                         fontSize: 16,
                       )),
                       const SizedBox(
                         height: 15,
                       ),
                       Container(
                         decoration: BoxDecoration(
                           color: Colors.grey[200],
                           borderRadius: BorderRadius.circular(10),

                         ),
                         child: TextFormField(
                           controller: nameController,
                           keyboardType: TextInputType.emailAddress,
                           style:  GoogleFonts.poppins(
                             fontSize: 16,
                           ),
                           decoration: InputDecoration(
                             hintStyle: const TextStyle(color: Colors.black),
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
                        Text("Address", style:  GoogleFonts.poppins(
                         fontSize: 16,
                       )),
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
                           style:  GoogleFonts.poppins(
                             fontSize: 16,
                           ),
                           decoration: InputDecoration(
                             hintStyle:  GoogleFonts.poppins(fontSize: 16,),
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
                       Text("Contact Phone Number", style:  GoogleFonts.poppins(
                         fontSize: 16,
                       )),
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
                           style:  GoogleFonts.poppins(
                             fontSize: 16,
                           ),
                           decoration: InputDecoration(
                             hintStyle: GoogleFonts.poppins(
                             fontSize: 16,
                              ),
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
                         height: 30,
                       ),
                       MaterialButton(
                         height: 50,
                         minWidth: 320,
                         shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.circular(30.0),
                         ),
                         color: appColor,
                         onPressed: (){
                           FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser!.uid).update({
                             "name" : nameController.text,
                             "email" : mailController.text,
                             "address" : addressController.text,
                             "contact" : contactController.text,
                           }).then((value) {
                             Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => MainPage()), (route) => false);
                             Fluttertoast.showToast(msg: "Profile Updated");
                           });
                         },
                         child :const Text("Update Information", style: TextStyle(
                             color: Colors.white,
                             fontSize: 20,
                             fontWeight: FontWeight.bold
                         ),),
                       ),

                       const SizedBox(
                         height: 15,
                       ),
                       MaterialButton(
                         height: 50,
                         minWidth: 320,
                         shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.circular(30.0),
                         ),
                         color: Colors.black,
                         onPressed: (){
                           //   Navigator.push(context, MaterialPageRoute(builder: (context) => const MainPage()));
                           FirebaseAuth.instance.signOut().then((value){
                             Fluttertoast.showToast(msg: "Logout");
                             Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => LoginScreen()), (route) => false);
                           });
                         },
                         child :const Text("Logout", style: TextStyle(
                             color: Colors.white,
                             fontSize: 20,
                             fontWeight: FontWeight.bold
                         ),),
                       ),
                     ],
                   );
                  }
                }
              ),
            ),
          ),
        ),
    );
  }
}
