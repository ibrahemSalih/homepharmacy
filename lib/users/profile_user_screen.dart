import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:homepharmacy/login_page/login.user.dart';
import 'package:homepharmacy/user_cred/user_pref.dart';

class profile_user_screen extends StatefulWidget {
  const profile_user_screen({Key? key}) : super(key: key);

  @override
  State<profile_user_screen> createState() => _profile_user_screenState();
}

class _profile_user_screenState extends State<profile_user_screen> {
  @override
  Widget build(BuildContext context) {
    var id = UserCred.getUserCredentials();

    return Scaffold(
        body: StreamBuilder(
      stream: FirebaseFirestore.instance.collection('User').doc(id).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        final userData = snapshot.data;

        return Column(children: [
          const SizedBox(
            height: 30,
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
          // const SizedBox(
          //   height: 70.0,
          // ),
          //--------------------------------------
          SizedBox(
            height: 190,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
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
                      userData!.get('fullName'),
                      style: const TextStyle(
                          color: Color.fromARGB(255, 0, 139, 167),
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    )),
                  ),
                ),
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
                      userData.get('phoneNumber'),
                      style: const TextStyle(
                          color: Color.fromARGB(255, 0, 139, 167),
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    )),
                  ),
                ),
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
                      userData.get('address'),
                      style: const TextStyle(
                          color: Color.fromARGB(255, 0, 139, 167),
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    )),
                  ),
                ),
              ],
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
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => const LoginUser())),
                    (route) => false);
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
        ]);
      },
    ));
  }
}
