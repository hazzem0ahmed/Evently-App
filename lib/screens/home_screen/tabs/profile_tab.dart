import 'package:evently/core/app_assets.dart';
import 'package:evently/firebase/firebase_auth.dart';
import 'package:evently/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/app_colors.dart';
import '../../../l10n/generated/app_localizations.dart';
import '../../../provider/home_provider.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    var provider = Provider.of<HomeProvider>(context);
    var color = provider.isDark() ? AppColors.lightBlue : AppColors.white;
    var size = MediaQuery.sizeOf(context);
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(64),
                    ),
                  ),
                  child: SafeArea(
                    child: Row(
                      spacing: 16,
                      children: [
                        Container(
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: AppColors.lightBlue,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(1000),
                              bottomLeft: Radius.circular(1000),
                              bottomRight: Radius.circular(1000),
                              topLeft: Radius.circular(24),
                            ),
                          ),
                          child: SizedBox(
                            width: size.width * 0.2,
                            child: AspectRatio(
                              aspectRatio: 1,
                              child: Image.asset(AppAssets.appLogo),
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              FirebaseAuthServices.user?.displayName ?? "",
                              style: Theme.of(
                                context,
                              ).textTheme.titleLarge!.copyWith(color: color),
                            ),
                            Text(
                              FirebaseAuthServices.user?.email ?? "",
                              style: Theme.of(
                                context,
                              ).textTheme.bodySmall!.copyWith(color: color),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    locale.language,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color:
                          provider.isDark() ? AppColors.white : AppColors.black,
                    ),
                  ),
                ),
                Container(
                  height: size.height * 0.07,
                  margin: EdgeInsets.all(16),
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: DropdownButton<String>(
                    isExpanded: true,
                    value: provider.locale,
                    underline: SizedBox(),
                    items: [
                      DropdownMenuItem(value: "en", child: Text("English")),
                      DropdownMenuItem(
                        value: "ar",
                        child: Text("اللغة العربية"),
                      ),
                    ],
                    onChanged: (e) {
                      provider.changeLocale(e ?? "en");
                    },
                  ),
                ),
                SizedBox(height: size.height * 0.02),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    locale.theme,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color:
                          provider.isDark() ? AppColors.white : AppColors.black,
                    ),
                  ),
                ),
                Container(
                  height: size.height * 0.07,
                  margin: EdgeInsets.all(16),
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: DropdownButton<ThemeMode>(
                    isExpanded: true,
                    value: provider.appTheme,
                    underline: SizedBox(),
                    items: [
                      DropdownMenuItem(
                        value: ThemeMode.dark,
                        child: Text("Dark Mode"),
                      ),
                      DropdownMenuItem(
                        value: ThemeMode.light,
                        child: Text("Light Mode"),
                      ),
                    ],
                    onChanged: (e) {
                      provider.changeTheme(e ?? ThemeMode.dark);
                    },
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
            child: FilledButton(
              style: FilledButton.styleFrom(backgroundColor: Colors.red),
              onPressed: () async {
                try {
                  await FirebaseAuthServices().logOut();
                  await FirebaseAuthServices().signOutGoogle();
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    LoginScreen.routeName,
                    (Route<dynamic> route) => false,
                  );
                } catch (e) {
                  debugPrint(e.toString());
                }
              },
              child: Row(
                spacing: 10,
                children: [
                  Expanded(child: Text(locale.logOut)),
                  Icon(Icons.logout),
                ],
              ),
            ),
          ),
          SizedBox(height: size.height * 0.02),
        ],
      ),
    );
  }
}
