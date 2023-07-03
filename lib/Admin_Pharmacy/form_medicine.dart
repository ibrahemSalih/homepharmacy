import 'package:flutter/material.dart';
import 'package:homepharmacy/Admin_Pharmacy/request_order_People.dart';

class form_medicne extends StatefulWidget {
  const form_medicne({Key? key, required String collectionId})
      : super(key: key);

  @override
  State<form_medicne> createState() => _form_medicneState();
}

class _form_medicneState extends State<form_medicne> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 139, 167),
        title: const Text(
          "Form Medicine",
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: ((context) => SingleUsersOrder(pharmacyID: '',)),
                ),
              );
            },
            icon: const Icon(Icons.arrow_back_ios_new_outlined)),
      ),
      body: SafeArea(
          child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: 300,
            child: Image.asset("assets/Panadol.jpg"),
          ),
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Center(
                child: Container(
                  height: 80,
                  width: 400,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                    border: Border.all(
                        width: 2.0,
                        color: const Color.fromARGB(255, 0, 139, 167),
                        style: BorderStyle.solid),
                  ),
                  child: const Center(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'Aree Farhad is Order',
                        style: TextStyle(
                            color: Color.fromARGB(255, 0, 139, 167),
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ],
                  )),
                ),
              ),
              Center(
                child: Container(
                  height: 80,
                  width: 400,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                    border: Border.all(
                        width: 2.0,
                        color: const Color.fromARGB(255, 0, 139, 167),
                        style: BorderStyle.solid),
                  ),
                  child: const Center(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        '07502109791',
                        style: TextStyle(
                            color: Color.fromARGB(255, 0, 139, 167),
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ],
                  )),
                ),
              ),
              Center(
                child: Container(
                  height: 80,
                  width: 400,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                    border: Border.all(
                        width: 2.0,
                        color: const Color.fromARGB(255, 0, 139, 167),
                        style: BorderStyle.solid),
                  ),
                  child: const Center(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'Panadol ',
                        style: TextStyle(
                            color: Color.fromARGB(255, 0, 139, 167),
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      Text(
                        'X',
                        style: TextStyle(
                            color: Color.fromARGB(255, 0, 139, 167),
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      Text(
                        '( 20 )',
                        style: TextStyle(
                            color: Color.fromARGB(255, 0, 139, 167),
                            fontWeight: FontWeight.bold,
                            fontSize: 25),
                      ),
                    ],
                  )),
                ),
              ),
              Center(
                child: Container(
                  height: 80,
                  width: 400,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                    border: Border.all(
                        width: 2.0,
                        color: const Color.fromARGB(255, 0, 139, 167),
                        style: BorderStyle.solid),
                  ),
                  child: const Center(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Price',
                        style: TextStyle(
                            color: Color.fromARGB(255, 0, 139, 167),
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        '=',
                        style: TextStyle(
                            color: Color.fromARGB(255, 0, 139, 167),
                            fontWeight: FontWeight.bold,
                            fontSize: 30),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        '\$ 20',
                        style: TextStyle(
                            color: Color.fromARGB(255, 0, 139, 167),
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ],
                  )),
                ),
              ),
              Center(
                child: Container(
                    height: 80,
                    width: 400,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(15)),
                      border: Border.all(
                          width: 2.0,
                          color: const Color.fromARGB(255, 0, 139, 167),
                          style: BorderStyle.solid),
                    ),
                    child: Center(
                      child: Container(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(
                          // Formatted Date
                          // Builtin format / without formatting
                          DateTime.now().toString(),
                          style: const TextStyle(

                              // Styling text
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 0, 139, 167),
                              fontSize: 25),
                        ),
                      ),
                    )),
              ),
            ],
          ))
        ],
      )),
    );
  }
}
