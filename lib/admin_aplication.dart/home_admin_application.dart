import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:homepharmacy/admin_aplication.dart/add_acount.dart';
import 'package:homepharmacy/admin_aplication.dart/edit_admin_application.dart';

import '../login_page/login.user.dart';
import '../widget/general_logo_space.dart';

// ignore: camel_case_types
class home_admin_application extends StatefulWidget {
  const home_admin_application({Key? key}) : super(key: key);

  @override
  State<home_admin_application> createState() => _home_admin_applicationState();
}

class _home_admin_applicationState extends State<home_admin_application> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(0, 0, 139, 167),
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: ((context) => const LoginUser())));
            },
            icon: const Icon(
              Icons.logout,
              size: 45,
              color: Color.fromARGB(255, 0, 139, 167),
            )),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15, top: 10),
            child: IconButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => const add_pharmacy_acount(
                                collectionId: '',
                              ))));
                },
                icon: const Icon(
                  Icons.add,
                  size: 35,
                  color: Color.fromARGB(255, 0, 139, 167),
                )),
          ),
        ],
      ),
      body: SafeArea(
        // padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            // SizedBox(
            //   height: 35,
            // ),
            const GeneralLogoSpace(
              child: SizedBox(
                height: 10,
              ),
            ),
            Expanded(
                child: StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('Pharmacy')
                        .where("role", isEqualTo: "admin")
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                            itemCount: snapshot.data!.docs.length,
                            itemBuilder: (context, index) {
                              DocumentSnapshot doc = snapshot.data!.docs[index];
                              return SizedBox(
                                height: 115,
                                child: Card(
                                    elevation: 4,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Row(
                                      children: [
                                        Container(
                                          height: 100,
                                          width: 100,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                      doc["image"]),
                                                  fit: BoxFit.fill),
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                        ),
                                        Expanded(
                                          child: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  const SizedBox(
                                                    width: 25,
                                                  ),
                                                  SizedBox(
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 3),
                                                      child: Row(
                                                        children: [
                                                          const SizedBox(
                                                            height: 30,
                                                          ),
                                                          const SizedBox(
                                                            width: 20,
                                                          ),
                                                          Text(
                                                            doc["titlepharmacy"],
                                                            style: const TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 18),
                                                            textAlign:
                                                                TextAlign.start,
                                                            maxLines: 1,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 2,
                                              ),
                                              SizedBox(
                                                height: 20,
                                                width: double.infinity,
                                                //   color: Colors.amber,
                                                child: Row(
                                                  children: [
                                                    const SizedBox(
                                                      width: 10,
                                                    ),
                                                    Container(
                                                      child: const Icon(
                                                        Icons.location_pin,
                                                        color: Colors.redAccent,
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      width: 10,
                                                    ),
                                                    SizedBox(
                                                      height: 20,
                                                      width: 250,
                                                      // color: Colors.amber,
                                                      child: Text(
                                                        doc["adress"],
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        textAlign:
                                                            TextAlign.start,
                                                        maxLines: 1,
                                                      ),
                                                    ),
                                                    Container()
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 8,
                                              ),
                                              SizedBox(
                                                height: 20,
                                                width: double.infinity,
                                                // color: Colors.red,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    Container(
                                                        child: const Icon(
                                                      Icons.delivery_dining,
                                                      color: Colors.orange,
                                                    )),
                                                    Container(
                                                      child: const Text(
                                                          "delivery :",
                                                          textAlign:
                                                              TextAlign.start,
                                                          maxLines: 1,
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold)),
                                                    ),
                                                    Container(
                                                      child: Text(
                                                          doc["delvivery"],
                                                          textAlign:
                                                              TextAlign.start,
                                                          maxLines: 1,
                                                          style: const TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold)),
                                                    ),
                                                    Container(
                                                      child: const Text("د.ح",
                                                          textAlign:
                                                              TextAlign.start,
                                                          maxLines: 1,
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold)),
                                                    ),
                                                    Row(
                                                      // mainAxisAlignment:
                                                      //     MainAxisAlignment
                                                      //         .spaceEvenly,
                                                      children: [
                                                        IconButton(
                                                            onPressed:
                                                                () async {
                                                              setState(() {
                                                                //nardne data  edit
                                                                Navigator.push(
                                                                  context,
                                                                  MaterialPageRoute(
                                                                      builder: (context) => edit_pharmacy_acount(
                                                                          doc["titlepharmacy"],
                                                                          doc["adress"],
                                                                          doc["delvivery"],
                                                                          doc["email"],
                                                                          doc["password"],
                                                                          doc["image"],
                                                                          doc.id)),
                                                                );
                                                              });
                                                            },
                                                            icon: const Icon(
                                                              Icons.edit,
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      0,
                                                                      139,
                                                                      167),
                                                            )),
                                                        IconButton(
                                                            onPressed:
                                                                () async {
                                                              setState(
                                                                  () async {
                                                                final delete1 =
                                                                    FirebaseFirestore
                                                                        .instance
                                                                        .collection(
                                                                            'Pharmacy');
                                                                await delete1
                                                                    .doc(doc.id)
                                                                    .delete();
                                                                setState(() {
                                                                  const aa =
                                                                      SnackBar(
                                                                    backgroundColor:
                                                                        Colors
                                                                            .lightBlue,
                                                                    elevation:
                                                                        10,
                                                                    shape:
                                                                        StadiumBorder(),
                                                                    behavior:
                                                                        SnackBarBehavior
                                                                            .floating,
                                                                    content:
                                                                        Text(
                                                                      'delete Data',
                                                                    ),
                                                                  );
                                                                  ScaffoldMessenger.of(
                                                                          context)
                                                                      .showSnackBar(
                                                                          aa);
                                                                });
                                                              });
                                                            },
                                                            icon: Icon(
                                                              Icons.delete,
                                                              color: Colors
                                                                  .red.shade300,
                                                            )),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    )),
                              );
                            });
                      } else {
                        return Image.network(
                          "https://opendoormls.com/images/no-data.png",
                          height: 250,
                          width: 250,
                        );
                      }
                    })),
          ],
        ),
      ),
    );
  }
}
