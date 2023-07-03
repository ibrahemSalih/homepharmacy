// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:homepharmacy/Admin_Pharmacy/home_pharamcy.dart';
import 'package:homepharmacy/Admin_Pharmacy/profile_pharmacy.dart';
import 'package:homepharmacy/Admin_Pharmacy/request_order.dart';

class nav_admin_pharamcy extends StatefulWidget {
  @override
  State<nav_admin_pharamcy> createState() => _nav_admin_pharamcyState();
}

class _nav_admin_pharamcyState extends State<nav_admin_pharamcy> {
  int selectindex = 0;

  // ignore: unused_field
  final _pagelist = [
    home_pharamcy(),
    UserOrders(),
    profile_pharmacy(),
  ];

  onTappedItem(int index) {
    setState(() {
      selectindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pagelist.elementAt(selectindex),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromARGB(255, 0, 139, 167),
        unselectedItemColor: Colors.white54,
        selectedItemColor: Colors.white,
        type: BottomNavigationBarType.shifting,
        // ignore: prefer_const_literals_to_create_immutables
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Colors.white,
              ),
              label: "Home",
              backgroundColor: Color.fromARGB(255, 0, 139, 167)),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.note,
                color: Colors.white,
              ),
              label: "order",
              backgroundColor: Color.fromARGB(255, 0, 139, 167)),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person_3_rounded,
                color: Colors.white,
              ),
              label: "Profile",
              backgroundColor: Color.fromARGB(255, 0, 139, 167)),
        ],
        currentIndex: selectindex,
        onTap: onTappedItem,
      ),
    );
  }
}
