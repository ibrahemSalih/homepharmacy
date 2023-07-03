import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:homepharmacy/login_page/login.user.dart';
import 'package:homepharmacy/user_cred/user_pref.dart';
import 'package:homepharmacy/users/users_all_orders.dart';

import 'nav_user.dart';

class shop extends StatefulWidget {
  const shop({Key? key}) : super(key: key);

  @override
  State<shop> createState() => _shopState();
}

int _counter = 0;

class _shopState extends State<shop> {
  @override
  Widget build(BuildContext context) {
    var userId = UserCred.getUserCredentials();
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('User')
            .doc(userId)
            .collection('orders')
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          Set pharma = {};
          final doc = snapshot.data!.docs;

          var data;

          var myList = [];
          Set ids = {};
          Set imgs = {};

          for (var i in doc) {
            pharma.add(i.get('pharmacyName'));
            myList.add(i.get('pharmacyName'));
            ids.add(i.get('pharmacyID'));
            imgs.add(i.get('pharmacyImg'));
            data = i;
          }

          Map? occurrences = <String, int>{};

          for (var item in myList) {
            if (occurrences.containsKey(item)) {
              occurrences[item] += 1;
            } else {
              occurrences[item] = 1;
            }
          }

          List eachPharmaOrders = [];

          occurrences.forEach((key, value) {
            eachPharmaOrders.add(value);
          });

          return Scaffold(
            appBar: AppBar(
              backgroundColor: const Color.fromARGB(255, 0, 111, 131),
              title: Text('Orders'),
            ),
            body: SafeArea(
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                //color: Colors.amber,
                child: ListView.builder(
                  itemCount: pharma.length,
                  itemBuilder: (context, index) {
                    print(ids);

                    return GestureDetector(
                      onTap: () {
                        print(data.get('pharmacyID'));
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AllUsersOrder(
                              pharmacyID: ids.elementAt(index),
                            ),
                          ),
                        );
                      },
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.2,
                        child: Card(
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            children: [
                              Container(
                                height: 200,
                                width: 100,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(
                                          imgs.elementAt(index),
                                        ),
                                        fit: BoxFit.cover),
                                    borderRadius: BorderRadius.circular(20)),
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: ListTile(
                                            title: Text(
                                              // pharmacy.name,
                                              pharma.elementAt(index),
                                              style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            subtitle: Text(
                                              // pharmacy.name,
                                              'Ordered from  ${data.get('pharmacyName')}',
                                              style: const TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    // Row(
                                    //   mainAxisAlignment: MainAxisAlignment.start,
                                    //   children: [
                                    //     const SizedBox(
                                    //       width: 15,
                                    //     ),
                                    //     Expanded(
                                    //       child: Text(
                                    //         // "${pharmacy.address}\n\n delivery = ${pharmacy.price}",
                                    //         "${data.get('medPrice')}  IQD",
                                    //         style: const TextStyle(
                                    //             fontWeight: FontWeight.bold),
                                    //       ),
                                    //     ),
                                    //   ],
                                    // ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 24.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      eachPharmaOrders[index].toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall,
                                    ),
                                    Text(
                                      'Items',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          );
        });
  }

  void _incrementCounter() {}

  void _DincrementCounter() {
    setState(() {
      _counter--;
      if (_counter < 0) {
        _counter;
      }
    });
  }

  Future<void> update({collectionId, subCollectionId, doc, qty}) async {
    await FirebaseFirestore.instance
        .collection(collectionId)
        .doc(subCollectionId)
        .collection('orders')
        .doc(doc)
        .update({'qty': qty});
  }
}
