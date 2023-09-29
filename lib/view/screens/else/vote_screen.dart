import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mnbr/view/screens/else/done_screen.dart';
import '../../../../logic/controller/auth_controller.dart';
import '../../../../utils/constants.dart';
import '../../widgets/auth/auth_text_form_field.dart';
import '../../widgets/else/text_utils.dart';
import 'package:local_auth/local_auth.dart';

class VoteScreen extends StatefulWidget {
  VoteScreen({Key? key}) : super(key: key);

  static String verify = "";

  @override
  State<VoteScreen> createState() => _VoteScreenState();
}

class _VoteScreenState extends State<VoteScreen> {
  // Vars & Else
  final formKey = GlobalKey<FormState>();
  final TextEditingController idNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final controller = Get.put(AuthController());
  late final LocalAuthentication localAuth;
  bool _supportState = false;
  FirebaseAuth auth = FirebaseAuth.instance;

  // Methods
  @override
  void initState() {
    super.initState();
    localAuth = LocalAuthentication();
    localAuth.isDeviceSupported().then((bool isSupported) => setState(() {
          _supportState = isSupported;
        }));
  }

  Future<void> _getAvailableBiometrics() async {
    List<BiometricType> availableBiometrics =
        await localAuth.getAvailableBiometrics();
    print("$availableBiometrics");
    if (!mounted) {
      return;
    } else {}
  }

  Future<void> _authenticate() async {
    try {
      bool authenticated = await localAuth.authenticate(
        localizedReason: 'Anas said you have to fingerprint',
        options: AuthenticationOptions(
          stickyAuth: true,
          biometricOnly: true,
        ),
      );
      Get.offAll(() => DoneScreen());
      print('Authenticate: $authenticated');
    } on PlatformException catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back_ios_new_sharp,
              size: 22,
            ),
          ),
          backgroundColor: darkGreyClr,
          elevation: 0,
        ),
        backgroundColor: darkGreyClr,
        body: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                SingleChildScrollView(
                  child: Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height / 1.3,
                    padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            TextUtils(
                              text: 'التصويت',
                              fontSize: 28,
                              fontWeight: FontWeight.w500,
                              color: mainColor,
                            ),
                            const SizedBox(
                              width: 3,
                            ),
                            TextUtils(
                              text: 'تأكيد',
                              fontSize: 28,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 45,
                        ),
                        // الرقم الوطني
                        AuthTextFormField(
                          onChanged: () {},
                          controller: idNumberController,
                          obscureText: false,
                          textType: TextInputType.phone,
                          validator: (value) {
                            if (value.toString().length < 10 ||
                                value.toString().length > 10) {
                              return 'الرقم الوطني غير صحيح';
                            } else {
                              return null;
                            }
                          },
                          prefixIcon: Icon(
                            Icons.credit_card,
                            color: mainColor,
                          ),
                          suffixIcon: Text(''),
                          hintText: ' الرقم الوطني',
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        // كلمة السر
                        GetBuilder<AuthController>(
                          builder: (context) {
                            return AuthTextFormField(
                              controller: passwordController,
                              onChanged: () {},
                              obscureText:
                                  controller.isVisibility ? false : true,
                              textType: TextInputType.text,
                              validator: (value) {
                                if (value.toString().length < 8) {
                                  return 'كلمة السر يجب أن تتكون من 8 أحرف على الأقل';
                                } else {
                                  return null;
                                }
                              },
                              prefixIcon: Icon(
                                Icons.lock,
                                size: 25,
                                color: mainColor,
                              ),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  controller.visibility();
                                },
                                icon: controller.isVisibility
                                    ? Icon(
                                        Icons.visibility_off,
                                        color: Colors.grey,
                                      )
                                    : Icon(
                                        Icons.visibility,
                                        color: Colors.grey,
                                      ),
                              ),
                              hintText: 'كلمة السر',
                            );
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        // تأكيد التصويت
                        GetBuilder<AuthController>(builder: (_) {
                          return ElevatedButton(
                            onPressed: () async {
                              if (formKey.currentState!.validate()) {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return Center(
                                          child: CircularProgressIndicator(
                                        color: mainColor,
                                        backgroundColor: Colors.transparent,
                                      ));
                                    });
                                auth.currentUser;
                                Get.to(DoneScreen());
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(360, 50),
                              backgroundColor: mainColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: TextUtils(
                              text: 'تأكيد التصويت',
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          );
                        }),
                        SizedBox(
                          height: 35,
                        ),
                        Text(
                          'أو',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                        SizedBox(
                          height: 14,
                        ),
                        // بصمة اليد
                        TextButton(
                          onPressed: _authenticate,
                          child: Image.asset(
                            'assets/images/fingerprint1.png',
                            color: Colors.white,
                            width: 45,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 90,
                      decoration: BoxDecoration(
                        color: mainColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [],
                      ),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.all(20),
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.center,
                    //     crossAxisAlignment: CrossAxisAlignment.center,
                    //     children: [
                    //       TextButton(
                    //         onPressed: _authenticate,
                    //         child: Image.asset(
                    //           'assets/images/fingerprint1.png',
                    //           color: Colors.white,
                    //           width: 45,
                    //         ),
                    //       ),
                    //       SizedBox(
                    //         width: 45,
                    //       ),
                    //       Image.asset(
                    //         'assets/images/idscanner.png',
                    //         color: Colors.white,
                    //         width: 48,
                    //       ),
                    //     ],
                    //   ),
                    // ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
