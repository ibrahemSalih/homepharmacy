import 'package:flutter/material.dart';

class WidgetIlustration extends StatelessWidget {
  // final Widget child;
  //   WidgetIlustration({  required this.child});
  const WidgetIlustration({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          "assets/vector1.PNG",
          width: 350,
        ),
        const SizedBox(
          height: 20,
        ),
        const Text(
          "Order what kind of drug you want ",
          style: TextStyle(fontSize: 20),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 15,
        ),
        const Column(
          children: [
            Text(
              "Whenever or Wherever you want",
              style: TextStyle(
                  fontSize: 15, color: Color.fromARGB(255, 166, 153, 153)),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              "We are Here to make your life Easiar",
              style: TextStyle(
                  fontSize: 15, color: Color.fromARGB(255, 166, 153, 153)),
            ),
          ],
        )
      ],
    );
  }
}
