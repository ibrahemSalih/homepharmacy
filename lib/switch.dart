
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';

import 'Local_Data/LocalData.dart';



class Switchuser extends StatefulWidget {
  const Switchuser({Key? key}) : super(key: key);

  @override
  State<Switchuser> createState() => _SwitchuserState();
}

bool userlog = false;

class _SwitchuserState extends State<Switchuser> {
  FirebaseFirestore fb = FirebaseFirestore.instance;

  getUserMode() {
    LocalData().getBoolPrefs("log").then((value) => {
          print("${value}jegr"),
          if (value == false)
            {
              setState(() {
                userlog = false;
              }),
              // Navigator.pushAndRemoveUntil(
              //   context,
              //   MaterialPageRoute(builder: (context) => const UserLogin()),
              //   (Route<dynamic> route) => false,
              // ),
            }
          else
            {
              setState(() {
                setState(() {
                  userlog = true;
                });
                LocalData().getStringPrefs("userid").then((value) => {
                      fb
                          .collection('User')
                          .doc(value)
                          .get()
                          .then((DocumentSnapshot documentSnapshot) {
                        if (documentSnapshot.exists) {
                          if (documentSnapshot.get("role") == "admin") {
                            print("admin");
                            // Navigator.pushAndRemoveUntil(
                            //   context,
                            //   MaterialPageRoute(builder: (context) => Home()),
                            //   (Route<dynamic> route) => false,
                            // );
                          } else {
                            print("user");
                            // Navigator.pushAndRemoveUntil(
                            //   context,
                            //   MaterialPageRoute(
                            //       builder: (context) =>
                            //           //Switchsc()
                            //           BottomNavBar(Homeuser(), UserMainScreen(),
                            //               profile())),
                            //   (Route<dynamic> route) => false,
                            // );
                            // e  appasdfg11@gmail.com
                            // p  Zxcv1234@
                          }
                        } else {
                          print('Document does not exist on the database');
                        }
                      }),
                    });
              }),
            }
        });
  }

  @override
  void initState() {
    getUserMode();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
