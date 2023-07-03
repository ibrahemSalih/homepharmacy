// import 'package:flutter/material.dart';
// import 'package:homepharmacy/Admin_Pharmacy/form_medicine.dart';
// import 'package:homepharmacy/users/nav_user.dart';

// class viewOrder extends StatefulWidget {
//   const viewOrder({Key? key}) : super(key: key);

//   @override
//   State<viewOrder> createState() => _viewOrderState();
// }

// class _viewOrderState extends State<viewOrder> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: const Color.fromARGB(255, 0, 139, 167),
//         elevation: 0,
//         title: const Text(
//           "Aree is Order",
//         ),
//         centerTitle: true,
//         leading: IconButton(
//             onPressed: () {
//               Navigator.pushReplacement(context,
//                   MaterialPageRoute(builder: ((context) => const nav_user())));
//             },
//             icon: const Icon(Icons.arrow_back_ios_new_outlined)),
//       ),
//       body: SafeArea(
//         child: Column(
//           children: [
//             Expanded(
//               child: ListView.builder(
//                   itemCount: 4,
//                   itemBuilder: (context, index) {
//                     // Pharmacy pharmacy = foundPharmacies[index];

//                     return GestureDetector(
//                       onTap: () {
//                         Navigator.pushReplacement(
//                             context,
//                             MaterialPageRoute(
//                                 builder: ((context) => const form_medicne(
//                                       collectionId: '',
//                                     ))));
//                       },
//                       child: SizedBox(
//                         height: 100,
//                         child: Card(
//                           elevation: 10,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(20),
//                           ),
//                           child: ListTile(
//                             contentPadding: const EdgeInsets.only(left: 20),
//                             title: const Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Text(
//                                   "Aree Farhad",
//                                   style: TextStyle(
//                                       color: Color.fromARGB(255, 0, 139, 167),
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 19),
//                                 ),
//                                 SizedBox(
//                                   height: 15,
//                                 )
//                               ],
//                             ),

//                             isThreeLine: true,

//                             // subtitle: Icon(Icons.delivery_dining_sharp),

//                             subtitle: const Center(),
//                             leading: Image.asset("assets/Panadol.jpg"),

//                             //  + Text(pharmacy.price.toString()),
//                           ),
//                         ),
//                       ),
//                     );
//                   }),
//             ),
//             Center(
//               child: Container(
//                 width: double.infinity,
//                 margin: const EdgeInsets.all(30.0),
//                 padding: const EdgeInsets.all(30.0),
//                 decoration: BoxDecoration(
//                   border: Border.all(
//                       width: 2.0,
//                       color: const Color.fromARGB(255, 0, 139, 167),
//                       style: BorderStyle.solid),
//                 ),
//                 child: const Center(
//                     child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     Text(
//                       'All Itm Price    =',
//                       style: TextStyle(
//                           color: Color.fromARGB(255, 0, 139, 167),
//                           fontWeight: FontWeight.bold,
//                           fontSize: 20),
//                     ),
//                     Text(
//                       '20\$',
//                       style: TextStyle(
//                           color: Color.fromARGB(255, 0, 139, 167),
//                           fontWeight: FontWeight.bold,
//                           fontSize: 20),
//                     ),
//                   ],
//                 )),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
