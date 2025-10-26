import 'package:evently/widgets/theme_switch.dart';
import 'package:flutter/material.dart';
import '../core/app_assets.dart';
import 'language_switch.dart';

//ignore: must_be_immutable
class OnBoardingScreenDesign extends StatelessWidget {
  final String image;
  final String title;
  final String content;
  LanguageSwitch? languageToggle;
  ThemeSwitch? themeToggle;

  OnBoardingScreenDesign({
    super.key,
    this.themeToggle,
    this.languageToggle,
    required this.image,
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return ListView(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.center,
              child: Image.asset(AppAssets.appLogo, width: size.width * 0.3),
            ),
            SizedBox(height: size.height * 0.02),
            Align(
              alignment: Alignment.center,
              child: Image.asset(
                image,
                width: double.infinity,
                height: size.height * 0.3,
              ),
            ),
            SizedBox(height: size.height * 0.02),
            Text(title, style: Theme.of(context).textTheme.titleLarge),
            SizedBox(height: size.height * 0.02),
            Text(content, style: Theme.of(context).textTheme.bodyLarge),
            SizedBox(height: size.height * 0.02),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [Align(child: languageToggle), Align(child: themeToggle)],
              ),
            ),
            SizedBox(height: size.height * 0.06),
          ],
        ),
      ],
    );
  }
}
