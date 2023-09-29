import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../utils/constants.dart';

class IntroPageTwo extends StatelessWidget {
  const IntroPageTwo({Key? key}) : super(key: key);

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
              'صوت من هاتفك المحمول..',
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
                'https://lottie.host/4cc7b56e-8a8b-4c4c-bd29-9dd33909c426/FvOR6TUXEY.json',
                height: 500,
                width: 300),
          ),
        ],
      ),
    );
  }
}
