import 'package:flutter/material.dart';

class GeneralLogoSpace extends StatelessWidget {
  final Widget child;
  const GeneralLogoSpace({super.key, required this.child});
  // const  GeneralLogoSpace({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Image.asset(
            "assets/Home.png",
            width: 200,
          ),
          SizedBox(child: child)
        ],
      ),
    );
  }
}
