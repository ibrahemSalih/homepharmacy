import 'dart:async';

import 'package:flutter/material.dart';
//import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:homepharmacy/pages/start_page.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 10),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const StartPage())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomRight,
              colors: [
                Color.fromARGB(255, 0, 83, 100),
                Color.fromARGB(255, 2, 146, 174)
              ]),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Image.asset('assets/Home2.PNG'),
                // Logo
              ],
            ),
            const Center(
              child: CircularProgressIndicator(
                color: Colors.white,
                // Loading
              ),
            ),
          ],
        ),
      ),
    );
  }
}
