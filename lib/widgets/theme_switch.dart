import 'package:flutter/material.dart';
import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:provider/provider.dart';
import '../provider/home_provider.dart';

class ThemeSwitch extends StatelessWidget {
  const ThemeSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<HomeProvider>(context);
    return AnimatedToggleSwitch.rolling(
      onChanged: (value){
        provider.changeTheme(value);
      },
      current: provider.appTheme,
      values: [ThemeMode.light, ThemeMode.dark],
      indicatorIconScale: 1.5,
      padding: EdgeInsets.zero,
      borderWidth: 1,
      style: ToggleStyle(
        indicatorColor: Theme.of(context).colorScheme.primary,
        backgroundColor: Theme.of(context).colorScheme.surface,
        borderColor: Theme.of(context).colorScheme.primary,
      ),
      indicatorSize: Size.fromWidth(50),
      iconBuilder: (value, selected) {
        if (value == ThemeMode.light) {
          return Icon(Icons.light_mode);
        } else {
          return Icon(Icons.dark_mode);
        }
      },
    );
  }
}
