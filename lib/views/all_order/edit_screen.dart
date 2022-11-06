import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fresh_food/Service/app_services.dart';
import 'package:fresh_food/views/all_order/add_order_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import '../../constants/app_constant.dart';

class EditScreen extends StatefulWidget {
  const EditScreen({Key? key}) : super(key: key);

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  File? file;
  DateTime startDate =  DateTime.now().toLocal();

  var namController = TextEditingController();
  var catController = TextEditingController();
  var timController = TextEditingController();
  var desController = TextEditingController();
  UploadTask? task;


  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(

      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: SingleChildScrollView(
                child: Column(
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
                     Text("Add / Edit", style: GoogleFonts.poppins(
                        fontSize: 25,
                        fontWeight: FontWeight.bold
                    )),
                  ],
                ),

                    const SizedBox(height: 10,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                         Text("Edit price per meal" , style:  GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.bold
                        )),
                        MaterialButton(onPressed: (){
                         // Navigator.push(context, MaterialPageRoute(builder: (context) =>  EditScreen()));
                        },
                          color: Colors.black,
                          child: const Text("S/10", style: TextStyle(color: Colors.white),),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      width: screenSize.width,
                      height: screenSize.height * 0.79,
                      decoration:BoxDecoration(
                        color: Colors.black,
                        borderRadius:  BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text("Add recipe" , style: TextStyle(
                                    color: Colors.white, fontWeight: FontWeight.bold,
                                    fontSize: 20
                                ),),
                             IconButton(onPressed: (){

                             }, icon: Icon(Icons.add, color: Colors.white,)) ,
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            InkWell(
                              onTap: (){
                                _getFromCamera();
                              },
                              child: Container(
                                width: screenSize.width,
                                height: screenSize.height * 0.16,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(image:  file == null ? const AssetImage(""): FileImage(file!) as ImageProvider,
                                        fit: BoxFit.cover
                                    )
                                ),
                                child:  Center(child: Text("Image", style:  GoogleFonts.poppins(
                                    fontSize: 20,
                                ),)),
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(10),

                              ),
                              child: TextFormField(
                                controller: namController,
                                keyboardType: TextInputType.emailAddress,
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                ),
                                decoration: InputDecoration(
                                  hintText: "Name",
                                  hintStyle: GoogleFonts.poppins(
                                  fontSize: 16,
                                ),
                                  contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),

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
                              height: 8,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(10),

                              ),
                              child: TextFormField(
                                controller: catController,
                                keyboardType: TextInputType.emailAddress,
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                ),
                                decoration: InputDecoration(
                                  hintText: "Category",
                                  hintStyle: GoogleFonts.poppins(
                                  fontSize: 16,
                                ),
                                  contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),

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
                              height: 8,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(10),

                              ),
                              child: TextFormField(
                                controller: timController,
                                keyboardType: TextInputType.emailAddress,
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                ),
                                decoration: InputDecoration(
                                  hintText: "Time",
                                  hintStyle: GoogleFonts.poppins(
                                  fontSize: 16,
                                ),
                                  contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),

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
                              height: 8,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(10),

                              ),
                              child: TextFormField(
                                maxLines: 4,
                                controller: desController,
                                keyboardType: TextInputType.emailAddress,
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                ),
                                decoration: InputDecoration(
                                  hintText: "Description",
                                  hintStyle: GoogleFonts.poppins(
                                  fontSize: 16,
                                ),
                                  contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),

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
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              color: appColor,
                              onPressed: (){
                                if(file == null) {
                                  Fluttertoast.showToast(msg: "Please select image");
                                }else if(namController.text.isEmpty){
                                  Fluttertoast.showToast(msg: "Please enter name");
                                }else if(catController.text.isEmpty){
                                  Fluttertoast.showToast(msg: "Please enter category");
                                }else if(desController.text.isEmpty){
                                  Fluttertoast.showToast(msg: "Please enter description");
                                }else{
                                  uploadRecipe(context);
                                }
                              },
                              child :const Text("Add", style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold
                              ),),
                            ),

                          ],
                        ),
                      ),
                    ),

                  ]
      ),
              ),
            ),
            Positioned(
              child: task != null ? Center(child: buildUploadStatus(task!)) : Container(),
            )
          ],
        ),
      ),
    );
  }
  _getFromCamera() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      File imageFile = File(pickedFile.path);
      setState(() {
        file = imageFile;
      });
    }
  }
int num = 0;
  uploadRecipe(BuildContext context) async {
    Map<String, dynamic> map = <String, dynamic>{};

    if (file != null) {
      String? url =  await uploadFile();
      map['image'] = url;
      map["name"] = namController.text;
      map["category"] = namController.text;
      map["time"] = timController.text;
      map["description"] = desController.text;
      map["count"] = 0;

    }

    await FirebaseFirestore.instance
        .collection("recipeData").add(map).then((value){
      Navigator.pop(context);
      Fluttertoast.showToast(msg: "Successfully add");
    });
  }

  Future<String?> uploadFile() async {
    if (file == null) return null;
    final fileName = basename(file!.path);
    final destination = 'resipeImages/$fileName';

    task = AppServices.uploadFile(destination, file!);
    setState(() {});
    if (task == null) {
      return null;
    }
    final snapshot = await task!.whenComplete(() {});
    return snapshot.ref.getDownloadURL();
  }

  Widget buildUploadStatus(UploadTask task) => StreamBuilder<TaskSnapshot>(
    stream: task.snapshotEvents,
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        final snap = snapshot.data!;
        final progress = snap.bytesTransferred / snap.totalBytes;
        final percentage = (progress * 100).toStringAsFixed(1);
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          width: 300,
          height: 70,
          child: Row(
            children: [
              const SizedBox(
                width: 10,
              ),
              CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(appColor)
              ),
              const SizedBox(
                width: 13,
              ),
              Text(
                'Loading $percentage %',
                style: const TextStyle(fontSize: 18, color: Colors.black),
              ),
            ],
          ),
        );
      } else {
        return Container();
      }
    },
  );
}


