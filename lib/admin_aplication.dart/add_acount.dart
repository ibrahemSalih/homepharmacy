import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:homepharmacy/admin_aplication.dart/home_admin_application.dart';
// import 'package:homepharmacy/pages/admin_applation/home_admin.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

import 'dart:io';

import 'package:image_picker/image_picker.dart';

import '../Admin_Pharmacy/Edit_medicine.dart';

ImagePicker picker = ImagePicker();

bool _isObscure = true;

var imgpicked = "";

TextEditingController id = TextEditingController();

TextEditingController image = TextEditingController();

TextEditingController titlepharmacy = TextEditingController();
TextEditingController adress = TextEditingController();
TextEditingController delvivery = TextEditingController();
TextEditingController username = TextEditingController();
TextEditingController password = TextEditingController();

// ignore: camel_case_types
class add_pharmacy_acount extends StatefulWidget {
  const add_pharmacy_acount({Key? key, required this.collectionId})
      : super(key: key);

  final String collectionId;
  @override
  State<add_pharmacy_acount> createState() => _add_pharmacy_countState();
}

final addKey = GlobalKey<FormState>(debugLabel: 'add');

class _add_pharmacy_countState extends State<add_pharmacy_acount> {
  // final _firebase = FirebaseFirestore.instance;

  bool isSpinning = false;
  String oldimage = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color.fromARGB(0, 0, 139, 167),
        leading: IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: ((context) => const home_admin_application())));
              setState(() {
                titlepharmacy.text = "";
                adress.text = "";
                delvivery.text = "";
                image.text = '';

                username.text = "";
                password.text = "";
              });
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Color.fromARGB(255, 0, 139, 167),
            )),
        title: const Text(
          "Add acount",
          style: TextStyle(
            color: Color.fromARGB(255, 0, 139, 167),
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: addKey,
          child: Column(
            children: [
              const Padding(padding: EdgeInsets.only(top: 30)),
              Container(
                color: Colors.white70,
                // height: 350,
                width: double.infinity,
                // color: Colors.amber,
                // padding: const EdgeInsets.fromLTRB(0, 0, 0, 50),
                child: Stack(
                  children: <Widget>[
                    Center(
                      child: SizedBox(
                        height: 300,
                        width: 800,
                        child: Container(
                            child: imgpicked.isEmpty
                                ? Image.asset(
                                    'assets/remove_image.png',
                                    height: 250,
                                    width: 250,
                                  )
                                : Image.file(
                                    File(imgpicked), //fit: BoxFit.fill,),
                                  )),
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      right: 5,
                      child: Container(
                        height: 70,
                        width: 70,
                        decoration: const BoxDecoration(
                            color: Colors.deepOrange,
                            borderRadius:
                                BorderRadius.all(Radius.circular(50))),
                        child: ElevatedButton(
                          onPressed: () {
                            addImage();
                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.black,
                            backgroundColor:
                                const Color.fromARGB(255, 0, 139, 167),
                            shape: const CircleBorder(),
                          ),
                          child: const Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 40.0,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 20),
                width: 300,
                child: Center(
                  child: TextField(
                    controller: titlepharmacy,
                    decoration: const InputDecoration(
                        // border: OutlineInputBorder(),

                        labelText: 'Title Pharmacy',
                        labelStyle: TextStyle(
                          color: Color.fromARGB(255, 0, 139, 167),
                        )),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 20),
                width: 300,
                child: Center(
                  child: TextField(
                    controller: adress,
                    decoration: const InputDecoration(
                        // border: OutlineInputBorder(),

                        labelText: 'Adress',
                        labelStyle: TextStyle(
                          color: Color.fromARGB(255, 0, 139, 167),
                        )),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 20),
                width: 300,
                child: Center(
                  child: TextField(
                    controller: delvivery,
                    decoration: const InputDecoration(
                        // border: OutlineInputBorder(),

                        labelText: 'Dlevery Price',
                        labelStyle: TextStyle(
                          color: Color.fromARGB(255, 0, 139, 167),
                        )),
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              const Row(children: <Widget>[
                Expanded(child: Divider()),
              ]),
              // Center(
              //   child: Text('Adress',
              //       style: TextStyle(
              //           color: Color.fromARGB(255, 0, 139, 167), fontSize: 25)),
              // ),
              Container(
                padding: const EdgeInsets.only(top: 20),
                width: 300,
                child: Center(
                  child: TextField(
                    controller: username,
                    decoration: const InputDecoration(
                        // border: OutlineInputBorder(),

                        labelText: 'User Name',
                        labelStyle: TextStyle(
                          color: Color.fromARGB(255, 0, 139, 167),
                        )),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 20),
                width: 300,
                child: Center(
                  child: TextField(
                    controller: password,
                    obscureText: _isObscure,
                    decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle: const TextStyle(
                          color: Color.fromARGB(255, 0, 139, 167),
                        ),
                        // this button is used to toggle the password visibility
                        suffixIcon: IconButton(
                            color: const Color.fromARGB(255, 0, 139, 167),
                            icon: Icon(_isObscure
                                ? Icons.visibility
                                : Icons.visibility_off),
                            onPressed: () {
                              setState(() {
                                _isObscure = !_isObscure;
                              });
                            })),
                  ),
                ),
              ),

              const SizedBox(
                height: 20,
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: 50,
                      width: 110,
                      color: const Color.fromARGB(255, 0, 139, 167),
                      child: TextButton(
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      side: const BorderSide(
                                        color: Color.fromARGB(255, 0, 139, 167),
                                      )))),
                          onPressed: () {
                            setState(() async {
                              if (addKey.currentState!.validate()) {
                                // final db = FirebaseFirestore.instance
                                //     .collection("Admin_Pharmacy");
                                File file = File(imgpicked);
                                String imageTimeStamp = DateTime.now()
                                    .millisecondsSinceEpoch
                                    .toString();
                                String filePath = "Pharmacy" '/$imageTimeStamp';

                                final Reference storageReference =
                                    FirebaseStorage.instanceFor()
                                        .ref()
                                        .child(filePath);
                                final UploadTask uploadTask =
                                    storageReference.putFile(file);

                                TaskSnapshot storageTaskSnapshot =
                                    await uploadTask;

                                String result = await storageTaskSnapshot.ref
                                    .getDownloadURL();

                                const aa = SnackBar(
                                  backgroundColor: Colors.lightBlue,
                                  elevation: 10,
                                  shape: StadiumBorder(),
                                  behavior: SnackBarBehavior.floating,
                                  content: Text(
                                    'Admin Pharmacy Add Accept',
                                  ),
                                );
                                ScaffoldMessenger.of(context).showSnackBar(aa);

                                //add data
                                DateTime now = DateTime.now();
                                String id =
                                    now.microsecondsSinceEpoch.toString();
                                CollectionReference medicines =
                                    FirebaseFirestore.instance
                                        .collection("Pharmacy");
                                var result1 = await medicines.doc(id).set({
                                  "id": id,
                                  "image": result,
                                  "titlepharmacy": titlepharmacy.text,
                                  "adress": adress.text,
                                  "delvivery": delvivery.text,
                                  "email": username.text,
                                  "password": password.text,
                                  "role": "admin",
                                }).then((value) => {
                                      image.text = "",
                                      titlepharmacy.text = "",
                                      adress.text = "",
                                      delvivery.text = "",
                                      result = "",
                                      username.text = "",
                                      password.text = "",
                                    });

                                // await medicines
                                //     .doc(id)
                                //     .collection("medicines")
                                //     .add({
                                //   "id": id,
                                //   "TitleMedicine": TitleMedicine.text,
                                //   "Inroduce": Inroduce.text,
                                //   "ItmePrice": ItmePrice.text,
                                //   "img": result,
                                // }).then((value) => {
                                //           TitleMedicine.text = "",
                                //           Inroduce.text = "",
                                //           ItmePrice.text = "",
                                //           result = "",
                                //         });

                                // ignore: use_build_context_synchronously
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const home_admin_application()),
                                );
                              } else {}
                            });
                          },
                          child: const Text(
                            "Save",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          )),
                    ),
                    SizedBox(
                      height: 50,
                      width: 110,
                      // color: Color.fromARGB(255, 0, 139, 167),
                      child: TextButton(
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(0.0),
                                      side: const BorderSide(
                                        width: 2,
                                        color: Color.fromARGB(255, 0, 139, 167),
                                      )))),
                          onPressed: () {
                            Navigator.pop(context);
                            titlepharmacy.text = "";
                            adress.text = "";
                            delvivery.text = "";
                            image.text = '';
                            username.text = "";
                            password.text = "";
                          },
                          child: const Text(
                            "Cancel",
                            style: TextStyle(
                                color: Color.fromARGB(255, 0, 139, 167),
                                fontSize: 18),
                          )),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void addImage() async {
    try {
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);
      setState(() {
        imgpicked = pickedFile!.path;
      });
    } catch (e) {}
  }
}
