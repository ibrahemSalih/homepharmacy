import 'package:flutter/material.dart';
import 'package:homepharmacy/login_page/login.user.dart';

import 'package:homepharmacy/widget/general_logo_space.dart';
import 'package:homepharmacy/widget/widget_ilustration.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: const [
          SizedBox(
            height: 20,
          ),
          GeneralLogoSpace(
              child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              WidgetIlustration(),
              SizedBox(height: 40),
              LoginUser(),
            ],
          )),
        ],
      ),
    );
  }
}
