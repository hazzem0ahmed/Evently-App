import 'package:evently/core/app_themes.dart';
import 'package:evently/l10n/generated/app_localizations.dart';
import 'package:evently/provider/home_provider.dart';
import 'package:evently/screens/card_details.dart';
import 'package:evently/screens/create_account/create_account_screen.dart';
import 'package:evently/screens/event_edit.dart';
import 'package:evently/screens/event_managa/event_managment.dart';
import 'package:evently/screens/forgot_password.dart';
import 'package:evently/screens/home_screen/home_screen.dart';
import 'package:evently/screens/login_screen.dart';
import 'package:evently/screens/on_boarding/on_boarding_screen.dart';
import 'package:evently/screens/set_up/set_up_screen.dart';
import 'package:evently/screens/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(EventlyApp());
}

class EventlyApp extends StatelessWidget {
  const EventlyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeProvider(),

      builder: (context, child) {
        var provider = Provider.of<HomeProvider>(context);
        return MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          locale: Locale(provider.locale),
          theme: AppThemes.lightTheme,
          darkTheme: AppThemes.darkTheme,
          themeMode: provider.appTheme,
          debugShowCheckedModeBanner: false,
          routes: {
            SplashScreen.routeName: (context) => SplashScreen(),
            OnBoardingScreen.routeName:(context) => OnBoardingScreen(),
            SetUpScreen.routeName: (context) => SetUpScreen(),
            LoginScreen.routeName: (context) => LoginScreen(),
            ForgotPasswordScreen.routeName:(context) => ForgotPasswordScreen(),
            CreateAccountScreen.routeName:(context) => CreateAccountScreen(),
            HomeScreen.routeName:(context) => HomeScreen(),
            EventManagement.routeName:(context) => EventManagement(),
            CardDetailsScreen.routeName:(context) => CardDetailsScreen(),
            EventEdit.routeName:(context) => EventEdit()
          },
          initialRoute: SplashScreen.routeName,
        );
      },
    );
  }
}
