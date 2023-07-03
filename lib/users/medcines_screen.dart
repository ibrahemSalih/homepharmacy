import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:homepharmacy/pages/pharmacy.dart';
import 'package:homepharmacy/users/medicne_shop.dart';

TextEditingController search = TextEditingController();

class MedicinesScreen extends StatefulWidget {
  const MedicinesScreen(
      {super.key,
      required this.id,
      required this.pharmacyTitle,
      required this.pharmacyIMG, required this.delivery});

  final String id;
  final String pharmacyTitle;
  final String pharmacyIMG;
  final String delivery;

  @override
  State<MedicinesScreen> createState() => _MedicinesScreenState();
}

Color baseColor = const Color.fromARGB(255, 0, 111, 131);

class _MedicinesScreenState extends State<MedicinesScreen> {
  List<Pharmacy> foundPharmacies = [];
  @override
  void initState() {
    foundPharmacies = pharmacylist;
    super.initState();
  }

  TextEditingController adress = TextEditingController();

  // ignore: non_constant_identifier_names
  void Search(String entername) {
    setState(() {
      foundPharmacies = pharmacylist.where((pharmacy) {
        String pharmacyName = pharmacy.name.toLowerCase();
        return pharmacyName.contains(entername.toLowerCase());
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 80,
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            widget.pharmacyTitle,
            style: const TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 0, 111, 131),
            ),
          ),
          centerTitle: true,
          leading: IconButton(
            onPressed: (() => {Navigator.pop(context)}),
            icon: const Icon(Icons.arrow_back),
            color: const Color.fromARGB(255, 0, 111, 131),
            iconSize: 30,
          ),
          actions: [
            Row(
              children: [
                Center(
                  child: Badge(
                    // badgeContent: const Text(
                    //   "",
                    //   style: TextStyle(
                    //     color: Colors.white,
                    //   ),
                    // ),
                    child: InkWell(
                      onTap: () {
                        // Navigator.pushReplacement(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: ((context) => const Cartpage())));
                      },
                      child: const Icon(
                        Icons.shopping_bag_outlined,
                        size: 32,
                        color: Color.fromARGB(255, 0, 111, 131),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                )
              ],
            ),
          ],
        ),
        body: SafeArea(
          child: Column(
            children: [
              ////////////////////////////////////////////////////////////////////////////////////////////////////
              Expanded(
                child: ListView(
                  children: [
                    // DrugsPageAppBar(),
                    Container(
                      // height: 500,
                      padding: const EdgeInsets.only(top: 15),
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 236, 236, 236),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(35),
                          topRight: Radius.circular(35),
                        ),
                      ),
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 15),
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.search,
                                  size: 27,
                                  color: Color.fromARGB(255, 0, 111, 131),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                SizedBox(
                                  height: 50,
                                  width: 300,
                                  child: TextField(
                                    decoration: const InputDecoration(
                                        prefix: Icon(Icons.search),
                                        hintText: 'Search for medicines..'),
                                    onChanged: (val) {
                                      setState(() {
                                        search.text = val;
                                      });
                                    },
                                  ),
                                ),
                                const Spacer(),
                              ],
                            ),
                          ),

                          Container(
                            alignment: Alignment.centerLeft,
                            margin: const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 10),
                            child: const Text(
                              "Mediciness",
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 0, 111, 131)),
                            ),
                          ),
                          SizedBox(
                            height: 550,
                            width: double.infinity,
                            // color: Colors.red,
                            child: StreamBuilder<QuerySnapshot>(
                                stream: FirebaseFirestore.instance
                                    .collection('Pharmacy')
                                    .doc(widget.id)
                                    .collection('medicines')
                                    .snapshots(),
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    final data = snapshot.data!.docs;

                                    List<Widget> medData = [];

                                    for (var i in data) {
                                      bool getFields(String field) {
                                        return i[field]
                                            .toString()
                                            .toLowerCase()
                                            .contains(
                                                search.text.toLowerCase());
                                      }

                                      if (search.text.isEmpty) {
                                        final cardItem = GestureDetector(
                                          onTap: () {},
                                          child: medCard(i),
                                        );
                                        medData.add(cardItem);
                                      } else if (getFields('TitleMedicine')) {
                                        final cardItem = GestureDetector(
                                          onTap: () {},
                                          child: medCard(i),
                                        );
                                        medData.add(cardItem);
                                      }
                                    }

                                    return GridView(
                                      gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        mainAxisSpacing: 10,
                                        mainAxisExtent: 300,
                                      ),
                                      children: medData,
                                    );
                                  } else {}
                                  return Image.network(
                                    "https://opendoormls.com/images/no-data.png",
                                    height: 480,
                                    width: 480,
                                  );
                                }),
                          )

                          // ItemsWidget(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              ////////////////////////////////////////////////////////////////////////////////////////////////////

              ////////////////////////////////////////////////////////////////////////////////////////////////////
            ],
          ),
        ));
  }

  Widget medCard(doc) {
    return GestureDetector(
      onTap: () {},
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Container(
          margin: const EdgeInsets.all(10),
          height: 180,
          padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: ((context) => medicine_shop(
                            pharmaID: widget.id,
                            pharmaName: widget.pharmacyTitle,
                            medId: doc.id,
                            pharmacyImg: widget.pharmacyIMG,
                            pharmacyDelivery: widget.delivery,
                          )),
                    ),
                  );
                },
                child: Container(
                  margin: const EdgeInsets.all(10),
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
                  child: Row(
                    children: [
                      Text(
                        doc["ItmePrice"] + ' IQD',
                        maxLines: 2,
                        style: const TextStyle(
                          overflow: TextOverflow.ellipsis,
                          fontSize: 15,
                          color: Colors.black,
                        ),
                      ),
                      Spacer(),
                      const Icon(
                        Icons.attach_money,
                        color: Colors.cyan,
                      )
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

// class medicine extends StatefulWidget {
//   const medicine({Key? key, required this.id}) : super(key: key);

//   final String id;

//   @override
//   State<medicine> createState() => _medicineState();
// }

// class _medicineState extends State<medicine> {
//   @override
//   Widget build(BuildContext context) {
//     return 
//   }
// }
