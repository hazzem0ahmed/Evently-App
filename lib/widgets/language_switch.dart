import 'package:evently/core/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:provider/provider.dart';
import '../provider/home_provider.dart';

class LanguageSwitch extends StatelessWidget {
  const LanguageSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<HomeProvider>(context);
    return AnimatedToggleSwitch.rolling(
      onChanged: (value){
        provider.changeLocale(value);
      },
      indicatorIconScale: 1.5,
      padding: EdgeInsets.zero,
      borderWidth: 1,
      style: ToggleStyle(
        indicatorColor: Theme.of(context).colorScheme.primary,
        backgroundColor: Theme.of(context).colorScheme.surface,
        borderColor: Theme.of(context).colorScheme.primary,
      ),
      indicatorSize: Size.fromWidth(50),
      current: provider.locale,
      values: ["en", "ar"],
      iconBuilder: (value, selected) {
        if (value == "en") {
          return Image.asset(AppAssets.englishLogo);
        } else {
          return Image.asset(AppAssets.arabicLogo);
        }
      },
    );
  }
}
