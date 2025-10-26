import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en')
  ];

  /// No description provided for @appName.
  ///
  /// In en, this message translates to:
  /// **'Evently'**
  String get appName;

  /// No description provided for @personalizeYourExperience.
  ///
  /// In en, this message translates to:
  /// **'Personalize Your Experience'**
  String get personalizeYourExperience;

  /// No description provided for @setUpMessage.
  ///
  /// In en, this message translates to:
  /// **'Choose your preferred theme and language to get started with a comfortable, tailored experience that suits your style'**
  String get setUpMessage;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @theme.
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get theme;

  /// No description provided for @letsGo.
  ///
  /// In en, this message translates to:
  /// **'Let\'s Go'**
  String get letsGo;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @passWord.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get passWord;

  /// No description provided for @forgotPassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot Password?'**
  String get forgotPassword;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @dontHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'Don\'t Have Account?'**
  String get dontHaveAccount;

  /// No description provided for @createAccount.
  ///
  /// In en, this message translates to:
  /// **'Create Account'**
  String get createAccount;

  /// No description provided for @or.
  ///
  /// In en, this message translates to:
  /// **'Or'**
  String get or;

  /// No description provided for @loginWithGoogle.
  ///
  /// In en, this message translates to:
  /// **'Login With Google'**
  String get loginWithGoogle;

  /// No description provided for @findEventsThatInspireYou.
  ///
  /// In en, this message translates to:
  /// **'Find Events That Inspire You'**
  String get findEventsThatInspireYou;

  /// No description provided for @intro1.
  ///
  /// In en, this message translates to:
  /// **'Dive into a world of events crafted to fit your unique interests. Whether you\'re into live music, art workshops, professional networking, or simply discovering new experiences, we have something for everyone. Our curated recommendations will help you explore, connect, and make the most of every opportunity around you.'**
  String get intro1;

  /// No description provided for @effortlessEventPlanning.
  ///
  /// In en, this message translates to:
  /// **'Effortless Event Planning'**
  String get effortlessEventPlanning;

  /// No description provided for @intro2.
  ///
  /// In en, this message translates to:
  /// **'Take the hassle out of organizing events with our all-in-one planning tools. From setting up invites and managing RSVPs to scheduling reminders and coordinating details, we’ve got you covered. Plan with ease and focus on what matters – creating an unforgettable experience for you and your guests.'**
  String get intro2;

  /// No description provided for @connectwithFriendsShareMoments.
  ///
  /// In en, this message translates to:
  /// **'Connect with Friends & Share Moments'**
  String get connectwithFriendsShareMoments;

  /// No description provided for @intro3.
  ///
  /// In en, this message translates to:
  /// **'Make every event memorable by sharing the experience with others. Our platform lets you invite friends, keep everyone in the loop, and celebrate moments together. Capture and share the excitement with your network, so you can relive the highlights and cherish the memories.'**
  String get intro3;

  /// No description provided for @forgetPassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot Password'**
  String get forgetPassword;

  /// No description provided for @resetPassword.
  ///
  /// In en, this message translates to:
  /// **'Reset PassWord'**
  String get resetPassword;

  /// No description provided for @register.
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get register;

  /// No description provided for @name.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get name;

  /// No description provided for @rePassWord.
  ///
  /// In en, this message translates to:
  /// **'Re Password'**
  String get rePassWord;

  /// No description provided for @alreadyHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'Already Have Account?'**
  String get alreadyHaveAccount;

  /// No description provided for @rePassword.
  ///
  /// In en, this message translates to:
  /// **'Re-enter Password'**
  String get rePassword;

  /// No description provided for @userNameRequired.
  ///
  /// In en, this message translates to:
  /// **'User Name is Required'**
  String get userNameRequired;

  /// No description provided for @userNameInvalid.
  ///
  /// In en, this message translates to:
  /// **'User Name is Invalid'**
  String get userNameInvalid;

  /// No description provided for @emailRequired.
  ///
  /// In en, this message translates to:
  /// **'Email Address is Required'**
  String get emailRequired;

  /// No description provided for @emailInvalid.
  ///
  /// In en, this message translates to:
  /// **'Email Address is Invalid'**
  String get emailInvalid;

  /// No description provided for @passwordRequired.
  ///
  /// In en, this message translates to:
  /// **'Password is Required'**
  String get passwordRequired;

  /// No description provided for @passwordUppercase.
  ///
  /// In en, this message translates to:
  /// **'Password Must Contain UpperCase Letters'**
  String get passwordUppercase;

  /// No description provided for @passwordLowercase.
  ///
  /// In en, this message translates to:
  /// **'Password Must Contain LowerCase Letters'**
  String get passwordLowercase;

  /// No description provided for @passwordNumber.
  ///
  /// In en, this message translates to:
  /// **'Password Must Contain Numbers'**
  String get passwordNumber;

  /// No description provided for @passwordSpecialChar.
  ///
  /// In en, this message translates to:
  /// **'Password Must Contain Special Characters'**
  String get passwordSpecialChar;

  /// No description provided for @passwordTooShort.
  ///
  /// In en, this message translates to:
  /// **'Password should Be Longer Than 8 Characters'**
  String get passwordTooShort;

  /// No description provided for @rePasswordRequired.
  ///
  /// In en, this message translates to:
  /// **'RePassword is Required'**
  String get rePasswordRequired;

  /// No description provided for @passwordNotMatch.
  ///
  /// In en, this message translates to:
  /// **'Password Does Not Match'**
  String get passwordNotMatch;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @map.
  ///
  /// In en, this message translates to:
  /// **'Map'**
  String get map;

  /// No description provided for @love.
  ///
  /// In en, this message translates to:
  /// **'Love'**
  String get love;

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @welcomeBack.
  ///
  /// In en, this message translates to:
  /// **'Welcome Back ✨'**
  String get welcomeBack;

  /// No description provided for @cairoEgypt.
  ///
  /// In en, this message translates to:
  /// **'Cairo , Egypt'**
  String get cairoEgypt;

  /// No description provided for @logOut.
  ///
  /// In en, this message translates to:
  /// **'Log Out'**
  String get logOut;

  /// No description provided for @createEvent.
  ///
  /// In en, this message translates to:
  /// **'Create Event'**
  String get createEvent;

  /// No description provided for @title.
  ///
  /// In en, this message translates to:
  /// **'Title'**
  String get title;

  /// No description provided for @eventTitle.
  ///
  /// In en, this message translates to:
  /// **'Event Title'**
  String get eventTitle;

  /// No description provided for @description.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get description;

  /// No description provided for @eventDescription.
  ///
  /// In en, this message translates to:
  /// **'Event Description'**
  String get eventDescription;

  /// No description provided for @titleIsRequired.
  ///
  /// In en, this message translates to:
  /// **'Title is Required'**
  String get titleIsRequired;

  /// No description provided for @descriptionIsRequired.
  ///
  /// In en, this message translates to:
  /// **'Description is Required'**
  String get descriptionIsRequired;

  /// No description provided for @eventDate.
  ///
  /// In en, this message translates to:
  /// **'Event Date'**
  String get eventDate;

  /// No description provided for @chooseDate.
  ///
  /// In en, this message translates to:
  /// **'Choose Date'**
  String get chooseDate;

  /// No description provided for @eventTime.
  ///
  /// In en, this message translates to:
  /// **'Event Time'**
  String get eventTime;

  /// No description provided for @chooseTime.
  ///
  /// In en, this message translates to:
  /// **'Choose Time'**
  String get chooseTime;

  /// No description provided for @chooseEventLocation.
  ///
  /// In en, this message translates to:
  /// **'Choose Event Location'**
  String get chooseEventLocation;

  /// No description provided for @location.
  ///
  /// In en, this message translates to:
  /// **'Location'**
  String get location;

  /// No description provided for @addEvent.
  ///
  /// In en, this message translates to:
  /// **'Add Event'**
  String get addEvent;

  /// No description provided for @eventDetails.
  ///
  /// In en, this message translates to:
  /// **'Event Details'**
  String get eventDetails;

  /// No description provided for @attention.
  ///
  /// In en, this message translates to:
  /// **'Attention'**
  String get attention;

  /// No description provided for @deleteContent.
  ///
  /// In en, this message translates to:
  /// **'You sure You Want to delete This Event'**
  String get deleteContent;

  /// No description provided for @yes.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get yes;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @setEventTitle.
  ///
  /// In en, this message translates to:
  /// **'Set Event Title'**
  String get setEventTitle;

  /// No description provided for @setEventDescirption.
  ///
  /// In en, this message translates to:
  /// **'Set Event Description'**
  String get setEventDescirption;

  /// No description provided for @setEventDate.
  ///
  /// In en, this message translates to:
  /// **'Set Event Date'**
  String get setEventDate;

  /// No description provided for @setEventTime.
  ///
  /// In en, this message translates to:
  /// **'Set Event Time'**
  String get setEventTime;

  /// No description provided for @invalidEventData.
  ///
  /// In en, this message translates to:
  /// **'Invalid Event Data'**
  String get invalidEventData;

  /// No description provided for @tryAgain.
  ///
  /// In en, this message translates to:
  /// **'Try Again'**
  String get tryAgain;

  /// No description provided for @creatingEvent.
  ///
  /// In en, this message translates to:
  /// **'Creating Event...'**
  String get creatingEvent;

  /// No description provided for @noFavourite.
  ///
  /// In en, this message translates to:
  /// **'No Favourite Events Found'**
  String get noFavourite;

  /// No description provided for @searchUsingTitle.
  ///
  /// In en, this message translates to:
  /// **'Search Using Event Title'**
  String get searchUsingTitle;

  /// No description provided for @search.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get search;

  /// No description provided for @successOperation.
  ///
  /// In en, this message translates to:
  /// **'Success Operation'**
  String get successOperation;

  /// No description provided for @eventCreatedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Event Created Successfully'**
  String get eventCreatedSuccessfully;

  /// No description provided for @ok.
  ///
  /// In en, this message translates to:
  /// **'Ok'**
  String get ok;

  /// No description provided for @failedOperation.
  ///
  /// In en, this message translates to:
  /// **'Failed Operation'**
  String get failedOperation;

  /// No description provided for @somethingWentWrong.
  ///
  /// In en, this message translates to:
  /// **'Something Went Wrong'**
  String get somethingWentWrong;

  /// No description provided for @editEvent.
  ///
  /// In en, this message translates to:
  /// **'Edit Event'**
  String get editEvent;

  /// No description provided for @updateEvent.
  ///
  /// In en, this message translates to:
  /// **'Update Event'**
  String get updateEvent;

  /// No description provided for @eventUpdateSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Event Updated Successfully'**
  String get eventUpdateSuccessfully;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar': return AppLocalizationsAr();
    case 'en': return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
