import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:async';
import 'package:project_fab/localization/localization_en.dart';
import 'package:project_fab/localization/localization_nl.dart';

abstract class Localization {
  static Localization of(BuildContext context) {
    return Localizations.of<Localization>(context, Localization)!;
  }

  // Login
  String get loginSubmit; // Login
  String get loginPageTitle; //Login
  String get loginSubTitle; //"Welcome back!"
  String get loginEmail; //E-mail
  String get loginPassword; //Password
  String get loginRegister; //"Dont have an account yet?"
  String get loginForgotPassword; //"Forgot password"

  // Register
  String get registerPageTitle; //"Registreren"
  String get registerSubTitle; //"Maak een account aan"
  String get registerEmail; //"E-mail"
  String get registerDateOfBirth; //'Date of birth'
  String get registerPassword; //"Password"
  String get registerConfirmPassword; //"Confirm Pasword"
  String get registerSubmit; //'Sign up'
  String get registerLogin; //"Already have an account?"

  //Checkins
  String get checkinLeaveAMessage;
  String get checkinCheersAndComments; //'Cheers & comments'

  //Comments
  String get commentsThereAreNoComments; //'There are no comments yet',
  String get commentsLeaveAComment; //'Leave a comment'

  String get forgotPasswordTitle; ////"Forgot password"
  String get forgotPasswordSubtitle; // "No problem, we got you."
  String get forgotPasswordEmail; //"E-mail"
  String get forgotPasswordSubmit; //'Send me a reset link'
  String get forgotPasswordIDoRemember; //"Nevermind, I remember now!"

  String get profileFollowers; //"Followers",
  String get profileFriends; //"Friends",
  String get profileCheckins; //"Check-ins"

  String get profileSettingsFirstname; //'First name'
  String get profileSettingsLastname; //'Last name'
  String get profileSettingsLocation; //Location;
  String get profileSettingsAbout; //About

  String get home; //home
  String get discover; //discover
  String get people; //people
  String get profile; //profile
}

class FromABottleUpLocalizationsDelegate
    extends LocalizationsDelegate<Localization> {
  const FromABottleUpLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'nl'].contains(locale.languageCode);

  @override
  Future<Localization> load(Locale locale) => _load(locale);

  static Future<Localization> _load(Locale locale) async {
    final String name =
        (locale.countryCode == null) ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);
    Intl.defaultLocale = localeName;

    if (kDebugMode) {
      print('Locale "${locale.languageCode}".');
    }

    if (locale.languageCode == "nl") {
      return LocalizationNL();
    }

    return LocalizationEN();
  }

  @override
  bool shouldReload(LocalizationsDelegate<Localization> old) => false;
}
