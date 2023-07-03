import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:homepharmacy/login_page/login.user.dart';

import '../user_cred/role.dart';
import '../user_cred/text.dart';

class RoleScreen extends StatelessWidget {
  const RoleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final colorScheme = Theme.of(context).colorScheme;

    GlobalKey loginKey = GlobalKey();

    Role role = Role();

    goToPage(bool isUser) {
      Role.setIsUser(isUser: isUser).then(
        (value) {
          // ScreenStateManager.setPageOrderID(2);
          return Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => LoginUser(
                key: loginKey,
              ),
            ),
            (route) => false,
          );
        },
      );
    }

    // goToPage() {
    //   return Navigator.pushAndRemoveUntil(
    //       context,
    //       MaterialPageRoute(
    //         builder: (context) => const LoginScreen(),
    //       ),
    //       (route) => false);
    // }

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                textLabel(
                  context: context,
                  text: 'How do you want to continue ?',
                  fontSize: 22,
                  color: Colors.black45,
                ),
                const SizedBox(
                  height: 22,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RoleCard(
                      onTap: () {
                        ///goToPage();
                        goToPage(false);
                      },
                      header: 'As an Pharmacy',
                      subtitle: '',
                      image: 'assets/pharma.svg',
                      cColor: Colors.black45,
                    ),
                    RoleCard(
                      onTap: () {
                        ///goToPage();
                        goToPage(true);
                      },
                      header: 'As a Patient',
                      subtitle: '',
                      image: 'assets/user.svg',
                      cColor: Colors.blue.withAlpha(40),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class RoleCard extends StatelessWidget {
  RoleCard({
    super.key,
    required this.header,
    required this.subtitle,
    required this.image,
    required this.cColor,
    required this.onTap,
  });

  final String header;
  final String subtitle;
  final String image;
  final Color cColor;
  void Function() onTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: onTap,
      child: Container(
          padding: const EdgeInsets.all(12.0),
          margin: const EdgeInsets.all(4.0),
          height: 220,
          width: 180,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      Positioned(
                        left: 20,
                        top: 10,
                        child: CircleAvatar(
                          backgroundColor: Colors.amber.withAlpha(120),
                          radius: 26,
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: SvgPicture.asset(
                          image,
                          width: header != "As an Expert" ? 80 : 75,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  textLabel(
                    text: header,
                    fontSize: 16,
                    //fontWeight: FontWeight.w600,
                    color: Colors.white,
                    context: context,
                  ),
                  textLabel(
                    text: subtitle,
                    fontSize: 12,
                    color: Colors.white,
                    textAlign: TextAlign.center,
                    context: context,
                  )
                ],
              ),
            ),
          )),
    );
  }
}
