// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
// import 'package:homepharmacy/pages/history_page.dart';
import 'package:homepharmacy/pages/pharmacy.dart';
import '../widget/general_logo_space.dart';
import 'nav_user.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<Pharmacy> foundPharmacies = [];
  @override
  void initState() {
    foundPharmacies = pharmacylist;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            SizedBox(
              height: 35,
            ),
            GeneralLogoSpace(
              child: SizedBox(
                height: 10,
              ),
            ),
            // search
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 5),
              height: 53,
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: const Color.fromARGB(255, 0, 139, 167)),
              child: TextField(
                onChanged: (value) {},
                decoration: InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: Icon(
                    Icons.search,
                    color: Color.fromARGB(255, 240, 237, 237),
                  ),
                  hintText: "Search for pharmacies ",
                  hintStyle: TextStyle(
                      fontSize: 19, color: Color.fromARGB(255, 211, 207, 207)),
                ),
              ),
            ),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('User')
                      .where("role", isEqualTo: "admin")
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (context, index) {
                            DocumentSnapshot doc = snapshot.data!.docs[index];

                            return GestureDetector(
                              onTap: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: ((context) => nav_user())));
                              },
                              child: Container(
                                child: Card(
                                    child: ListTile(
                                  // contentPadding: const EdgeInsets.all(10),
                                  title: Padding(
                                    padding: const EdgeInsets.only(top: 4),
                                    child: Text(
                                      doc["titlepharmacy"],
                                      style: const TextStyle(
                                          fontSize: 19,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),

                                  isThreeLine: true,

                                  // subtitle: Icon(Icons.delivery_dining_sharp),

                                  subtitle: Padding(
                                    padding: const EdgeInsets.only(top: 3),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            SizedBox(
                                              height: 30,
                                              width: 270,
                                              //color: Colors.amber,
                                              child: Text(doc["adress"],
                                                  //  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.visible,

                                                  // "${pharmacy.address}\n\n delivery = ${pharmacy.price}",
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              height: 30,
                                              width: 200,
                                              // color: Colors.amber,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Container(
                                                      child: const Icon(
                                                    Icons.delivery_dining,
                                                    color: Colors.orange,
                                                  )),
                                                  Text(
                                                    "delvivery:",
                                                    style: const TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.black),
                                                  ),
                                                  Container(
                                                    child: Text(
                                                      doc["delvivery"],
                                                      style: const TextStyle(
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.black),
                                                    ),
                                                  ),
                                                  SizedBox(width: 10),
                                                  Container(
                                                    child: const Text("د.ح",
                                                        textAlign:
                                                            TextAlign.start,
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold)),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(width: 50),
                                            Icon(
                                              Icons.delivery_dining,
                                              color: Color.fromARGB(
                                                  255, 0, 139, 167),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),

                                  //  + Text(pharmacy.price.toString()),
                                  leading: Image.network(
                                    doc['image'],
                                  ),
                                )),
                              ),
                            );
                          });
                    } else {}
                    return Image.network(
                      "https://opendoormls.com/images/no-data.png",
                      height: 480,
                      width: 480,
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
