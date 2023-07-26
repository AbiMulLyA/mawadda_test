// ignore_for_file:  sort_constructors_first
// ignore_for_file: public_member_api_docs, sort_ructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthFormComponentt extends StatelessWidget {
  const AuthFormComponentt({
    Key? key,
    required this.controller,
    this.formKey,
    required this.hintText,
    required this.textInputType,
    required this.validator,
  }) : super(key: key);

  final TextEditingController controller;
  final String? formKey;
  final String hintText;
  final TextInputType textInputType;
  final Function(String? value) validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: Key(formKey ?? ''),
      controller: controller,
      textInputAction: TextInputAction.next,
      keyboardType: textInputType,
      autofocus: false,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        // isDense: false,
        hintText: hintText,
        hintStyle: TextStyle(color: const Color(0xffEB9D73), fontSize: 12.sp),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.r)),
          borderSide: const BorderSide(color: Colors.red, width: 1.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.r)),
          borderSide: const BorderSide(color: Colors.white, width: 1.0),
        ),
        contentPadding: EdgeInsets.all(15.r),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.r)),
          borderSide: const BorderSide(
            color: Colors.white,
            width: 1.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.r)),
          borderSide: const BorderSide(
            color: Colors.white,
          ),
        ),
        errorStyle: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
          fontSize: 10.sp,
        ),
      ),
      validator: (value) => validator(value),
    );
  }
}
