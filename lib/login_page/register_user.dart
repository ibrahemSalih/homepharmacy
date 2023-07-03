import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:homepharmacy/login_page/login.user.dart';
import 'package:homepharmacy/widget/general_logo_space.dart';

class Register_user extends StatefulWidget {
  const Register_user({super.key});

  @override
  State<Register_user> createState() => _Register_userState();
}

class _Register_userState extends State<Register_user> {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool _secureText = true;
  showHide() {
    setState(() {
      _secureText = !_secureText;
    });
  }

  // Future<FirebaseApp> _initializeFirebase() async {
  //   FirebaseApp firebaseApp = await Firebase.initializeApp();
  //   return firebaseApp;
  //}

  //Color baseColor = Color(0xFF0253A2); //rangy card box
  final _formKey1 = GlobalKey<FormState>(debugLabel: 'register');
  // static final RegExp nameRegExp = RegExp("");
  // static final RegExp ageRegExp = RegExp("");
  // static final RegExp phoneRegExp = RegExp("");
  // static final RegExp addressRegExp = RegExp("");
  // static final RegExp emailRegExp = RegExp("");
  // static final RegExp passRegExp = RegExp("");

  // get items => null;
  // String value = "1";
  // bool _isObscure = true;
  // bool _isObscure1 = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey1,
        child: ListView(
          children: [
            const SizedBox(
              height: 20,
            ),
            // ignore: avoid_unnecessary_containers
            Container(
              child: const GeneralLogoSpace(
                child: Column(
                  children: [
                    SizedBox(
                      height: 5,
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
                    "REGISTER",
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  const Text(
                    "register your new account",
                    style: TextStyle(fontSize: 15, color: Colors.grey),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
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
                      controller: fullNameController,
                      validator: (nameRegExp) {
                        if (nameRegExp == null || nameRegExp.isEmpty) {
                          return 'Enter Your Full name';
                        } else if (nameRegExp.length > 10) {
                          return 'You must enter your Full name';
                        } else if (!RegExp(r'^[a-zA-Z ]+$')
                            .hasMatch(nameRegExp)) {
                          return 'Full name should contain only letters';
                        } else {
                          return null;
                        }
                      },
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Full Name',
                          hintStyle:
                              TextStyle(fontSize: 15, color: Colors.grey)),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
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
                      controller: ageController,
                      validator: (ageRegExp) {
                        if (ageRegExp == null || ageRegExp.isEmpty) {
                          return 'Enter Your Age';
                        } else {
                          try {
                            int age = int.parse(ageRegExp);
                            if (age <= 18) {
                              return 'Enter a valid age';
                            }
                          } catch (e) {
                            return 'Enter a valid number';
                          }
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Age',
                          hintStyle:
                              TextStyle(fontSize: 15, color: Colors.grey)),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
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
                      controller: phoneNumberController,
                      validator: (phoneNumberController) {
                        if (phoneNumberController == null ||
                            phoneNumberController.isEmpty) {
                          return 'Enter Your Phone number';
                          // ignore: unrelated_type_equality_checks
                        } else if (phoneNumberController == 11) {
                          return 'Phone number must be 11 numbers ';
                        } else {
                          //(phoneRegExp.hasMatch(value) == null);
                          //? null
                          return null;
                        }
                      },
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Phone Number',
                          hintStyle:
                              TextStyle(fontSize: 15, color: Colors.grey)),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
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
                      controller: addressController,
                      validator: (addressController) {
                        if (addressController == null ||
                            addressController.isEmpty) {
                          return 'Enter Your Address';
                        } else if (!RegExp(r'^[a-zA-Z ]+$')
                            .hasMatch(addressController)) {
                          return 'Address should contain only letters';
                        } else {
                          //(addressRegExp.hasMatch(value) == null);
                          //? null
                          return null;
                        }
                      },
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Address',
                          hintStyle:
                              TextStyle(fontSize: 15, color: Colors.grey)),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
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
                        //(emailRegExp.hasMatch(value) == null);
                        // ? null
                        color: Colors.white),
                    width: MediaQuery.of(context).size.width,
                    child: TextFormField(
                      controller: emailController,
                      validator: (emailController) {
                        if (emailController == null ||
                            emailController.isEmpty) {
                          return 'Enter Your Email';
                        } else if (!emailController.contains('@')) {
                          return 'Please enter a valid email address';
                        } else {
                          return null;
                        }
                      },
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
                      controller: passwordController,
                      obscureText: _secureText,
                      validator: (passwordController) {
                        if (passwordController == null ||
                            passwordController.isEmpty) {
                          return 'Enter Your Password';
                        } else if (passwordController.length > 7) {
                          return 'Password must be at least 7 characters long';
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                          suffixIcon: IconButton(
                              onPressed: showHide,
                              icon: _secureText
                                  ? const Icon(
                                      Icons.visibility_off,
                                      size: 20,
                                    )
                                  : const Icon(
                                      Icons.visibility,
                                      size: 20,
                                    )),
                          border: InputBorder.none,
                          hintText: 'Password',
                          hintStyle: const TextStyle(
                              fontSize: 15, color: Colors.grey)),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // ignore: sized_box_for_whitespace
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: (() {
                        setState(() async {
                          if (_formKey1.currentState!.validate()) {
                            final db =
                                FirebaseFirestore.instance.collection("User");

                            final bb = SnackBar(
                              backgroundColor: Colors.green.shade400,
                              elevation: 10,
                              shape: const StadiumBorder(),
                              behavior: SnackBarBehavior.floating,
                              content: const Text(
                                'Add Accept',
                              ),
                            );

                            //add data
                            DateTime now = DateTime.now();
                            String id = now.microsecondsSinceEpoch.toString();

                            await db.doc(id).set({
                              "id": id,
                              "fullName": fullNameController.text,
                              "age": ageController.text,
                              "phoneNumber": phoneNumberController.text,
                              "address": addressController.text,
                              "email": emailController.text,
                              "password": passwordController.text,
                              "role": "user",
                            }).then((value) => {
                                  fullNameController.text = "",
                                  ageController.text = "",
                                  phoneNumberController.text = "",
                                  addressController.text = "",
                                  emailController.text = "",
                                  passwordController.text = "",
                                });
                            ScaffoldMessenger.of(context).showSnackBar(bb);

                            // ignore: use_build_context_synchronously
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => const LoginUser())));
                          } else {}
                        });
                      }),

                      // ignore: sort_child_properties_last
                      child: const Text(
                        "Register",
                        style: TextStyle(fontSize: 18),
                      ),
                      style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 0, 111, 133),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20))),
                    ),
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Already have an account?",
                        style: TextStyle(fontSize: 17, color: Colors.grey),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => const LoginUser())));
                        },
                        child: const Text(
                          "Login",
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
