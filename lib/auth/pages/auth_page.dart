import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mawadda_app/auth/pages/login_page.dart';
import 'package:mawadda_app/auth/pages/register_page.dart';
import 'package:mawadda_app/core/navigation/bloc/navigation_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
//import 'package:flutter_svg/svg.dart';

import '../../core/di/injector.dart';

@RoutePage()
class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => getIt<NavigationBloc>(),
        child: Container(
            constraints: const BoxConstraints.expand(),
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/image_back.png"),
                  fit: BoxFit.cover),
            ),
            padding: EdgeInsets.only(
              top: 20.r,
              left: 16.r,
              right: 16.r,
            ),
            child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        height: 0.5.sh,
                        width: 290.w,
                        decoration: BoxDecoration(
                            border: Border.all(width: 3, color: Colors.black),
                            color: Colors.white,
                            borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(20),
                                topLeft: Radius.circular(20))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Material(
                                color: Colors.transparent,
                                child: Text(
                                  'Mawadda',
                                  style: GoogleFonts.dawningOfANewDay(
                                      color: Colors.black,
                                      fontSize: 80,
                                      fontWeight: FontWeight.bold),
                                )),
                            Material(
                                color: Colors.transparent,
                                child: Text(
                                  'Pre-Marriage Guides\nfor Muslimah',
                                  style: GoogleFonts.averiaGruesaLibre(
                                      color: Colors.black, fontSize: 15),
                                ))
                          ],
                        )),
                    Container(
                      height: 0.2.sh,
                      width: 290.w,
                      decoration: BoxDecoration(
                          border: Border.all(width: 3, color: Colors.black),
                          color: Color(0xffDFDCEF),
                          borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20))),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 36.h,
                              width: 169.w,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Color(0xffFAC6EA),
                                    side: BorderSide(
                                        width: 3.0, color: Colors.black)),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const LoginPage(),
                                    ),
                                  );
                                },
                                child: const Text(
                                  'Login',
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ),
                            SizedBox(height: 10.h),
                            SizedBox(
                              height: 36.h,
                              width: 169.w,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Color(0xffB4B0CE),
                                    side: BorderSide(
                                        width: 3.0, color: Colors.black)),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const RegisterPage(),
                                    ),
                                  );
                                },
                                child: const Text(
                                  'Sign Up',
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ),
                          ]),
                    ),
                    SizedBox(height: 10.h),
                    Material(
                        color: Colors.transparent,
                        child: Text(
                          '*sign up if you have not created any account',
                          style: GoogleFonts.averiaGruesaLibre(
                              color: Colors.black, fontSize: 9),
                        )),
                  ]),
            )));
  }
}
