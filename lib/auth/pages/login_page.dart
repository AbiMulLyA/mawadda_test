import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:mawadda_app/auth/components/auth_form_component.dart';
import 'package:mawadda_app/auth/components/password_form_component.dart';
import 'package:mawadda_app/auth/pages/register_page.dart';
import 'package:mawadda_app/auth/utils/auth_string_util.dart';

@RoutePage()
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final emailCtr = TextEditingController();
    final passwordCtr = TextEditingController();
    final RxBool isPasswordOke = false.obs;
    final RxBool isEmailOke = false.obs;

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
                  height: 0.65.sh,
                  // width: 1.sw,
                  child: Stack(
                    alignment: AlignmentDirectional.topCenter,
                    children: [
                      SvgPicture.asset(
                        'assets/bg_card_login.svg',
                        width: 1.sw,
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 20.h,
                          ),
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
                          SizedBox(
                            height: 20.h,
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              left: 10.r,
                              right: 10.r,
                            ),
                            child: AuthFormComponentt(
                              formKey: 'email',
                              controller: emailCtr,
                              hintText: 'Your Email',
                              textInputType: TextInputType.emailAddress,
                              validator: (value) => validateEmailNameForm(
                                context: context,
                                isEmail: true,
                                value: value,
                                isEmailOke: isEmailOke,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              left: 10.r,
                              right: 10.r,
                            ),
                            child: PasswordFormComponentt(
                              formKey: 'password',
                              controller: passwordCtr,
                              hintText: 'Your Password',
                              textInputType: TextInputType.text,
                              validator: (value) => validatePassowrdForm(
                                context: context,
                                password: value,
                                isPasswordOke: isPasswordOke,
                              ),
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
                                          isPasswordOke.value == true
                                      ? const Color(0xff70303A)
                                      : Colors.grey,
                                ),
                                onPressed: () {},
                                child: const Text(
                                  'Login',
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
                                '*if you dont have created any account, please',
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
                                      builder: (context) =>
                                          const RegisterPage(),
                                    ),
                                  );
                                },
                                child: Text(
                                  'Sign Up',
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
