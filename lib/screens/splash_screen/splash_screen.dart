import 'package:evently/core/app_assets.dart';
import 'package:evently/firebase/firebase_auth.dart';
import 'package:evently/screens/home_screen/home_screen.dart';
import 'package:evently/screens/on_boarding/on_boarding_screen.dart';
import 'package:evently/screens/set_up/set_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = "/SplashScreen";

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool? firstOpen;
  @override
  void initState() {
    super.initState();
    isFirstOpen();
    Future.delayed(Duration(seconds: 3),(){
        String initialRoute = firstOpen == null? OnBoardingScreen.routeName:SetUpScreen.routeName;
        Navigator.pushReplacementNamed(context, initialRoute);
        var loggedIn = FirebaseAuthServices().isLoggedIn();
        var initial = loggedIn? HomeScreen.routeName:SetUpScreen() as String;
       Navigator.pushReplacementNamed(context, initial);
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Column(
        children: [
          Spacer(),
          Align(
            alignment: Alignment.center,
            child: Image.asset(
              AppAssets.appLogo,
              width: size.width*0.5,
            ),
          ),
          Spacer(),
          SafeArea(
            bottom: true,
            child: Image.asset(
              AppAssets.routeLogo,
              width: size.width * 0.5,
              alignment: Alignment.bottomCenter,
            ),
          ),
        ],
      ),
    );
  }
  Future<void> isFirstOpen() async{
    SharedPreferences prefs =await  SharedPreferences.getInstance();

    bool? isFirst = prefs.getBool("isFirst");
    firstOpen = isFirst;

  }
}
