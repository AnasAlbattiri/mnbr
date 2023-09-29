import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mnbr/utils/constants.dart';
import 'package:mnbr/view/screens/else/home_screen.dart';

import '../../widgets/else/text_utils.dart';

class SuggestScreen extends StatelessWidget {
  SuggestScreen({Key? key}) : super(key: key);

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: darkGreyClr,
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
          centerTitle: true,
          backgroundColor: mainColor,
          elevation: 0.0,
          title: Text(
            'الشكاوى والإقتراحات',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15, top: 20),
                    child: Text(
                      'قدم الشكاوى أو الاقتراحات الخاصة بك للهيئة المستقلة للإنتخاب',
                      textDirection: TextDirection.rtl,
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25, right: 15, top: 20),
                    child: TextFormField(
                      textAlign: TextAlign.right,
                      minLines: 1,
                      maxLines: 20,
                      cursorColor: mainColor,
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value.toString().length == 0) {
                          return 'يجب عليك ملئ الحقل';
                        } else {
                          return null;
                        }
                      },
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      decoration: InputDecoration(
                        fillColor: Colors.black45,
                        hintText: 'اكتب هنا الشكوى أو الإقتراح الخاص بك',
                        hintStyle: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontFamily: 'Circular',
                        ),
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
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
                        alignLabelWithHint: true,
                        hintTextDirection: TextDirection.rtl,


                      ),
                    ),
                  ),
                  SizedBox(
                    height: 480,
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          var successSnack = SnackBar(
                            elevation: 0,
                            behavior: SnackBarBehavior.floating,
                            backgroundColor: Colors.transparent,
                            content: AwesomeSnackbarContent(
                              title: 'تم الإرسال!',
                              message: '.لقد تم الإرسال إلى الهيئة المستقلة للإنتخاب بنجاح',
                              contentType: ContentType.success,
                            ),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(successSnack);
                          Get.off(() => HomeScreen());
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(300, 45),
                        backgroundColor: mainColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      child: TextUtils(
                        text: 'إرسال',
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
