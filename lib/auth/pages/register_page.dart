// ignore_for_file: unrelated_type_equality_checks

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mawadda_app/auth/components/auth_form_component.dart';
import 'package:mawadda_app/auth/components/password_form_component.dart';
import 'package:mawadda_app/auth/pages/login_page.dart';
import 'package:mawadda_app/auth/pages/succeed_signup.dart';
import 'package:mawadda_app/auth/utils/auth_string_util.dart';

@RoutePage()
class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final nameCtr = TextEditingController();
    final emailCtr = TextEditingController();
    final passwordCtr = TextEditingController();
    final confirmPasswordCtr = TextEditingController();
    final RxBool isNameTrue = false.obs;
    final RxBool isEmailTrue = false.obs;
    final RxBool isPasswordTrue = false.obs;
    final RxBool isConfirmPasswordTrue = false.obs;

    return Scaffold(
        body: Container(
      constraints: const BoxConstraints.expand(),
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/image_back.png"), fit: BoxFit.cover),
      ),
      padding: EdgeInsets.all(10.r),
      child: Center(
        child: ListView(
          children: [
            Image.asset(
              'assets/door_illustration.png',
              height: 0.3.sh,
            ),
            DefaultTextStyle(
              style: GoogleFonts.averiaGruesaLibre(color: Colors.black),
              child: Container(
                padding: EdgeInsets.only(
                  left: 10.r,
                  right: 10.r,
                ),
                //height: 0.65.sh,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 93.h,
                      width: 290.w,
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          border: Border.all(width: 3, color: Colors.black),
                          color: const Color(0xffDFDCEF),
                          borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(20),
                              topLeft: Radius.circular(20))),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Register Yourself',
                              style: TextStyle(
                                fontSize: 32.sp,
                              ),
                            ),
                            Text(
                              "to start a new journey",
                              style: TextStyle(
                                fontSize: 20.sp,
                              ),
                            ),
                          ]),
                    ),
                    Container(
                      // height: 0.45.sh,
                      padding: EdgeInsets.only(
                        left: 10.r,
                        right: 10.r,
                      ),
                      width: 290.w,
                      decoration: BoxDecoration(
                          border: Border.all(width: 3, color: Colors.black),
                          color: Colors.white,
                          borderRadius: const BorderRadius.only(
                              bottomRight: Radius.circular(20),
                              bottomLeft: Radius.circular(20))),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10.h,
                          ),
                          AuthFormComponent(
                            formKey: 'name',
                            controller: nameCtr,
                            hintText: 'Your Name',
                            textInputType: TextInputType.text,
                            validator: (value) => validateEmailNameForm(
                                context: context,
                                value: value,
                                isEmail: false,
                                isNameTrue: isNameTrue),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          AuthFormComponent(
                            formKey: 'email',
                            controller: emailCtr,
                            hintText: 'Your Email',
                            textInputType: TextInputType.emailAddress,
                            validator: (value) => validateEmailNameForm(
                                context: context,
                                value: value,
                                isEmail: true,
                                isEmailTrue: isEmailTrue),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          PasswordFormComponent(
                            formKey: 'password',
                            controller: passwordCtr,
                            hintText: 'Set your password',
                            textInputType: TextInputType.number,
                            validator: (value) => validatePasswordForm(
                              context: context,
                              password: value,
                              isPasswordTrue: isPasswordTrue,
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          PasswordFormComponent(
                            formKey: 'confirm_password',
                            controller: confirmPasswordCtr,
                            hintText: 'Confirm your password',
                            textInputType: TextInputType.number,
                            validator: (value) => validateConfirmPasswordForm(
                                context: context,
                                password: passwordCtr.text,
                                confirmPassword: value,
                                isConfirmPasswordTrue: isConfirmPasswordTrue),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          SizedBox(
                            height: 38.h,
                            width: 0.8.sw,
                            child: Obx(
                              () => ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: isEmailTrue == true &&
                                            isNameTrue == true &&
                                            isPasswordTrue == true &&
                                            isConfirmPasswordTrue == true
                                        ? const Color(0xffFAC6EA)
                                        : Colors.grey,
                                    side: const BorderSide(
                                        width: 3.0, color: Colors.black)),
                                onPressed: () {
                                  if (isEmailTrue == true &&
                                      isNameTrue == true &&
                                      isPasswordTrue == true &&
                                      isConfirmPasswordTrue == true) {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const SucceedPage(),
                                      ),
                                    );
                                  }
                                },
                                child: const Text(
                                  'Register',
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '*if you have already created any account, please',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 9.sp,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const LoginPage()));
                                },
                                child: Text(
                                  'Log In',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 9.sp,
                                    fontWeight: FontWeight.w600,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
