import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:homepharmacy/user_cred/user_pref.dart';
import 'package:homepharmacy/users/nav_user.dart';
import 'package:homepharmacy/widget/navigation/navigator.dart';
import 'package:homepharmacy/widget/success_screen.dart';

import 'order_pharmcy.dart';

final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

class medicine_shop extends StatefulWidget {
  const medicine_shop({
    Key? key,
    required this.pharmaID,
    required this.medId,
    required this.pharmaName,
    required this.pharmacyImg,
    required this.pharmacyDelivery,
  }) : super(key: key);

  final String pharmaID;
  final String pharmaName;
  final String medId;
  final String pharmacyImg;
  final String pharmacyDelivery;

  @override
  State<medicine_shop> createState() => _medicine_shopState();
}

int _counter = 0;

class _medicine_shopState extends State<medicine_shop> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 111, 131),
        title: const Text("Medicine Shop"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: ((context) => const shop())));
              },
              icon: const Icon(Icons.shopping_basket))
        ],
        leading: IconButton(
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: ((context) => const nav_user())));
            },
            icon: const Icon(Icons.arrow_back_ios_new)),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('Pharmacy')
            .doc(widget.pharmaID)
            .collection('medicines')
            .doc(widget.medId)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          final deviceScreen = MediaQuery.of(context).size;

          final doc = snapshot.data;

          return SingleChildScrollView(
            child: SafeArea(
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Image.network(
                      doc!.get('img'),
                      fit: BoxFit.cover,
                      width: 300,
                    ),
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: deviceScreen.height * 0.28,
                      ),
                      Stack(
                        children: [
                          Stack(
                            children: [
                              Container(
                                height: deviceScreen.height * 0.6,
                                width: double.infinity,
                                decoration: const BoxDecoration(
                                  color: Color.fromARGB(255, 236, 236, 236),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(35),
                                    topRight: Radius.circular(35),
                                  ),
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    // SizedBox(
                                    //   width: 10,
                                    // ),
                                    SizedBox(
                                      height: deviceScreen.height * 0.05,
                                      width: double.infinity,
                                      //color: Colors.amber,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            '${doc.get('ItmePrice')} IQD',
                                            style: const TextStyle(
                                                fontSize: 25,
                                                fontWeight: FontWeight.bold,
                                                fontStyle: FontStyle.italic,
                                                color: Color.fromARGB(
                                                    255, 0, 111, 131)),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: deviceScreen.height * 0.05,
                                      width: double.infinity,
                                      // color: Colors.amber,
                                      child: const Row(
                                        children: [
                                          SizedBox(
                                            width: 20,
                                          ),
                                          Text(
                                            "Introduct",
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                // fontStyle: FontStyle.italic,
                                                color: Color.fromARGB(
                                                    255, 0, 111, 131)),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      decoration: const BoxDecoration(
                                        color:
                                            Color.fromARGB(255, 227, 227, 227),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(20),
                                        ),
                                      ),
                                      height: deviceScreen.height * 0.3,
                                      width: double.infinity,
                                      child: Column(
                                        children: [
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          SizedBox(
                                            width: 400,
                                            child: Text(
                                              doc.get('Inroduce'),
                                              textAlign: TextAlign.justify,
                                              style: const TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 0, 111, 131),
                                                  fontSize: 17),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      height: 90,
                                      width: double.infinity,
                                      decoration: const BoxDecoration(
                                        color:
                                            Color.fromARGB(255, 216, 216, 216),
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(35),
                                          topRight: Radius.circular(35),
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Container(
                                            height: 50,
                                            width: 160,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              color: const Color.fromARGB(
                                                  255, 236, 236, 236),
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                IconButton(
                                                    onPressed:
                                                        _DincrementCounter,
                                                    icon: const Icon(
                                                      Icons.remove,
                                                      color: Color.fromARGB(
                                                          255, 0, 111, 131),
                                                      size: 25,
                                                    )),
                                                Container(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 3,
                                                      vertical: 2),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            3),
                                                    color: const Color.fromARGB(
                                                        255, 236, 236, 236),
                                                  ),
                                                  child: Text(
                                                    '$_counter',
                                                    style: const TextStyle(
                                                        color: Color.fromARGB(
                                                            255, 0, 111, 131),
                                                        fontSize: 25,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                                IconButton(
                                                    onPressed:
                                                        _incrementCounter,
                                                    icon: const Icon(
                                                      Icons.add,
                                                      color: Color.fromARGB(
                                                          255, 0, 111, 131),
                                                      size: 25,
                                                    ))
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 50,
                                            width: 170,
                                            child: TextButton(
                                              style: TextButton.styleFrom(
                                                elevation: 12.0,
                                                shadowColor: Colors.amber,
                                                // primary: Colors.amber,
                                                // onSurface: Colors.yellow,
                                                side: const BorderSide(
                                                    color: Colors.blue,
                                                    width: 1),
                                                backgroundColor: Colors.green,
                                                shape:
                                                    const RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    15))),
                                              ),
                                              onPressed: () async {
                                                String ran = '';

                                                if (ran.isEmpty) {
                                                  ran = generateRandomString();
                                                } else {}

                                                print(ran);

                                                storeData(
                                                  doc: doc,
                                                  docID: ran,
                                                  parentCollection: 'User',
                                                ).then((value) {
                                                  storeData(
                                                    doc: doc,
                                                    docID: ran,
                                                    parentCollection:
                                                        'Pharmacy',
                                                    currentUser:
                                                        widget.pharmaID,
                                                  ).then(
                                                    (value) =>
                                                        getPageRemoveUntil(
                                                      context,
                                                      const SuccessMessage(
                                                        label:
                                                            'Medicines ordered !',
                                                        body:
                                                            'All your ordered medicines will appear in order screen.',
                                                      ),
                                                    ),
                                                  );
                                                });
                                              },
                                              child: const Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Icon(
                                                    Icons.shopping_cart,
                                                    color: Colors.white,
                                                    size: 30,
                                                  ),
                                                  Text('Cash',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 25,
                                                          fontStyle:
                                                              FontStyle.italic,
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                ],
                                              ),
                                            ),
                                          ),
                                          // SizedBox(
                                          //   width: 20,
                                          // )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _DincrementCounter() {
    setState(() {
      _counter--;
      if (_counter < 0) {
        _counter;
      }
    });
  }

  String generateRandomString() {
    var random = Random();
    var letters = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
    var numbers = '0123456789';
    var result = '';
    for (var i = 0; i < 20; i++) {
      var charSet = (i % 2 == 0) ? letters : numbers;
      var randomChar = charSet[random.nextInt(charSet.length)];
      result += randomChar;
    }
    return result;
  }

  Future<void> storeData({
    required doc,
    required String parentCollection,
    String? currentUser,
    required String docID,
  }) async {
    await UserCred.init();
    var id = UserCred.getUserCredentials();

    /// User data needed for ordering information
    final user =
        FirebaseFirestore.instance.collection('User').doc(id).snapshots();

    user.forEach((element) async {
      await _firebaseFirestore
          .collection(parentCollection)
          .doc(currentUser ?? id)
          .collection('orders')
          .doc(docID)
          .set({
        'medTitle': doc['TitleMedicine'],
        'medPrice': doc['ItmePrice'],
        'img': doc['img'],
        'qty': _counter,
        'userId': id,
        'username': element.get('fullName'),
        'email': element.get('email'),
        'phoneNumber': element.get('phoneNumber'),
        'address': element.get('address') +
            ' |\nPhone Number : ${element.get('phoneNumber')}',
        'pharmacyID': widget.pharmaID,
        'pharmacyName': widget.pharmaName,
        'docID': docID,
        'pharmacyImg': widget.pharmacyImg,
        'date': DateTime.now().toString(),
        'delvivery': widget.pharmacyDelivery
      });
    });
  }
}




//  .then((_) {
//           _firebaseFirestore
//               .collection("Pharmacy")
//               .doc(widget.pharmaID)
//               .collection('orders')
//               .doc()
//               .set({
//             'medTitle': doc['TitleMedicine'],
//             'medPrice': doc['ItmePrice'],
//             'img': doc['img'],
//             'qty': _counter,
//             'userId': value,
//             'pharmacyID': widget.pharmaID
//           });
//         });
