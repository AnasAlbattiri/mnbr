import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mnbr/view/screens/else/suggest_screen.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../utils/constants.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({Key? key}) : super(key: key);

  final webSiteUri = Uri.parse('https://www.iec.jo/ar/%D8%A7%D9%84%D8%AA%D8%B4%D8%B1%D9%8A%D8%B9%D8%A7%D8%AA');

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: darkGreyClr,
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 50,),
                Image(
                  height: 95,
                  image: AssetImage('assets/images/mnbr1.jpg',),
                  width: 95,
                ),
                const SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    'يمكّن تطبيق ناخب المواطن الأردني من ممارسة حقه الدستوري بالإنتخاب لأي مرشح في أي وقت ومن أي مكان.',
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 50,),
                Row(
                  children: [
                    const SizedBox(
                      width: 20,
                    ),
                    Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                        color: mainColor,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(25),
                          child: GestureDetector(
                            onTap: () {
                              Get.toNamed('/map');
                            },
                            child: Image.asset(
                              'assets/images/vote.jpg',
                              fit: BoxFit.cover,
                            ),
                          )),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                        color: mainColor,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Column(
                        children: [
                          ClipRRect(
                              borderRadius: BorderRadius.circular(25),
                              child: GestureDetector(
                                onTap: () {
                                  Get.to(() => SuggestScreen());
                                },
                                child: Image.asset(
                                  'assets/images/think.jpg',
                                  fit: BoxFit.cover,
                                ),
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      'الانتخابات النيابية',
                      style: TextStyle(
                          fontSize: 19,
                          color: mainColor,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 40,
                    ),
                    Text(
                      'شكاوى واقتراحات',
                      style: TextStyle(
                          fontSize: 19,
                          color: mainColor,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Link(
                  uri: webSiteUri,
                  target: LinkTarget.defaultTarget,
                  builder: (context, openLink) => Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                      color: mainColor,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: GestureDetector(
                          onTap: openLink,
                          child: Image.asset(
                            'assets/images/ent5ab.png',
                            fit: BoxFit.cover,
                          ),
                        )),
                  ),
                ),
                Text(
                  'اعرف قانونك',
                  style: TextStyle(
                      fontSize: 19,
                      color: mainColor,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
