import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:homepharmacy/Admin_Pharmacy/nav_pharamcy.dart';

import 'dart:io';

import 'package:image_picker/image_picker.dart';

bool imgupdate = false;

ImagePicker picker = ImagePicker();

var imgpicked = "";

String imgurl = "";

TextEditingController id = TextEditingController();

TextEditingController image = TextEditingController();

TextEditingController TitleMedicine = TextEditingController();
TextEditingController Inroduce = TextEditingController();
TextEditingController ItmePrice = TextEditingController();

class edit_medicine extends StatefulWidget {
  edit_medicine(
      this.TitleMedicine, this.Inroduce, this.ItmePrice, this.img, this.id,
      {super.key, required this.PharmaId});

  String TitleMedicine = "";
  String Inroduce = "";
  String ItmePrice = "";
  String id = "";
  final String PharmaId;
  String img = "";
  String oldid = "";

  @override
  State<edit_medicine> createState() => _edit_medicine();
}

final eitMedKey = GlobalKey<FormState>(debugLabel: 'edit_med');

class _edit_medicine extends State<edit_medicine> {
  String oldimage = "";

  @override
  void initState() {
    print("${widget.TitleMedicine}sfafs");

    TitleMedicine.text = widget.TitleMedicine;

    oldimage = widget.img;

    Inroduce.text = widget.Inroduce;
    ItmePrice.text = widget.ItmePrice;

    super.initState();
  }

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
                      builder: ((context) => nav_admin_pharamcy())));
              setState(() {
                TitleMedicine.text = "";

                imgpicked = "";
                TitleMedicine.text = " ";
                Inroduce.text = "";
                ItmePrice.text = "";
              });
            },
            icon: const Icon(
              Icons.keyboard_arrow_left_outlined,
              size: 45,
              color: Color.fromARGB(255, 0, 139, 167),
            )),
        title: const Text(
          "Register Medecine",
          style: TextStyle(
            color: Color.fromARGB(255, 0, 139, 167),
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: eitMedKey,
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
                          child: imgpicked.isNotEmpty
                              ? Image.file(File(imgpicked))
                              : Image.network(
                                  oldimage, //fit: BoxFit.fill,),
                                )),
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
              SizedBox(
                height: 300,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(top: 20),
                      width: 300,
                      child: Center(
                        child: TextField(
                          controller: TitleMedicine,
                          decoration: const InputDecoration(
                              // border: OutlineInputBorder(),

                              labelText: 'Title Medicine',
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
                          controller: Inroduce,
                          decoration: const InputDecoration(
                              // border: OutlineInputBorder(),

                              labelText: 'Inroduce',
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
                          controller: ItmePrice,
                          decoration: const InputDecoration(
                              // border: OutlineInputBorder(),

                              labelText: 'Itme Price',
                              labelStyle: TextStyle(
                                color: Color.fromARGB(255, 0, 139, 167),
                              )),
                        ),
                      ),
                    ),
                  ],
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
                            setState(() {
                              uploadImageToFirebase3(context);
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
                          onPressed: () {},
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
        imgupdate = true;
      });
    } catch (e) {}
  }

  String imgurl = "";
  Future uploadImageToFirebase3(BuildContext context) async {
    File file = File(imgpicked);

    if (imgupdate == false) {
      if (eitMedKey.currentState!.validate()) {
        FirebaseFirestore.instance
            .collection('Pharmacy')
            .doc(widget.id)
            .collection('medicines')
            .doc(widget.id)
            .set({
          "id": widget.id,
          "TitleMedicine": TitleMedicine.text,
          "Inroduce": Inroduce.text,
          "ItmePrice": ItmePrice.text,
          "img": oldimage,
        }).then((value) => {
                  TitleMedicine.text = "",
                  Inroduce.text = "",
                  ItmePrice.text = "",
                  imgpicked = "",
                  oldimage = "",
                });
        const aa = SnackBar(
          backgroundColor: Colors.lightBlue,
          elevation: 10,
          shape: StadiumBorder(),
          behavior: SnackBarBehavior.floating,
          content: Text(
            'Updata Accept',
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(aa);

        Navigator.pop(context);
      } else {}
    } else {
      if (eitMedKey.currentState!.validate()) {
        File file = File(imgpicked);
        String imageTimeStamp =
            DateTime.now().millisecondsSinceEpoch.toString();
        String filePath = "Add_medicine" '/$imageTimeStamp';

        final Reference storageReference =
            FirebaseStorage.instanceFor().ref().child(filePath);
        final UploadTask uploadTask = storageReference.putFile(file);

        TaskSnapshot storageTaskSnapshot = await uploadTask;

        String result = await storageTaskSnapshot.ref.getDownloadURL();
        FirebaseFirestore.instance
            .collection('Pharmacy')
            .doc(widget.PharmaId)
            .collection('medicines')
            .doc(widget.id)
            .update({
          "id": widget.id,
          "TitleMedicine": TitleMedicine.text,
          "Inroduce": Inroduce.text,
          "ItmePrice": ItmePrice.text,
          "img": result,
        }).then((value) => {
                  TitleMedicine.text = "",
                  Inroduce.text = "",
                  ItmePrice.text = "",
                  imgpicked = "",
                  result = "",
                });
        const aa = SnackBar(
          backgroundColor: Colors.lightBlue,
          elevation: 10,
          shape: StadiumBorder(),
          behavior: SnackBarBehavior.floating,
          content: Text(
            'Updata Accept',
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(aa);

        Navigator.pop(context);
      } else {}
    }
  }
}
