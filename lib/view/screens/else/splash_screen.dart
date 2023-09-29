import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:mnbr/view/screens/else/done_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../utils/constants.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  String? finalPhoneNumber;
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void initState() {
    checkUserStatus();
    super.initState();
  }

  void checkUserStatus() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool doneScreenVisited = prefs.getBool('doneScreenVisited') ?? false;

    if (doneScreenVisited) {
      Future.delayed(Duration(seconds: 2)).then((value) {
        Get.offNamed('/welcome'); // Done
      });
    } else {
      // User hasn't visited the Done Screen
      final user = auth.currentUser;

      if (user == null) {
        Future.delayed(Duration(seconds: 2)).then((value) {
          Get.offNamed('/welcome');
        });
      } else {
        Future.delayed(Duration(seconds: 2)).then((value) {
          Get.offNamed('/welcome'); // Map
        });
      }
    }
  }


  Future<void> getValidationData() async {
    final user = auth.currentUser;

    if (user != null) {
      setState(() {
        finalPhoneNumber = user.phoneNumber;
      });
      print(finalPhoneNumber);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkGreyClr,
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              height: 220,
              image: AssetImage('assets/images/mnbr1.jpg',),
              width: 320,
            ),
            SizedBox(
              height: 60,
            ),
            SpinKitThreeBounce(
              color: mainColor,
              size: 50.0,
            ),
          ],
        ),
      ),
    );
  }
}
