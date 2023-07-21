import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mawadda_app/auth/components/auth_form_component.dart';

@RoutePage()
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final emailCtr = TextEditingController();
    final passwordCtr = TextEditingController();
    return Scaffold(
      body: Container(
        // height: 1.sh,
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
                          AuthFormComponentt(
                            formKey: 'email',
                            controller: emailCtr,
                            hintText: 'Your Email',
                            textInputType: TextInputType.emailAddress,
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          AuthFormComponentt(
                            formKey: 'password',
                            controller: passwordCtr,
                            hintText: 'Your Password',
                            textInputType: TextInputType.text,
                          ),
                          SizedBox(
                            height: 50.h,
                          ),
                          SizedBox(
                            height: 38.h,
                            width: 0.8.sw,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xff70303A)),
                              onPressed: () {},
                              child: const Text(
                                'Login',
                                style: TextStyle(
                                  color: Colors.white,
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
                                onTap: () {},
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
