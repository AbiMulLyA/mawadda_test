import 'package:basic_utils/basic_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

String? validateEmailNameForm({
  required BuildContext context,
  required bool isEmail,
  RxBool? isNameOke,
  RxBool? isEmailOke,
  String? value,
}) {
  if (StringUtils.isNullOrEmpty(value)) {
    if (isEmail) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        isEmailOke!.value = false;
      });
      return 'Email is Required !';
    } else {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        isNameOke!.value = false;
      });
      return 'Name is Required !';
    }
  } else {
    if (isEmail) {
      if (!EmailUtils.isEmail(value!)) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          isEmailOke!.value = false;
        });
        return 'Email format is not valid !';
      } else {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          isEmailOke!.value = true;
        });
      }
    } else {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        isNameOke!.value = true;
      });
    }
    return null;
  }
}

String? validatePassowrdForm({
  required BuildContext context,
  String? password,
  required RxBool isPasswordOke,
}) {
  if (StringUtils.isNullOrEmpty(password)) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      isPasswordOke.value = false;
    });
    return 'Password is Required !';
  } else {
    if (password!.length < 8) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        isPasswordOke.value = false;
      });
      return 'Password must be at least 8 characters long';
    } else {
      RegExp regex = RegExp(r'[0-9]');
      if (!regex.hasMatch(password)) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          isPasswordOke.value = false;
        });
        return 'Password must contains number';
      } else {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          isPasswordOke.value = true;
        });
      }
    }

    debugPrint('password validated : ${isPasswordOke.value}');

    return null;
  }
}

String? validateConfirmPassowrdForm({
  required BuildContext context,
  required String password,
  String? confirmPassword,
  required RxBool isConfirmPasswordOke,
}) {
  if (StringUtils.isNullOrEmpty(confirmPassword)) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      isConfirmPasswordOke.value = false;
    });
    return 'Confirm Password is Required !';
  } else {
    if (confirmPassword != password) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        isConfirmPasswordOke.value = false;
      });
      return 'Password is not match !';
    } else {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        isConfirmPasswordOke.value = true;
      });
      return null;
    }
  }
}
