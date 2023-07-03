// ignore: unused_import
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:homepharmacy/login_page/register_user.dart';
import 'package:homepharmacy/user_cred/role.dart';
import 'package:homepharmacy/user_cred/user_pref.dart';
import 'package:homepharmacy/users/nav_user.dart';
import 'package:homepharmacy/widget/general_logo_space.dart';
import '../Admin_Pharmacy/nav_pharamcy.dart';
import '../Local_Data/LocalData.dart';
import '../admin_aplication.dart/home_admin_application.dart';
import '../user_cred/text.dart';
import '../users/home_user.dart';
import '../users/role_screen.dart';
import '../widget/navigation/navigator.dart';

final Admin = SnackBar(
  backgroundColor: baseColor,
  elevation: 10,
  shape: const StadiumBorder(),
  behavior: SnackBarBehavior.floating,
  content: const Text(
    'Welcom To home pharamcy',
  ),
);

final user = SnackBar(
  backgroundColor: baseColor,
  elevation: 10,
  shape: const StadiumBorder(),
  behavior: SnackBarBehavior.floating,
  content: const Text(
    'Welcom To User page',
  ),
);
final home_admin = SnackBar(
  backgroundColor: baseColor,
  elevation: 10,
  shape: const StadiumBorder(),
  behavior: SnackBarBehavior.floating,
  content: const Text(
    'Welcom To admin application page',
  ),
);

class LoginUser extends StatefulWidget {
  const LoginUser({super.key});

  @override
  State<LoginUser> createState() => _loginUsersState();
}

///inal loginFormKey = GlobalKey<FormState>(debugLabel: 'login');

get items => null;
String value = "1";
bool _isObscure = true;
bool emailV = false;
bool passV = false;
bool accV = false;

TextEditingController email = TextEditingController();
TextEditingController password = TextEditingController();

final textFieldFocusNode = FocusNode();

class _loginUsersState extends State<LoginUser> {
  @override
  Widget build(BuildContext context) {
    var isUser = Role.getRole();

    return Scaffold(
      body: Form(
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: () {
                    getPage(context, const RoleScreen());
                  },
                  child: Container(
                    width: 100,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      gradient: const LinearGradient(
                        begin: Alignment.bottomLeft,
                        end: Alignment.centerRight,
                        stops: const [0.5, 0.9],
                        colors: [Colors.blue, Colors.blueAccent],
                      ),
                    ),
                    child: Center(
                      child: textLabel(
                        context: context,
                        text: 'Change role',
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              child: const GeneralLogoSpace(
                child: Column(
                  children: [
                    SizedBox(
                      height: 80,
                    )
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  const Text(
                    "login your account",
                    style: TextStyle(fontSize: 15, color: Colors.grey),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // email container
                  Container(
                    padding: const EdgeInsets.only(left: 16),
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [
                          BoxShadow(
                              color: Color(0x40000000),
                              offset: Offset(0, 1),
                              blurRadius: 4,
                              spreadRadius: 0)
                        ],
                        color: Colors.white),
                    width: MediaQuery.of(context).size.width,
                    child: TextFormField(
                      controller: email,
                      // validator: (emailController) {
                      //   if (emailController == null || emailController.isEmpty) {
                      //     return 'Enter Your Email';
                      //   }
                      // },
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Email',
                          hintStyle:
                              TextStyle(fontSize: 15, color: Colors.grey)),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // paswword container
                  Container(
                    padding: const EdgeInsets.only(left: 16),
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [
                          BoxShadow(
                              color: Color(0x40000000),
                              offset: Offset(0, 1),
                              blurRadius: 4,
                              spreadRadius: 0)
                        ],
                        color: Colors.white),
                    width: MediaQuery.of(context).size.width,
                    child: TextFormField(
                      controller: password,
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Password',
                          hintStyle:
                              TextStyle(fontSize: 15, color: Colors.grey)),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: (() {
                        setState(() {
                          String email1 = "ibo@gmail.com";
                          String passwoord1 = "111";

                          FirebaseFirestore.instance
                              .collection(isUser ? 'User' : 'Pharmacy')
                              .snapshots()
                              .listen((QuerySnapshot querySnapshot) {
                            // ignore: avoid_function_literals_in_foreach_calls
                            for (var document in querySnapshot.docs) {
                              {
                                if (document["password"] == password.text &&
                                    document["email"] == email.text) {
                                  LocalData().setBoolPrefs("log", true);
                                  LocalData()
                                      .setStringPrefs("User", document.id);
                                  if (document["role"] == "admin") {
                                    UserCred.setUserCredentials(document.id);
                                    print(document.id);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            nav_admin_pharamcy(),
                                      ),
                                    );

                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(Admin);
                                  } else if (document["role"] == "user") {
                                    print(document.id);
                                    UserCred.setUserCredentials(document.id);

                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const nav_user(),
                                      ),
                                    );

                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(user);
                                  }
                                } else if (passwoord1 == password.text &&
                                    email1 == email.text) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const home_admin_application()));
                                  setState(() {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(home_admin);
                                  });
                                } else {
                                  // ScaffoldMessenger.of(context).showSnackBar(
                                  //   const SnackBar(
                                  //     content: Text(
                                  //         'Either username or password is incorrect'),
                                  //   ),
                                  // );
                                  // break;
                                }

                                // break;
                              }
                            }
                          });
                        });

                        // Navigator.pushReplacement(context,
                        //     MaterialPageRoute(builder: ((context) => choise())));
                      }),
                      style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 0, 111, 133),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20))),
                      child: const Text(
                        "Login",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Dont have any account! ",
                        style: TextStyle(fontSize: 17, color: Colors.grey),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: ((context) => const Register_user()),
                            ),
                          );
                        },
                        child: const Text(
                          "Register",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
