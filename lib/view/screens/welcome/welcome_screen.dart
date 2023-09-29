import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mnbr/view/screens/welcome/intro_page_one.dart';
import 'package:mnbr/view/screens/welcome/intro_page_three.dart';
import 'package:mnbr/view/screens/welcome/intro_page_two.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../utils/constants.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  PageController _pageController = PageController();
  bool onLastPage = false;
  String? finalEmail;

  Future getValidationData() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var obtainedEmail = sharedPreferences.getString('email');
    var token = sharedPreferences.getString('accessToken');

    setState(() {
      finalEmail = obtainedEmail;
    });
    print(finalEmail);
    print(token);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //PageView
          PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                onLastPage = (index == 2);
              });
            },
            children: [
              IntroPageOne(),
              IntroPageTwo(),
              IntroPageThree(),
            ],
          ),
          Container(
            alignment: Alignment(0, 0.75),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Skip
                TextButton(
                  onPressed: () {
                    _pageController.jumpToPage(2);
                  },
                  child: Text(
                    'تخطي',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  style: TextButton.styleFrom(
                    foregroundColor: mainColor,
                  ),
                ),
                // Dot Indicator
                SmoothPageIndicator(
                  controller: _pageController,
                  count: 3,
                  effect: WormEffect(
                    activeDotColor: mainColor,
                    paintStyle: PaintingStyle.stroke,
                  ),
                ),
                // Next
                onLastPage
                    ? TextButton(
                        onPressed: () {
                          Get.offNamed(finalEmail == null ? '/login' : '/home');
                        },
                        child: Text(
                          'تم',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        style: TextButton.styleFrom(
                          foregroundColor: mainColor,
                        ),
                      )
                    : TextButton(
                        onPressed: () {
                          _pageController.nextPage(
                            duration: Duration(milliseconds: 400),
                            curve: Curves.easeIn,
                          );
                        },
                        child: Text(
                          'التالي',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        style: TextButton.styleFrom(
                          foregroundColor: mainColor,
                        ),
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
