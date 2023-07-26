import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../components/auth_form_component.dart';
import 'login_page.dart';

class AfterRegisterPage extends StatelessWidget {
  const AfterRegisterPage({super.key});

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
                            'Your are in!',
                            style: TextStyle(
                              fontSize: 32.sp,
                            ),
                          ),
                          Text(
                            'Login to start your journey',
                            style: TextStyle(
                              fontSize: 20.sp,
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
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
                              onPressed: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const LoginPage(),
                                  ),
                                );
                              },
                              child: const Text(
                                'Login',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
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
