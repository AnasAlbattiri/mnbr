import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthTextFormField extends StatelessWidget {
  const AuthTextFormField({
    Key? key,
    required this.controller,
    required this.obscureText,
    required this.textType,
    required this.validator,
    required this.prefixIcon,
    required this.suffixIcon,
    required this.hintText,
    required this.onChanged,
  }) : super(key: key);

  final TextEditingController controller;
  final bool obscureText;
  final TextInputType textType;
  final Function validator;
  final Widget prefixIcon;
  final Widget suffixIcon;
  final String hintText;
  final Function onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged(),
      controller: controller,
      obscureText: obscureText,
      cursorColor: Colors.white,
      keyboardType: textType,
      style: TextStyle(
        color: Colors.white,
      ),
      validator: (value) => validator(value),
      decoration: InputDecoration(
        fillColor: Colors.black45,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        hintText: hintText,
        hintStyle: TextStyle(
          fontSize: 16,
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
        filled: true, // هاي استخدمناها عشان نظهر ال fillColor
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
    );
  }
}
