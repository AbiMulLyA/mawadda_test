import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mawadda_app/profile/pages/edit_profile_page.dart';

import '../../auth/pages/auth_page.dart';
import '../../core/router/router.dart';

class MissionPage extends StatefulWidget {
  const MissionPage({super.key});

  @override
  State<MissionPage> createState() => _MissionPageState();
}

class _MissionPageState extends State<MissionPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      constraints: const BoxConstraints.expand(),
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/image_back.png"), fit: BoxFit.cover),
      ),
      padding: EdgeInsets.only(top: 10.r, left: 10.r, right: 10.r),
      child: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          Card(
              elevation: 0,
              color: Colors.white,
              shape: const RoundedRectangleBorder(
                  side: BorderSide(color: Colors.black, width: 3),
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 10.h),
                  const Text("How far are you?"),
                  SizedBox(height: 10.h),
                  Container(
                    alignment: Alignment.center,
                    height: 38.h,
                    width: 1.sw,
                    decoration: BoxDecoration(
                      border: Border.all(width: 3, color: Colors.black),
                      color: const Color(0xffDFDCEF),
                      borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                      ),
                    ),
                    child: const Text("You have completed 0/10 mission(s)"),
                  )
                ],
              )),
        ],
      ),
    );
  }
}
