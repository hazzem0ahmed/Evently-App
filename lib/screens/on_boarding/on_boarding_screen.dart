import 'package:evently/core/app_assets.dart';
import 'package:evently/screens/set_up/set_up_screen.dart';
import 'package:evently/widgets/on_boarding_design.dart';
import 'package:evently/widgets/theme_switch.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:evently/widgets/language_switch.dart';
import '../../l10n/generated/app_localizations.dart';
import '../../provider/home_provider.dart';

class OnBoardingScreen extends StatefulWidget {
  static const String routeName = "/OnBoardingScreen";

  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  bool isFirstPage = true;
  bool isLastPage = false;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<HomeProvider>(context);
    var locale = AppLocalizations.of(context)!;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              PageView(
                onPageChanged: (index) {
                  provider.setPageIndex(index);
                  setState(() {
                    isFirstPage = (index == 0);
                    isLastPage = (index == 2);
                  });
                },
                controller: _pageController,
                children: [
                  OnBoardingScreenDesign(
                    image: AppAssets.lightIntro1Img,
                    title: locale.findEventsThatInspireYou,
                    content: locale.intro1,
                    languageToggle: LanguageSwitch(),
                    themeToggle: ThemeSwitch(),
                  ),
                  OnBoardingScreenDesign(
                    image:
                        provider.appTheme == ThemeMode.light
                            ? AppAssets.lightIntro2Img
                            : AppAssets.darkIntro2Logo,
                    title: locale.findEventsThatInspireYou,
                    content: locale.intro1,
                  ),
                  OnBoardingScreenDesign(
                    image:
                        provider.appTheme == ThemeMode.light
                            ? AppAssets.lightIntro3Img
                            : AppAssets.darkIntro3Logo,
                    title: locale.findEventsThatInspireYou,
                    content: locale.intro1,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    isFirstPage
                        ? SizedBox()
                        : IconButton(
                          style: IconButton.styleFrom(
                            iconSize: 30,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                width: 2,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                              borderRadius: BorderRadius.circular(100),
                            ),
                          ),
                          onPressed: () {
                            _pageController.previousPage(
                              duration: Duration(milliseconds: 300),
                              curve: Curves.easeIn,
                            );
                          },
                          icon: Icon(Icons.arrow_back_outlined),
                        ),
                    Flexible(
                      child: SmoothPageIndicator(
                        axisDirection: Axis.horizontal,
                        effect: ExpandingDotsEffect(),
                        controller: _pageController,
                        count: 3,
                      ),
                    ),
                    IconButton(
                      style: IconButton.styleFrom(
                        iconSize: 30,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            width: 2,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                      onPressed: () {
                        if (isLastPage) {
                          _confirmIsFirst();
                        } else {
                          _pageController.nextPage(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeIn,
                          );
                        }
                      },
                      icon: Icon(Icons.arrow_forward_outlined),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _confirmIsFirst() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool("isFirst", true);
    if(!mounted)return;
    Navigator.pushReplacementNamed(context, SetUpScreen.routeName);
  }
}
