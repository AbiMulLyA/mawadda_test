import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
//import 'package:get/get.dart';

class ProfileFormComponent extends StatelessWidget {
  final TextEditingController controller;
  final String? formKey;
  final String hintText;
  final TextInputType textInputType;
  final Function(String? value) validator;

  const ProfileFormComponent(
      {Key? key,
      required this.controller,
      this.formKey,
      required this.hintText,
      required this.textInputType,
      required this.validator})
      : super(key: key);

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
          isDense: true,
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.black, fontSize: 12.sp),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.r)),
            borderSide: const BorderSide(color: Colors.red, width: 1.0),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.r)),
            borderSide: const BorderSide(color: Colors.red, width: 1.0),
          ),
          contentPadding: EdgeInsets.all(15.r),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.r)),
            borderSide: const BorderSide(
              color: Color(0xffB4B0CE),
              width: 3.0,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.r)),
            borderSide: const BorderSide(color: Colors.black, width: 3.0),
          ),
          errorStyle: TextStyle(
            color: Colors.red,
            fontSize: 10.sp,
          )),
      validator: (value) => validator(value),
    );
  }
}
