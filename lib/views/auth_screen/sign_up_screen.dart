import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fresh_food/constants/app_constant.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Service/app_services.dart';


class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool isChecked = true;

  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passController = TextEditingController();
  var conPassController = TextEditingController();
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
                  height: screenSized.height * 0.29,
                  child:   Center(
                    child: Text("Fresh Food" , style:GoogleFonts.poppins(
                      fontSize: 28,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
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
                        Text("Sign Up" , style:GoogleFonts.poppins(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        )),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(10),

                          ),
                          child: TextFormField(
                           controller: nameController,
                            keyboardType: TextInputType.emailAddress,
                            style: GoogleFonts.poppins(
                                color: Colors.grey.shade600
                            ),
                            decoration: InputDecoration(
                              hintText: "Name",
                              hintStyle: GoogleFonts.poppins(
                                  color: Colors.grey.shade600
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
                          height: 15,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(10),

                          ),
                          child: TextFormField(
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                            style: GoogleFonts.poppins(
                                color: Colors.grey.shade600
                            ),
                            decoration: InputDecoration(
                              hintText: "Mail",
                              hintStyle: GoogleFonts.poppins(
                                  color: Colors.grey.shade600
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
                          height: 15,
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
                          height: 15,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(10),

                          ),
                          child: TextFormField(
                           controller: conPassController,
                            keyboardType: TextInputType.emailAddress,
                            style:GoogleFonts.poppins(
                                color: Colors.grey.shade600
                            ),
                            decoration: InputDecoration(
                              hintText: "Confirm Password",
                              hintStyle:  GoogleFonts.poppins(
                                  color: Colors.grey.shade600
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
                        Row(
                          children: [
                            Checkbox(
                              checkColor: Colors.white,
                              fillColor: MaterialStateProperty.all(appColor),
                              value: isChecked,
                              shape: const CircleBorder(),
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked = value!;
                                });
                              },
                            ),
                            Text("Agree with ",style : GoogleFonts.poppins(
                                color: Colors.grey.shade600
                            ),),
                            const Text("Terms & conditions", style: TextStyle(color: appColor),),
                          ],
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
                          color: appColor,
                          onPressed: (){

                            if(nameController.text.isEmpty){
                              Fluttertoast.showToast(msg: "Enter Name");
                            } else if(!emailController.text.contains("@")) {
                              Fluttertoast.showToast(msg: "Enter valid email");
                            }else if(passController.text.isEmpty){
                              Fluttertoast.showToast(msg: "Enter Password");
                            } else if(passController.text != conPassController.text){
                              Fluttertoast.showToast(msg: "Password not match");
                            } else{
                              setState(() {
                                isLoading = true;
                              });
                              appServices.signUp(nameController.text, emailController.text, passController.text, context).then((value){
                                setState(() {
                                  isLoading = false;
                                });
                              });

                            }
                          },
                          child : isLoading ? const CircularProgressIndicator(
                            color: Colors.white,
                          )  :  const Text("Sign Up", style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                          ),),
                        ),

                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                             Text(
                              "Already Have an Account?",
                              style:GoogleFonts.poppins(
                                  color: Colors.grey.shade600
                              ),
                            ),

                            TextButton(
                              onPressed: () {
                              Navigator.pop(context);
                              },
                              child : const Text("Login",
                                style: TextStyle(
                                  color: appColor,
                                  fontSize: 17,
                                ),),
                            ),
                          ],
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
