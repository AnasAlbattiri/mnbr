import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../utils/constants.dart';

class IntroPageOne extends StatelessWidget {
  const IntroPageOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkGreyClr,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 18.0, top: 30.0),
            child: Text(
              'ابحث عن المرشح..',
              textDirection: TextDirection.rtl,
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Center(
            child: Lottie.network(
              'https://lottie.host/8e7633c4-f6be-47e5-96f0-d2038be18bcd/v4n9yrPLBY.json',
              height: 500,
              width: 330,
            ),
          ),
        ],
      ),
    );
  }
}
