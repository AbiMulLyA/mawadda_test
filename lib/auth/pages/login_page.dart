// ignore_for_file: unrelated_type_equality_checks

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:mawadda_app/auth/pages/register_page.dart';

import 'package:mawadda_app/auth/utils/auth_string_util.dart';

import '../../core/components/form_component.dart';
import '../../core/components/password_form_component.dart';
import '../../core/router/router.dart';

@RoutePage()
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final emailCtr = TextEditingController();
    final passwordCtr = TextEditingController();
    final RxBool isEmailTrue = false.obs;
    final RxBool isPasswordTrue = false.obs;

    return Scaffold(
        body: Container(
      height: 1.sh,
      constraints: const BoxConstraints.expand(),
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/image_back.png"), fit: BoxFit.cover),
      ),
      padding: EdgeInsets.only(top: 10.r, left: 10.r, right: 10.r),
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
              // height: 0.65.sh,
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
                            'Welcome Back!',
                            style: TextStyle(
                              fontSize: 32.sp,
                            ),
                          ),
                          Text(
                            "You've been missed",
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
                        FormComponent(
                          formKey: 'email',
                          controller: emailCtr,
                          hintText: 'Your Email',
                          textInputType: TextInputType.emailAddress,
                          validator: (value) => validateEmailNameForm(
                            context: context,
                            isEmail: true,
                            value: value,
                            isEmailTrue: isEmailTrue,
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        PasswordFormComponent(
                          formKey: 'password',
                          controller: passwordCtr,
                          hintText: 'Your Password',
                          textInputType: TextInputType.number,
                          validator: (value) => validatePasswordForm(
                            context: context,
                            password: value,
                            isPasswordTrue: isPasswordTrue,
                          ),
                        ),
                        SizedBox(
                          height: 120.h,
                        ),
                        SizedBox(
                          height: 38.h,
                          width: 0.8.sw,
                          child: Obx(
                            () => ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: isEmailTrue.value == true &&
                                          isPasswordTrue == true
                                      ? const Color(0xffFAC6EA)
                                      : Colors.grey,
                                  side: const BorderSide(
                                      width: 3.0, color: Colors.black)),
                              onPressed: () {
                                if (isEmailTrue.value == true &&
                                    isPasswordTrue == true) {
                                  context.router.replace(const HomeRoute());
                                }
                              },
                              child: const Text(
                                'Login',
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
                              '*if you dont have created any account, please',
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
                                            const RegisterPage()));
                              },
                              child: Text(
                                'Sign Up',
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
      )),
    ));
  }
}
