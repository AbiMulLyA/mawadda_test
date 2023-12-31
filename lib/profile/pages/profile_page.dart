// ignore_for_file: public_member_api_docs, sort_constructors_first, unused_import
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mawadda_app/profile/pages/edit_profile_page.dart';

import '../../auth/pages/auth_page.dart';
import '../../core/router/router.dart';

enum CurrentProfilePage { profilePage, editProfilePage }

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  CurrentProfilePage currentPage = CurrentProfilePage.profilePage;
  @override
  Widget build(BuildContext context) {
    switch (currentPage) {
      case CurrentProfilePage.editProfilePage:
        return const EditProfilePage();
      default:
        return Container(
          alignment: Alignment.center,
          constraints: const BoxConstraints.expand(),
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/image_back.png"), fit: BoxFit.cover),
          ),
          child: DefaultTextStyle(
            style: GoogleFonts.averiaGruesaLibre(color: Colors.black),
            child: Container(
              padding: const EdgeInsets.all(15),
              child: ListView(
                children: [
                  const Icon(
                    Icons.person_rounded,
                    color: Colors.black,
                    size: 50,
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  const Text("(Username)"),
                  SizedBox(
                    height: 5.h,
                  ),
                  const Text("email_here@gmail.com"),
                  SizedBox(
                    height: 5.h,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFB4B0CE),
                        shape: RoundedRectangleBorder(
                            side:
                                const BorderSide(color: Colors.black, width: 3),
                            borderRadius: BorderRadius.circular(10))),
                    onPressed: () {
                      setState(() {
                        currentPage = CurrentProfilePage.editProfilePage;
                      });
                    },
                    child: Text(
                      'Edit Profile',
                      style: GoogleFonts.averiaGruesaLibre(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    padding:
                        EdgeInsets.only(top: 10.r, left: 10.r, right: 10.r),
                    child: Stack(
                      alignment: AlignmentDirectional.topCenter,
                      children: [
                        Card(
                            elevation: 0,
                            color: Colors.white,
                            shape: const RoundedRectangleBorder(
                                side: BorderSide(color: Colors.black, width: 3),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(height: 10.h),
                                const Text("You are now..."),
                                Image.asset(
                                  "assets/avatar_score.png",
                                  width: 162.w,
                                ),
                                const Text("Level 1"),
                                SizedBox(height: 10.h),
                                const Text("Beginner"),
                                SizedBox(height: 10.h),
                                Container(
                                  alignment: Alignment.center,
                                  height: 38.h,
                                  width: 1.sw,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 3, color: Colors.black),
                                    color: const Color(0xffDFDCEF),
                                    borderRadius: const BorderRadius.only(
                                      bottomRight: Radius.circular(20),
                                      bottomLeft: Radius.circular(20),
                                    ),
                                  ),
                                  child: const Text(
                                      "You have completed 0/10 mission(s)"),
                                )
                              ],
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
    }
  }
}

// class ProfilePageView extends StatelessWidget {
//   const ProfilePageView({super.key});

//   @override
//   Widget build(BuildContext context) {

//   }
// }
