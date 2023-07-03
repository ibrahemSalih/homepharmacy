// import 'package:flutter/material.dart';

// import 'history_show_order.dart';

// class history_user extends StatefulWidget {
//   const history_user({Key? key}) : super(key: key);

//   @override
//   State<history_user> createState() => _history_userState();
// }

// class _history_userState extends State<history_user> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: const Color.fromARGB(0, 0, 139, 167),
//         elevation: 0,
//         title: const Text(
//           "Pharmacy Order",
//           style: TextStyle(
//             color: Color.fromARGB(255, 0, 139, 167),
//           ),
//         ),
//         centerTitle: true,
//       ),
//       body: SafeArea(
//         child: Expanded(
//           child: ListView.builder(
//               itemCount: 8,
//               itemBuilder: (context, index) {
//                 // Pharmacy pharmacy = foundPharmacies[index];

//                 return GestureDetector(
//                   onTap: () {
//                     Navigator.pushReplacement(context,
//                         MaterialPageRoute(builder: ((context) => const viewOrder())));
//                   },
//                   child: SizedBox(
//                     height: 100,
//                     child: Card(
//                       elevation: 10,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(20),
//                       ),
//                       child: ListTile(
//                         contentPadding:
//                             const EdgeInsets.only(top: 10, left: 20),
//                         title: const Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Text(
//                               "Newroz pharmacy",
//                               style: TextStyle(
//                                   color: Color.fromARGB(255, 0, 139, 167),
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 19),
//                             ),
//                           ],
//                         ),

//                         isThreeLine: true,

//                         // subtitle: Icon(Icons.delivery_dining_sharp),

//                         subtitle: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Container(
//                               padding: const EdgeInsets.only(top: 10),
//                               child: Text(
//                                 // Formatted Date
//                                 // Builtin format / without formatting
//                                 DateTime.now().toString(),
//                                 style: const TextStyle(

//                                     // Styling text
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 15),
//                               ),
//                             ),
//                           ],
//                         ),
//                         leading: const Icon(
//                           Icons.person,
//                           size: 50,
//                           color: Color.fromARGB(255, 0, 139, 167),
//                         ),

//                         //  + Text(pharmacy.price.toString()),
//                       ),
//                     ),
//                   ),
//                 );
//               }),
//         ),
//       ),
//     );
//   }
// }
