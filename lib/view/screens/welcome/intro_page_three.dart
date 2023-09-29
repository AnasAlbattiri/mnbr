import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../utils/constants.dart';

class IntroPageThree extends StatelessWidget {
  const IntroPageThree({Key? key}) : super(key: key);

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
              'استخدم بصمتك الخاصة..',
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
                'https://lottie.host/05f6fffb-127e-4bf7-b51b-fb9c13cd0777/Yo1kq1SNJZ.json',
                height: 500,
                width: 300,
            ),
          ),
        ],
      ),
    );
  }
}
