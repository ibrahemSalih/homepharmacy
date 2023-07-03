import 'package:flutter/material.dart';
import 'package:homepharmacy/users/nav_user.dart';
import 'package:homepharmacy/widget/primary_button.dart';
import 'package:homepharmacy/widget/text.dart';
import 'package:rive/rive.dart';

import 'navigation/navigator.dart';

class SuccessMessage extends StatefulWidget {
  const SuccessMessage({super.key, required this.label, required this.body});

  final String label;
  final String body;

  @override
  State<SuccessMessage> createState() => _SuccessMessageState();
}

class _SuccessMessageState extends State<SuccessMessage> {
  @override
  Widget build(BuildContext context) {
    // final appointmentProvider =
    //     Provider.of<AppointmentProvider>(context, listen: false);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            const SizedBox(
              height: 160,
              width: 160,
              child: RiveAnimation.asset('assets/done.riv'),
            ),
            textLabel(
              text: widget.label,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
            const SizedBox(
              height: 4,
            ),
            textLabel(
                text: widget.body,
                fontSize: 13,
                color: Theme.of(context).colorScheme.onPrimary.withAlpha(120),
                textAlign: TextAlign.center),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24.0),
              child: primaryButton(
                onPressed: () {
                 
                  getPageRemoveUntil(
                    context,
                    const nav_user(),
                  );
                },
                label: 'Done',
                backgroundColor: Colors.blueGrey,
                size: const Size(
                  double.infinity,
                  60,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
