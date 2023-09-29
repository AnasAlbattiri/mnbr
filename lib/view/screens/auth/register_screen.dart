import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../logic/controller/auth_controller.dart';
import '../../../utils/constants.dart';
import '../../widgets/auth/auth_text_form_field.dart';
import '../../widgets/auth/bottom_container.dart';
import '../../widgets/else/text_utils.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({Key? key}) : super(key: key);

  static String verify = "";

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  // Vars & Else
  final formKey = GlobalKey<FormState>();
  final TextEditingController idNumberController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final controller = Get.put(AuthController());
  FirebaseAuth auth = FirebaseAuth.instance;
  var phoneNumber = '';

  Widget buildButtonFields() {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 19),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              controller.generateCountryFlag() + ' +962',
              style: const TextStyle(
                fontSize: 16,
                letterSpacing: 2.0,
                color: Colors.white,
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 16,
        ),
        Expanded(
          flex: 2,
          child: Container(
            width: double.infinity,
            // padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 9),
            child: TextFormField(
              controller: phoneNumberController,
              style: const TextStyle(
                fontSize: 16,
                letterSpacing: 2.0,
                color: Colors.white,
              ),
              cursorColor: Colors.white,
              decoration: InputDecoration(
                fillColor: Colors.black45,
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    // حوالين الفيلد نفسو
                    color: Colors.grey,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  // focusBorder: لما تكبس على الفيلد في خط بجي من تحت أنا بدي لونو يكون أبيض
                  borderSide: BorderSide(
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              keyboardType: TextInputType.phone,
              validator: (value) {
                if (value.toString().length < 9 ||
                    value.toString().length >= 11) {
                  return 'رقم الهاتف غير صحيح';
                } else {
                  return null;
                }
              },
              onChanged: (value) {
                phoneNumber = value;
              },
            ),
          ),
        ),
      ],
    );
  }

  @override
  void initState() {
    countryController.text = controller.generateCountryFlag() + ' +962';
    super.initState();
  }

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
                    padding: EdgeInsets.symmetric(vertical: 32, horizontal: 24),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            TextUtils(
                              text: 'حساب',
                              fontSize: 28,
                              fontWeight: FontWeight.w500,
                              color: mainColor,
                            ),
                            const SizedBox(
                              width: 3,
                            ),
                            TextUtils(
                              text: 'إنشاء',
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
                          height: 20,
                        ),
                        // رقم الهاتف
                        buildButtonFields(),
                        SizedBox(
                          height: 47,
                        ),
                        // إنشاء حساب
                        GetBuilder<AuthController>(builder: (_) {
                          return ElevatedButton(
                              onPressed: () async {
                                if (formKey.currentState!.validate()) {
                                  showDialog(context: context, builder: (context){
                                    return Center(child: CircularProgressIndicator(
                                      color: mainColor,
                                      backgroundColor: Colors.transparent,

                                    ));
                                  });
                                  await auth.verifyPhoneNumber(
                                    phoneNumber:
                                    '${countryController.text + phoneNumber}',
                                    timeout: const Duration(seconds: 14),
                                    verificationCompleted: (PhoneAuthCredential credential) {},
                                    verificationFailed: (FirebaseAuthException e) {},
                                    codeSent: (String verificationId, int? resendToken) {
                                      RegisterScreen.verify = verificationId;
                                      Get.toNamed('/verify');
                                    },
                                    codeAutoRetrievalTimeout: (String verificationId) {},
                                  );
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
                                text: 'إنشاء حساب',
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
                  text: 'تسجيل الدخول',
                  onPressed: () {
                    Get.offNamed('/login');
                  },
                  textType: 'هل لديك حساب مسبقاً؟',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
