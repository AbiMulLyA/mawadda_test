import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mawadda_app/auth/pages/after_register_page.dart';
import 'package:mawadda_app/auth/utils/auth_string_util.dart';

import '../components/auth_form_component.dart';
import '../components/password_form_component.dart';
import 'login_page.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final nameCtr = TextEditingController();
    final emailCtr = TextEditingController();
    final passwordCtr = TextEditingController();
    final confirmPasswordCtr = TextEditingController();
    final RxBool isNameOke = false.obs;
    final RxBool isEmailOke = false.obs;
    final RxBool isPasswordOke = false.obs;
    final RxBool isPasswordConfirmOke = false.obs;

    return Scaffold(
      body: Container(
        color: const Color(0XFFFFD4AB),
        padding: EdgeInsets.all(10.r),
        child: Center(
          child: ListView(
            children: [
              Image.asset(
                'assets/login_top_picture.png',
                height: 0.3.sh,
              ),
              DefaultTextStyle(
                style: GoogleFonts.averiaGruesaLibre(color: Colors.white),
                child: Container(
                  padding: EdgeInsets.only(
                    left: 10.r,
                    right: 10.r,
                  ),
                  // height: 0.65.sh,

                  child: Stack(
                    alignment: AlignmentDirectional.topCenter,
                    children: [
                      SvgPicture.asset(
                        'assets/bg_card_login.svg',
                        width: 1.sw,
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          left: 10.r,
                          right: 10.r,
                          top: 20.r,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 20.h,
                            ),
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
                            SizedBox(
                              height: 20.h,
                            ),
                            AuthFormComponentt(
                              formKey: 'name',
                              controller: nameCtr,
                              hintText: 'Your Name',
                              textInputType: TextInputType.text,
                              validator: (value) => validateEmailNameForm(
                                context: context,
                                value: value,
                                isEmail: false,
                                isNameOke: isNameOke,
                              ),
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            AuthFormComponentt(
                              formKey: 'email',
                              controller: emailCtr,
                              hintText: 'Your Email',
                              textInputType: TextInputType.emailAddress,
                              validator: (value) => validateEmailNameForm(
                                context: context,
                                value: value,
                                isEmail: true,
                                isEmailOke: isEmailOke,
                              ),
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            PasswordFormComponentt(
                              formKey: 'password',
                              controller: passwordCtr,
                              hintText: 'Set Your Password',
                              textInputType: TextInputType.text,
                              validator: (value) => validatePassowrdForm(
                                context: context,
                                password: value,
                                isPasswordOke: isPasswordOke,
                              ),
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            PasswordFormComponentt(
                              formKey: 'confirm_password',
                              controller: confirmPasswordCtr,
                              hintText: 'Confirm Your Password',
                              textInputType: TextInputType.text,
                              validator: (value) => validateConfirmPassowrdForm(
                                context: context,
                                password: passwordCtr.text,
                                confirmPassword: value,
                                isConfirmPasswordOke: isPasswordConfirmOke,
                              ),
                            ),
                            SizedBox(
                              height: 40.h,
                            ),
                            SizedBox(
                              height: 38.h,
                              width: 0.8.sw,
                              child: Obx(
                                () => ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: isEmailOke.value == true &&
                                            isNameOke.value == true &&
                                            isPasswordOke.value == true &&
                                            isPasswordConfirmOke.value == true
                                        ? const Color(0xff70303A)
                                        : Colors.grey,
                                  ),
                                  onPressed: () {
                                    if (isEmailOke.value == true &&
                                        isNameOke.value == true &&
                                        isPasswordOke.value == true &&
                                        isPasswordConfirmOke.value == true) {
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const AfterRegisterPage(),
                                        ),
                                      );
                                    }
                                  },
                                  child: const Text(
                                    'Sign Up',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
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
                                    color: const Color(0xff70303A),
                                    fontSize: 9.sp,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const LoginPage(),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    ' Login',
                                    style: TextStyle(
                                      color: const Color(0xffCB442B),
                                      fontSize: 9.sp,
                                      fontWeight: FontWeight.w600,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ),
                              ],
                            )
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
      ),
    );
  }
}
