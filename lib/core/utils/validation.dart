import 'package:evently/l10n/generated/app_localizations.dart';
import 'package:flutter/cupertino.dart';

class ValidationCheck {

  static String? validateUserName(String name, AppLocalizations locale) {
    if (name.isEmpty) {
      return locale.userNameRequired;
    } else if (!RegExp(r'^[a-zA-Z0-9\s]+$').hasMatch(name)) {
      return locale.userNameInvalid;
    }
    return null;
  }

  static String? validateEmail(String email, AppLocalizations locale) {
    if (email.isEmpty) {
      return locale.emailRequired;
    } else if (!RegExp(
      r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
    ).hasMatch(email)) {
      return locale.emailInvalid;
    }
    return null;
  }
  static String? validatePassWord(String password,AppLocalizations locale){
    if (password.isEmpty) {
      return locale.passwordRequired;
    } else if (!RegExp(r'[A-Z]').hasMatch(password)) {
      return locale.passwordUppercase;
    } else if (!RegExp(r'[a-z]').hasMatch(password)) {
      return locale.passwordLowercase;
    } else if (!RegExp(r'[0-9]').hasMatch(password)) {
      return locale.passwordNumber;
    } else if (!RegExp(
      r'[!@#$%^&*()]',
    ).hasMatch(password)) {
      return locale.passwordSpecialChar;
    } else if (password.length < 8) {
      return locale.passwordTooShort;
    }
    return null;
  }
  static String? validateRePassword(String rePassword,String password, AppLocalizations locale) {
    if (rePassword.isEmpty) {
      return locale.rePasswordRequired;
    } else if (rePassword != password) {
      return locale.passwordNotMatch;
    }
    return null;
  }

 static String? emptyTitleValidation(String? input,BuildContext context){
   var locale = AppLocalizations.of(context)!;
    if(input!.isEmpty){
      return locale.titleIsRequired;
    }
    return null;

  }
  static String? emptyDescriptionValidation(String? input,BuildContext context){
    var locale = AppLocalizations.of(context)!;

    if(input!.isEmpty){
      return locale.descriptionIsRequired;
    }
    return null;

  }
}
