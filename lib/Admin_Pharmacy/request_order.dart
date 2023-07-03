import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:homepharmacy/Admin_Pharmacy/request_order_People.dart';
import 'package:homepharmacy/login_page/login.user.dart';
import 'package:homepharmacy/user_cred/user_pref.dart';
import 'package:homepharmacy/users/users_all_orders.dart';

class UserOrders extends StatefulWidget {
  const UserOrders({Key? key}) : super(key: key);

  @override
  State<UserOrders> createState() => _UserOrdersState();
}

int _counter = 0;

class _UserOrdersState extends State<UserOrders> {
  @override
  Widget build(BuildContext context) {
    var userId = UserCred.getUserCredentials();

    print(userId);
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('Pharmacy')
            .doc(userId)
            .collection('orders')
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          Set users = {};
          Set address = {};
          final doc = snapshot.data!.docs;

          var data;

          var myList = [];
          Set ids = {};

          Map<String, String> userAddressMap = {};

          for (var i in doc) {
            users.add(i.get('username'));
            myList.add(i.get('username'));
            ids.add(i.get('userId'));
            //address.add(i.get('address'));
            data = i;

            String username = i.get('username');
            String address = i.get('address');

            userAddressMap[username] = address;
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
                  itemCount: users.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        //print(data.get('pharmacyID'));
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SingleUsersOrder(
                              pharmacyID: ids.elementAt(index),
                            ),
                          ),
                        );
                      },
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.15,
                        child: Card(
                          elevation: 6,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: ListTile(
                                            title: Text(
                                              // pharmacy.name,
                                              users.elementAt(index),
                                              style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            subtitle: Text(
                                              // pharmacy.name,
                                              'Ordered from  ${users.elementAt(index)}\nAddress : ${data.get('address')}',

                                              style: const TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            isThreeLine: true,
                                          ),
                                        ),
                                      ],
                                    ),
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
