import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:homepharmacy/login_page/login.user.dart';
import 'package:homepharmacy/user_cred/user_pref.dart';

class profile_pharmacy extends StatefulWidget {
  const profile_pharmacy({Key? key}) : super(key: key);

  @override
  State<profile_pharmacy> createState() => _profile_pharmacyState();
}

class _profile_pharmacyState extends State<profile_pharmacy> {
  @override
  Widget build(BuildContext context) {
    var id = UserCred.getUserCredentials();

    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('Pharmacy')
            .doc(id)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }

          final data = snapshot.data;

          return SingleChildScrollView(
            child: Column(children: <Widget>[
              const SizedBox(
                height: 80,
              ),
              Center(
                child: Image.asset(
                  'assets/p3.gif',
                  fit: BoxFit.cover,
                  height: 300,
                  width: 300,
                ),
              ),

              //--------------------------------------
              const SizedBox(
                height: 70.0,
              ),
              //--------------------------------------
              Center(
                child: Container(
                  height: 55,
                  width: 300,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    border: Border.all(
                        width: 2.0,
                        color: const Color.fromARGB(255, 0, 139, 167),
                        style: BorderStyle.solid),
                  ),
                  child: Center(
                      child: Text(
                    data!.get('titlepharmacy'),
                    style: TextStyle(
                        color: Color.fromARGB(255, 0, 139, 167),
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  )),
                ),
              ),
              //--------------------------------==================

              const SizedBox(
                height: 30.0,
              ),

              //..................,,,,,,,,,,,------------------------------

              SizedBox(
                width: 300,
                height: 50,
                child: ElevatedButton(
                  onPressed: (() {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: ((context) => const LoginUser()),
                      ),
                    );
                  }),
                  // ignore: sort_child_properties_last
                  child: const Text(
                    "Logout",
                    style: TextStyle(fontSize: 18),
                  ),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 0, 111, 133),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
              ),
            ]),
          );
        },
      ),
    );
  }
}
