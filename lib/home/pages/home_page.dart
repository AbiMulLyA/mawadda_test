// ignore_for_file: public_member_api_docs, sort_constructors_first, unused_import
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mawadda_app/core/navigation/bloc/navigation_bloc.dart';
import 'package:mawadda_app/profile/pages/edit_profile_page.dart';

import '../../auth/pages/auth_page.dart';
import '../../core/router/router.dart';
import '../../mission/pages/mission_page.dart';
import '../../profile/pages/profile_page.dart';

// import 'package:mawadda_app/auth/components/auth_form_component.dart';
// import 'package:mawadda_app/auth/pages/register_page.dart';
// import 'package:mawadda_app/auth/pages/succeed_signup.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: NavigationMain());
  }
}

class NavigationMain extends StatefulWidget {
  const NavigationMain({super.key});

  @override
  State<NavigationMain> createState() => _NavigationMainState();
}

class _NavigationMainState extends State<NavigationMain> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Mawadda',
          style: GoogleFonts.dawningOfANewDay(
              color: Colors.black,
              fontSize: 24.sp,
              fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xffD1B1BE),
        actions: <Widget>[
          IconButton(
              onPressed: () {
                // context.router.replace(const AuthRoute());
                context.read<NavigationBloc>().add(const AuthEv());
              },
              icon: const Icon(Icons.logout, color: Colors.black))
        ],
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: const Color(0xffB4B0CE),
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            icon: Icon(
              Icons.home_outlined,
              color: Colors.black,
            ),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(
              Icons.flag_outlined,
              color: Colors.black,
            ),
            label: 'Missions',
          ),
          NavigationDestination(
            icon: Icon(
              Icons.person_outlined,
              color: Colors.black,
            ),
            label: 'Profile',
          ),
        ],
      ),
      extendBodyBehindAppBar: true,
      body: <Widget>[
        Container(
          alignment: Alignment.center,
          constraints: const BoxConstraints.expand(),
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/image_back.png"), fit: BoxFit.cover),
          ),
          child: DefaultTextStyle(
            style: GoogleFonts.averiaGruesaLibre(color: Colors.black),
            child: ListView(
              children: [
                Container(
                  height: 254.h,
                  width: 329.w,
                  padding: const EdgeInsets.all(15),
                  child: const Image(
                      image: AssetImage('assets/main_header_new.png')),
                ),

//--------------Container-1 [Check Profile]
                Container(
                  padding: EdgeInsets.only(top: 10.r, left: 10.r, right: 10.r),
                  child: Stack(
                    alignment: AlignmentDirectional.topCenter,
                    children: [
                      Card(
                        elevation: 0,
                        color: Colors.white,
                        shape: const RoundedRectangleBorder(
                            side: BorderSide(color: Colors.black, width: 3),
                            borderRadius:
                                BorderRadius.all(Radius.circular(25))),
                        child: SizedBox(
                          width: 1.sw,
                          height: 100,
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Text(
                                  'Have you completed\nyour profile?',
                                  style: GoogleFonts.averiaGruesaLibre(
                                      fontSize: 16.sp),
                                ),
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            const Color(0xFFB4B0CE),
                                        shape: RoundedRectangleBorder(
                                            side: const BorderSide(
                                                color: Colors.black, width: 3),
                                            borderRadius:
                                                BorderRadius.circular(10))),
                                    onPressed: () {},
                                    child: Text(
                                      'Check Profile',
                                      style: GoogleFonts.averiaGruesaLibre(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ))
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

//-------------Container-2 [Start Mission]
                Container(
                  padding: EdgeInsets.only(top: 10.r, left: 10.r, right: 10.r),
                  child: Stack(
                    alignment: AlignmentDirectional.topCenter,
                    children: [
                      Card(
                        elevation: 0,
                        color: Colors.white,
                        shape: const RoundedRectangleBorder(
                            side: BorderSide(color: Colors.black, width: 3),
                            borderRadius:
                                BorderRadius.all(Radius.circular(25))),
                        child: SizedBox(
                          width: 1.sw,
                          height: 200,
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Let's Start\nthe Missions",
                                      style: GoogleFonts.averiaGruesaLibre(
                                          fontSize: 20.sp),
                                    ),
                                    Text(
                                      'Learn something\nnew to prepare\nyourself for\nmarriage',
                                      style: GoogleFonts.averiaGruesaLibre(
                                          fontSize: 10.sp),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'assets/icon_mission_new.png',
                                      width: 0.35.sw,
                                    ),
                                    ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                const Color(0xFFFAC6EA),
                                            shape: RoundedRectangleBorder(
                                                side: const BorderSide(
                                                    color: Colors.black,
                                                    width: 3),
                                                borderRadius:
                                                    BorderRadius.circular(10))),
                                        onPressed: () {},
                                        child: Text('Start',
                                            style:
                                                GoogleFonts.averiaGruesaLibre(
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.bold)))
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

//-------------Container-3 [Articles]
                Container(
                  padding: EdgeInsets.only(top: 10.r, left: 10.r, right: 10.r),
                  child: Stack(
                    alignment: AlignmentDirectional.topCenter,
                    children: [
                      Card(
                        elevation: 0,
                        color: Colors.white,
                        shape: const RoundedRectangleBorder(
                            side: BorderSide(color: Colors.black, width: 3),
                            borderRadius:
                                BorderRadius.all(Radius.circular(25))),
                        child: SizedBox(
                          width: 1.sw,
                          height: 200,
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Recent\nArticles",
                                      style: GoogleFonts.averiaGruesaLibre(
                                          fontSize: 20.sp),
                                    ),
                                    SizedBox(
                                      height: 5.h,
                                    ),
                                    Text(
                                      'No time to complete\nmission? It’s OK!\nLet’s read some new\ninsights here.',
                                      style: GoogleFonts.averiaGruesaLibre(
                                          fontSize: 10.sp),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'assets/icon_articles.png',
                                      width: 0.35.sw,
                                    ),
                                    ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                const Color(0xFFFAC6EA),
                                            shape: RoundedRectangleBorder(
                                                side: const BorderSide(
                                                    color: Colors.black,
                                                    width: 3),
                                                borderRadius:
                                                    BorderRadius.circular(10))),
                                        onPressed: () {},
                                        child: Text('Read More',
                                            style:
                                                GoogleFonts.averiaGruesaLibre(
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.bold)))
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

//-------------Container-4 [Videos]
                Container(
                  padding: EdgeInsets.only(
                      top: 10.r, left: 10.r, right: 10.r, bottom: 10.r),
                  child: Stack(
                    alignment: AlignmentDirectional.topCenter,
                    children: [
                      Card(
                        elevation: 0,
                        color: Colors.white,
                        shape: const RoundedRectangleBorder(
                            side: BorderSide(color: Colors.black, width: 3),
                            borderRadius:
                                BorderRadius.all(Radius.circular(25))),
                        child: SizedBox(
                          width: 1.sw,
                          height: 200,
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Watch\nVideos",
                                      style: GoogleFonts.averiaGruesaLibre(
                                          fontSize: 20.sp),
                                    ),
                                    SizedBox(
                                      height: 5.h,
                                    ),
                                    Text(
                                      'Easy way to get\nmore pre-marital\nknowledge on your\nleisure time!',
                                      style: GoogleFonts.averiaGruesaLibre(
                                          fontSize: 10.sp),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'assets/icon_videos.png',
                                      width: 0.35.sw,
                                    ),
                                    ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                const Color(0xFFFAC6EA),
                                            shape: RoundedRectangleBorder(
                                                side: const BorderSide(
                                                    color: Colors.black,
                                                    width: 3),
                                                borderRadius:
                                                    BorderRadius.circular(10))),
                                        onPressed: () {},
                                        child: Text('Watch More',
                                            style:
                                                GoogleFonts.averiaGruesaLibre(
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.bold)))
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),

//------------------------- PROFILE
        const MissionPage(),
        const ProfilePage(),
      ][currentPageIndex],
    );
  }
}
