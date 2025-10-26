import 'package:evently/l10n/generated/app_localizations.dart';
import 'package:evently/screens/event_managa/event_managment.dart';
import 'package:evently/screens/home_screen/tabs/favourite_tab.dart';
import 'package:evently/screens/home_screen/tabs/home_tab.dart';
import 'package:evently/screens/home_screen/tabs/map_tab.dart';
import 'package:evently/screens/home_screen/tabs/profile_tab.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/app_colors.dart';
import '../../provider/home_provider.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "/HomeScreen";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> tabs = [HomeTab(), MapTab(), FavouriteTab(), ProfileTab()];
  ValueNotifier<int> selectedIndex = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<HomeProvider>(context);
    var colorDarkLight = provider.isDark() ? AppColors.white : AppColors.lightBlue;
    var locale = AppLocalizations.of(context)!;
    return ValueListenableBuilder<int>(
      valueListenable: selectedIndex,
      builder:
          (context, value, child) => Scaffold(
            resizeToAvoidBottomInset: false,
            body: Column(
              children: [Expanded(child: tabs[value])],
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Navigator.pushNamed(context, EventManagement.routeName);
              },
              shape: CircleBorder(
                side: BorderSide(width: 4,color: colorDarkLight),
              ),
              child: const Icon(Icons.add),
            ),

            bottomNavigationBar: BottomNavigationBar(
              currentIndex: value < 2 ? value : value + 1,
              onTap: (index) {
                if (index == 2) {
                  Navigator.pushNamed(context, EventManagement.routeName);

                } else if (index > 2) {
                  selectedIndex.value = index - 1;
                } else {
                  selectedIndex.value = index;
                }
              },
              items: [
                BottomNavigationBarItem(
                  icon: const Icon(Icons.home_outlined),
                  activeIcon: const Icon(Icons.home_filled),
                  label: locale.home,
                ),
                BottomNavigationBarItem(
                  icon: const Icon(Icons.location_on_outlined),
                  activeIcon: const Icon(Icons.location_on),
                  label: locale.map,
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.location_on_outlined,
                    color:
                        Theme.of(
                          context,
                        ).bottomNavigationBarTheme.backgroundColor,
                  ),
                  label: "",
                ),
                BottomNavigationBarItem(
                  icon: const Icon(Icons.favorite_border),
                  activeIcon: const Icon(Icons.favorite),
                  label: locale.love,
                ),
                BottomNavigationBarItem(
                  icon: const Icon(Icons.person_2_outlined),
                  activeIcon: const Icon(Icons.person),
                  label: locale.profile,
                ),
              ],
            ),
          ),
    );
  }
}
