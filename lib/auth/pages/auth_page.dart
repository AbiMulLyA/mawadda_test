import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/di/injector.dart';
import '../../core/navigation/bloc/navigation_bloc.dart';
import 'login_page.dart';
import 'register_page.dart';

@RoutePage()
class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<NavigationBloc>(),
      child: Container(
        color: const Color(0XFFFFD4AB),
        padding: EdgeInsets.only(
          top: 20.r,
          left: 16.r,
          right: 16.r,
        ),
        child: Center(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(
                'assets/welcome_card.svg',
              ),
              SizedBox(
                height: 20.h,
              ),
              SizedBox(
                height: 36.h,
                width: 169.w,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff70303A)),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginPage(),
                      ),
                    );
                  },
                  child: Text(
                    'Login',
                    style: GoogleFonts.averiaGruesaLibre(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              SizedBox(
                height: 36.h,
                width: 169.w,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff70303A)),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RegisterPage(),
                      ),
                    );
                  },
                  child: Text(
                    'Sign up',
                    style: GoogleFonts.averiaGruesaLibre(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              Text(
                '*Sign up if you have not created any account',
                style: GoogleFonts.averiaGruesaLibre(
                  color: const Color(0xff70303A),
                  fontSize: 9.sp,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
