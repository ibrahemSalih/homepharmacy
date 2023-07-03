import 'package:flutter/material.dart';
import 'package:homepharmacy/users/home_user.dart';
import 'package:homepharmacy/users/order_pharmcy.dart';
import 'package:homepharmacy/users/profile_user_screen.dart';

import 'History_screen.dart';

class nav_user extends StatefulWidget {
  const nav_user({super.key});

  @override
  State<nav_user> createState() => _nav_userState();
}

class _nav_userState extends State<nav_user> {
  int selectindex = 0;

  // ignore: unused_field
  final _pagelist = [
    const home_suer(),
    const shop(),
    const profile_user_screen(),
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
        backgroundColor: const Color.fromARGB(255, 0, 139, 167),
        unselectedItemColor: Colors.white54,
        selectedItemColor: Colors.white,
        type: BottomNavigationBarType.shifting,
        // ignore: prefer_const_literals_to_create_immutables
        items: [
          const BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Colors.white,
              ),
              label: "Home",
              backgroundColor: Color.fromARGB(255, 0, 139, 167)),
          const BottomNavigationBarItem(
              icon: Icon(
                Icons.assignment,
                color: Colors.white,
              ),
              label: "History",
              backgroundColor: Color.fromARGB(255, 0, 139, 167)),
          const BottomNavigationBarItem(
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
