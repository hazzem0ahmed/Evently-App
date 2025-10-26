import 'package:evently/core/app_assets.dart';
import 'package:evently/l10n/generated/app_localizations.dart';
import 'package:evently/screens/login_screen.dart';
import 'package:evently/widgets/language_switch.dart';
import 'package:evently/widgets/theme_switch.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../provider/home_provider.dart';

class SetUpScreen extends StatelessWidget {
  static const String routeName = "/SetUpScreen";

  const SetUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<HomeProvider>(context);
    var size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 15,
            children: [
              Align(
                alignment: Alignment.center,
                child: Image.asset(
                  AppAssets.appLogoHorizontal,
                  width: size.width * 0.5,
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    provider.appTheme == ThemeMode.light
                        ? AppAssets.lightSetUpImg
                        : AppAssets.darkSetUpImg,
                  ),
                ),
              ),
              Text(
                AppLocalizations.of(context)!.personalizeYourExperience,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Text(
                AppLocalizations.of(context)!.setUpMessage,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              SizedBox(height: size.height * 0.01),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppLocalizations.of(context)!.language,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  LanguageSwitch(),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppLocalizations.of(context)!.theme,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  ThemeSwitch(),
                ],
              ),
              SizedBox(height: size.height * 0.009),
              FilledButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, LoginScreen.routeName);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Text(AppLocalizations.of(context)!.letsGo)],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
