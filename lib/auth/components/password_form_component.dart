import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PasswordFormComponent extends StatelessWidget {
  final TextEditingController controller;
  final String? formKey;
  final String hintText;
  final TextInputType textInputType;
  final Function(String? value) validator;

  const PasswordFormComponent(
      {Key? key,
      required this.controller,
      this.formKey,
      required this.hintText,
      required this.textInputType,
      required this.validator})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final obscureTextNotifierPassword = true.obs;
    return Obx(
      () => TextFormField(
        key: Key(formKey ?? ''),
        controller: controller,
        obscureText: obscureTextNotifierPassword.value,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        keyboardType: TextInputType.visiblePassword,
        autofocus: false,
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
          ),
          suffixIcon: GestureDetector(
            onTap: () {
              obscureTextNotifierPassword.value =
                  !obscureTextNotifierPassword.value;
            },
            child: Icon(
              obscureTextNotifierPassword.value
                  ? Icons.visibility_off_outlined
                  : Icons.visibility_outlined,
              size: 14.sp,
              color: Colors.black,
            ),
          ),
        ),
        validator: (value) => validator(value),
      ),
    );
  }
}
