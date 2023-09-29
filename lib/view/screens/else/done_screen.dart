import 'package:confetti/confetti.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mnbr/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../map/map_marker.dart';

class DoneScreen extends StatefulWidget {
  DoneScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<DoneScreen> createState() => _DoneScreenState();
}

class _DoneScreenState extends State<DoneScreen> {
  Future<void> setDoneScreenVisited() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('doneScreenVisited', true);
  }

  bool isPlating = false;
  final controller = ConfettiController();

  @override
  void initState() {
    super.initState();
    setDoneScreenVisited();
    controller.play();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: darkGreyClr,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Lottie.network(
                  'https://lottie.host/aae7d294-8235-41c2-958a-ae2ea117afc9/gc6CApkXks.json',
                  height: 250,
                  width: 250,
                ),
                Text(
                  'لقد تم التصويت للمرشح بنجاح',
                  textDirection: TextDirection.rtl,
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  'شكراً لك على جهودك، لن يعمل التطبيق على هذا الجهاز مجدداً حتى تنطلق الدورة الانتخابية القادمة.',
                  textDirection: TextDirection.rtl,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        ConfettiWidget(
          confettiController: controller,
        ),
      ],
    );
  }
}
