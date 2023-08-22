// ignore_for_file: public_member_api_docs, sort_constructors_first, unused_import
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../auth/pages/auth_page.dart';
//import '../../auth/utils/auth_string_util.dart';
import '../../profile/utils/profile_string_util.dart';
import '../../core/router/router.dart';
import '../components/edit_profile_form_components.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final nameCtr = TextEditingController();
    final emailCtr = TextEditingController();
    final birthCtr = TextEditingController();
    final countryCtr = TextEditingController();
    final phoneCtr = TextEditingController();
    final RxBool isNameTrue = false.obs;
    final RxBool isEmailTrue = false.obs;
    final RxBool isBirthTrue = false.obs;
    final RxBool isCountryTrue = false.obs;
    final RxBool isPhoneTrue = false.obs;

    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.only(
        top: 100.r,
        right: 12.r,
        left: 12.r,
      ),
      constraints: const BoxConstraints.expand(),
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/image_back.png"), fit: BoxFit.cover),
      ),
      child: Column(
        children: [
          const Icon(
            Icons.person_rounded,
            color: Colors.black,
            size: 50,
          ),
          SizedBox(
            height: 10.h,
          ),
          ProfileFormComponent(
              formKey: 'name',
              controller: nameCtr,
              hintText: 'Your name',
              textInputType: TextInputType.emailAddress,
              validator: (value) => validateNameForm(
                    context: context,
                    isName: true,
                    value: value,
                    isNameTrue: isNameTrue,
                  )),
          SizedBox(
            height: 10.h,
          ),
          ProfileFormComponent(
              formKey: 'email',
              controller: emailCtr,
              hintText: 'Your Email',
              textInputType: TextInputType.emailAddress,
              validator: (value) => validateEmailForm(
                    context: context,
                    isEmail: true,
                    value: value,
                    isEmailTrue: isEmailTrue,
                  )),
          SizedBox(
            height: 10.h,
          ),
          /*ProfileFormComponent(
                formKey: 'birthdate',
                controller: birthCtr,
                hintText: 'Birth Date (DD/MM/YY)',
                textInputType: TextInputType.datetime,
                validator: (value) => ()),
            SizedBox(
              height: 10.h,
            ),
            ProfileFormComponent(
                formKey: 'country',
                controller: countryCtr,
                hintText: 'Your Country (e.g. Malaysia)',
                textInputType: TextInputType.text,
                validator: (value) => ()),
            SizedBox(
              height: 10.h,
            ),
            ProfileFormComponent(
                formKey: 'phone',
                controller: phoneCtr,
                hintText: 'Your Phone Number (e.g. 60123123123)',
                textInputType: TextInputType.number,
                validator: (value) => ()),*/
          SizedBox(
            height: 10.h,
          ),
          SizedBox(
            height: 38.h,
            width: 0.8.sw,
            child: Obx(
              () => ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: isNameTrue.value == true ||
                            isEmailTrue.value == true ||
                            isBirthTrue.value == true ||
                            isCountryTrue.value == true ||
                            isPhoneTrue.value == true
                        ? const Color(0xffFAC6EA)
                        : Colors.grey,
                    side: const BorderSide(width: 3.0, color: Colors.black)),
                onPressed: () {
                  if (isNameTrue.value == true ||
                      isEmailTrue.value == true ||
                      isBirthTrue.value == true ||
                      isCountryTrue.value == true ||
                      isPhoneTrue.value == true) {
                    context.router.replace(const HomeRoute());
                  }
                },
                child: const Text(
                  'Save Profile',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
