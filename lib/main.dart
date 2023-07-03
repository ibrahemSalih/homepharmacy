import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:homepharmacy/user_cred/role.dart';
import 'package:homepharmacy/user_cred/user_pref.dart';
import 'package:homepharmacy/users/role_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await UserCred.init();
  await Role.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: const Color.fromARGB(255, 0, 83, 100)),
      home: const RoleScreen(),
    );
  }
}
