import 'package:basic_utils/basic_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

String? validateNameForm({
  required BuildContext context,
  required bool isName,
  RxBool? isNameTrue,
  String? value,
}) {
  if (StringUtils.isNullOrEmpty(value)) {
    if (isName) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        isNameTrue!.value = false;
      });
      return 'Email is required!';
    } else {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        isNameTrue!.value = false;
      });
      return 'Name is required!';
    }
  } else {
    if (isName) {
      if (!EmailUtils.isEmail(value!)) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          isNameTrue!.value = false;
        });
        return 'Email is invalid!';
      } else {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          isNameTrue!.value = true;
        });
      }
    } else {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        isNameTrue!.value = true;
      });
      return null;
    }
  }
  return null;
}

String? validateEmailForm({
  required BuildContext context,
  required bool isEmail,
  RxBool? isNameTrue,
  RxBool? isEmailTrue,
  String? value,
}) {
  if (StringUtils.isNullOrEmpty(value)) {
    if (isEmail) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        isEmailTrue!.value = false;
      });
      return 'Email is required!';
    } else {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        isNameTrue!.value = false;
      });
      return 'Name is required!';
    }
  } else {
    if (isEmail) {
      if (!EmailUtils.isEmail(value!)) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          isEmailTrue!.value = false;
        });
        return 'Email is invalid!';
      } else {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          isEmailTrue!.value = true;
        });
      }
    } else {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        isNameTrue!.value = true;
      });
      return null;
    }
  }
  return null;
}

String? validatePasswordForm({
  required BuildContext context,
  String? password,
  required RxBool isPasswordTrue,
}) {
  if (StringUtils.isNullOrEmpty(password)) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      isPasswordTrue.value = false;
    });
    return 'Password is required!';
  } else {
    if (password!.length < 8) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        isPasswordTrue.value = false;
      });
      return 'Password must be at least 8 characters!';
    } else {
      RegExp regex = RegExp(r'[0-9]');
      if (!regex.hasMatch(password)) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          isPasswordTrue.value = false;
        });
        return 'Password must contain number(s)!';
      } else {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          isPasswordTrue.value = true;
        });
      }
    }
    debugPrint('Password Validated : ${isPasswordTrue.value}');
    return null;
  }
}

String? validateConfirmPasswordForm({
  required BuildContext context,
  required String password,
  String? confirmPassword,
  required RxBool isConfirmPasswordTrue,
}) {
  if (StringUtils.isNullOrEmpty(confirmPassword)) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      isConfirmPasswordTrue.value = false;
    });
    return 'Password confirmation is required!';
  } else {
    if (confirmPassword != password) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        isConfirmPasswordTrue.value = false;
      });
      return 'Password does not match!';
    } else {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        isConfirmPasswordTrue.value = true;
      });
      return null;
    }
  }
}
// TODO Implement this library.