import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:homepharmacy/login_page/login.user.dart';
import 'package:homepharmacy/user_cred/user_pref.dart';
import 'package:intl/intl.dart';

class SingleUsersOrder extends StatefulWidget {
  const SingleUsersOrder({Key? key, required this.pharmacyID})
      : super(key: key);

  final String pharmacyID;

  @override
  State<SingleUsersOrder> createState() => _SingleUsersOrderState();
}

int _counter = 0;

class _SingleUsersOrderState extends State<SingleUsersOrder> {
  @override
  Widget build(BuildContext context) {
    var userId = UserCred.getUserCredentials();
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('Pharmacy')
            .doc(userId)
            .collection('orders')
            .where('userId', isEqualTo: widget.pharmacyID)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          // List<Widget> allOrderedMed = [];
          // Set pharma = {};
          final doc = snapshot.data!.docs;
          var totalPrice = 0.0;

          // var data;

          // var myList = [];

          List<Widget> allWidgets = [];

          for (var i in doc) {
            int price = int.parse(i.get('medPrice'));
            num qty = i.get('qty');
            totalPrice += qty * price;

            final singleWidget = SizedBox(
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
                              image: NetworkImage(i.get('img')),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                child: ListTile(
                                  title: Text(
                                    // pharmacy.name,
                                    i.get('medTitle'),
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  subtitle: Text(
                                    // pharmacy.name,'

                                    'Ordered at ${DateFormat('yyyy-MM-dd')
                                            .format(
                                                DateTime.parse(i.get('date')))}',
                                    style: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const SizedBox(
                                width: 15,
                              ),
                              Expanded(
                                child: Text(
                                  // "${pharmacy.address}\n\n delivery = ${pharmacy.price}",
                                  "${i.get('medPrice')}  IQD",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            i.get('qty').toString(),
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          Text(
                            'QTY',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
            allWidgets.add(singleWidget);
            // pharma.add(i.get('pharmacyName'));
            // myList.add(i.get('pharmacyName'));

            // data = i;
          }

          // Map? occurrences = <String, int>{};

          // for (var item in myList) {
          //   if (occurrences.containsKey(item)) {
          //     occurrences[item] += 1;
          //   } else {
          //     occurrences[item] = 1;
          //   }
          // }

          // List eachPharmaOrders = [];

          // occurrences.forEach((key, value) {
          //   eachPharmaOrders.add(value);
          // });

          return Scaffold(
            appBar: AppBar(
              backgroundColor: const Color.fromARGB(255, 0, 111, 131),
              title: Text('Orders'),
            ),
            body: SafeArea(
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                //color: Colors.amber,
                child: ListView(
                  children: allWidgets,
                ),
              ),
            ),
            bottomSheet: Container(
              color: Theme.of(context).primaryColor,
              height: MediaQuery.of(context).size.height * 0.085,
              child: Center(
                  child: Text(
                'Total Price : ${totalPrice.round()} IQD',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(color: Colors.white),
              )),
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
