import 'package:flutter/material.dart';


class CartBottomNavbar extends StatelessWidget {
  const CartBottomNavbar({super.key});

  //const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        height: 130,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Total: ",
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 111, 133),
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    )),
                Text(
                  "\$3",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                )
              ],
            ),
            Container(
              alignment: Alignment.center,
              height: 48,
              // width: double.infinity,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 0, 111, 133),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text(
                "Chek Out",
                style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
