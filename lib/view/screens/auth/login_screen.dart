import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../logic/controller/auth_controller.dart';
import '../../../utils/constants.dart';
import '../../widgets/auth/auth_text_form_field.dart';
import '../../widgets/auth/bottom_container.dart';
import '../../widgets/else/text_utils.dart';
import '../else/home_screen.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  static String verify = "";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  // Vars & Else
  final formKey = GlobalKey<FormState>();
  final TextEditingController idNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final controller = Get.put(AuthController());
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
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
                    padding:
                        EdgeInsets.symmetric(vertical: 70, horizontal: 24),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            TextUtils(
                              text: 'الدخول',
                              fontSize: 28,
                              fontWeight: FontWeight.w500,
                              color: mainColor,
                            ),
                            const SizedBox(
                              width: 3,
                            ),
                            TextUtils(
                              text: 'تسجيل',
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
                            if (value.toString().length < 10 || value.toString().length > 10) {
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
                          builder: (context){
                            return AuthTextFormField(
                              controller: passwordController,
                              onChanged: (){},
                              obscureText: controller.isVisibility ? false : true,
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
                          height: 47,
                        ),
                        // تسجيل الدخول
                        GetBuilder<AuthController>(builder: (_) {
                          return ElevatedButton(
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  showDialog(context: context, builder: (context){
                                    return Center(child: CircularProgressIndicator(
                                      color: mainColor,
                                      backgroundColor: Colors.transparent,

                                    ));
                                  });
                                  // Get.offAllNamed('/map');
                                  Get.offAll(() => HomeScreen());
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
                                text: 'تسجيل الدخول',
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ));
                        }),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                BottomContainer(
                  text: 'إنشاء حساب جديد',
                  onPressed: () {
                    Get.offNamed('/register');
                  },
                  textType: 'ليس لديك حساب؟',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
