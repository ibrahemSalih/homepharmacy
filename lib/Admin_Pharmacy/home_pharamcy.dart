import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:homepharmacy/Admin_Pharmacy/register_medicine.dart';
import 'package:homepharmacy/login_page/login.user.dart';
import 'package:homepharmacy/user_cred/user_pref.dart';

import 'Edit_medicine.dart';

TextEditingController searchController = TextEditingController();

class home_pharamcy extends StatefulWidget {
  const home_pharamcy({Key? key}) : super(key: key);

  @override
  State<home_pharamcy> createState() => _home_pharamcyState();
}

class _home_pharamcyState extends State<home_pharamcy> {
  @override
  Widget build(BuildContext context) {
    String userID = UserCred.getUserCredentials();

    // String searchController = '';

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(0, 0, 139, 167),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Home Pharmacise",
          style: TextStyle(
            color: Color.fromARGB(255, 0, 139, 167),
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15, top: 0),
            child: IconButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: ((context) => register_medicine(
                            id: userID,
                          )),
                    ),
                  );
                  //     setState(() {
                  //        TitleMedicine.text="";

                  // imgpicked="";
                  // TitleMedicine.text=" ";
                  // Inroduce.text="";
                  // ItmePrice.text="";
                  //     });
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
          child: Center(
              child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 5),
            height: 53,
            width: MediaQuery.of(context).size.width * 0.9,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: const Color.fromARGB(255, 0, 139, 167)),
            child: TextField(
              onChanged: (value) {
                searchController.text = value;

                setState(() {});
              },
              decoration: const InputDecoration(
                border: InputBorder.none,
                prefixIcon: Icon(
                  Icons.search,
                  color: Color.fromARGB(255, 240, 237, 237),
                ),
                hintText: "Search for Medicine ",
                hintStyle: TextStyle(
                    fontSize: 19, color: Color.fromARGB(255, 211, 207, 207)),
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('Pharmacy')
                  .doc(userID)
                  .collection('medicines')
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final medData = snapshot.data!.docs;

                  List<Widget> allWidgets = [];

                  for (var i in medData) {
                    bool getFields(String field) {
                      return i[field]
                          .toString()
                          .toLowerCase()
                          .contains(searchController.text.toLowerCase());
                    }

                    if (searchController.text.isEmpty) {
                      final cardItem = medCard(i, userID);
                      allWidgets.add(cardItem);
                    } else if (getFields('TitleMedicine')) {
                      final cardItem = medCard(i, userID);
                      allWidgets.add(cardItem);
                    }
                  }

                  return Expanded(
                    child: GridView(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        mainAxisExtent: 330,
                      ),
                      children: allWidgets,
                    ),
                  );
                } else {
                  return Image.network(
                    "https://opendoormls.com/images/no-data.png",
                    height: 480,
                    width: 480,
                  );
                }
              })
        ],
      ))),
      // backgroundColor: Colors.amber,
    );
  }

  Widget medCard(doc, String id) {
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Container(
        height: 180,
        padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: IconButton(
                          onPressed: () {
                            setState(() {
// //nardne data  edit
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => edit_medicine(
                                          doc["TitleMedicine"],
                                          doc["Inroduce"],
                                          doc["ItmePrice"],
                                          doc["img"],
                                          doc.id,
                                          PharmaId: id,
                                        )),
                              );
                            });
                          },
                          icon: const Icon(
                            Icons.edit,
                            color: Color.fromARGB(255, 0, 139, 167),
                          ))),
                  const SizedBox(
                    width: 100,
                  ),
                  Expanded(
                      child: IconButton(
                          onPressed: () {
                            setState(() async {
                              final delete1 = FirebaseFirestore.instance
                                  .collection('Pharmacy')
                                  .doc(id)
                                  .collection('medicines');
                              await delete1.doc(doc.id).delete();
                              setState(() {
                                const aa = SnackBar(
                                  backgroundColor: Colors.lightBlue,
                                  elevation: 10,
                                  shape: StadiumBorder(),
                                  behavior: SnackBarBehavior.floating,
                                  content: Text(
                                    'Delete Medicine',
                                  ),
                                );
                                ScaffoldMessenger.of(context).showSnackBar(aa);
                              });
                            });
                          },
                          icon: Icon(
                            Icons.delete,
                            color: Colors.red.shade400,
                          ))),
                ],
              ),
            ),
            InkWell(
              onTap: () {},
              child: Container(
                margin: const EdgeInsets.all(10),
                // child: Image.asset(
                //   "assets/Panadol.jpg",
                //   height: 120,
                //   width: 120,
                // ),
                child: Image.network(
                  doc['img'],
                  height: 120,
                  width: 120,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(bottom: 8),
              alignment: Alignment.centerLeft,
              child: Text(
                doc["TitleMedicine"],
                style: const TextStyle(
                  fontSize: 18,
                  color: Color.fromARGB(255, 0, 111, 131),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                doc["Inroduce"],
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 5),
                        child: Container(
                          child: const Text("د.ح",
                              textAlign: TextAlign.start,
                              maxLines: 1,
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                      ),
                      Text(
                        doc["ItmePrice"],
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ],
                  ),
                  const Icon(
                    Icons.shopping_cart_checkout,
                    color: Color.fromARGB(255, 0, 111, 131),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
