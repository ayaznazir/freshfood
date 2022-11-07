import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fresh_food/Service/app_services.dart';
import 'package:fresh_food/views/auth_screen/sign_up_screen.dart';
import 'package:fresh_food/views/bottom_navigation/bottom_navigation.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/app_constant.dart';
class AdminLogin extends StatefulWidget {
  const AdminLogin({Key? key}) : super(key: key);

  @override
  State<AdminLogin> createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {
  var nameController = TextEditingController();
  var passController = TextEditingController();
  AppServices appServices = AppServices();
  bool isLoading  = false;
  @override
  Widget build(BuildContext context) {
    final screenSized = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: appColor,
      body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: screenSized.width,
                  height: screenSized.height * 0.36,
                  child:   Center(
                    child: Text("Fresh Food"  , style: GoogleFonts.poppins(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                    )),
                  ),
                ),
                Container(
                  width: screenSized.width,
                  height: screenSized.height * 0.7,
                  decoration:  const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                         Text("Admin Login" , style: GoogleFonts.poppins(
                          fontSize: 30,
                           fontWeight: FontWeight.bold,
                        )),
                        const SizedBox(
                          height: 30,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(10),

                          ),
                          child: TextFormField(
                            // controller: _passwordController,
                            // obscureText: _isObscure,
                            controller: nameController,
                            keyboardType: TextInputType.emailAddress,
                            style: GoogleFonts.poppins(
                                color: Colors.grey.shade600
                            ),
                            decoration: InputDecoration(
                              hintText: "Mail",
                              hintStyle: GoogleFonts.poppins(
                                  color: Colors.grey.shade600
                              ),
                              contentPadding: EdgeInsets.symmetric(vertical: 13, horizontal: 13),

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
                          height: 25,
                        ),

                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(10),

                          ),
                          child: TextFormField(
                            controller: passController,
                            keyboardType: TextInputType.emailAddress,
                            style: GoogleFonts.poppins(
                                color: Colors.grey.shade600
                            ),
                            decoration: InputDecoration(
                              hintText: "Password",
                              hintStyle:  GoogleFonts.poppins(
                                  color: Colors.grey.shade600
                              ),
                              contentPadding: EdgeInsets.symmetric(vertical: 13, horizontal: 13),
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
                          height: 50,
                        ),

                        MaterialButton(
                          height: 50,
                          minWidth: 320,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          color: appColor,
                          onPressed: (){
                            if(!nameController.text.contains("admin@gmail.com")) {
                              Fluttertoast.showToast(msg: "Enter valid email");
                            }else if(!passController.text.contains("admin123")){
                              Fluttertoast.showToast(msg: "Enter valid Password");
                            } else{
                              setState(() {
                                isLoading = true;
                              });
                              appServices.adminLogin(nameController.text, passController.text, context).then((value) {
                                setState(() {
                                  isLoading = false;
                                });
                              });

                            }
                          },
                          child : isLoading ? const CircularProgressIndicator(
                            color: Colors.white,
                          )  : Text("Login", style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                          ),),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
