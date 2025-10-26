import 'package:evently/core/model/category.dart';
import 'package:evently/firebase/firebase_auth.dart';
import 'package:evently/l10n/generated/app_localizations.dart';
import 'package:evently/provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/app_colors.dart';
//ignore: must_be_immutable
class HomeHeader extends StatelessWidget {
   List<CategoryDM> categoriesList;
   CategoryDM selectedCategory;
   Function(CategoryDM) onCategorySelected;

  HomeHeader({
    required this.selectedCategory,
    required this.categoriesList,
    required this.onCategorySelected,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    var provider = Provider.of<HomeProvider>(context);
    var colorSelection = provider.isDark();
    var colorDarkLight = colorSelection ? AppColors.lightBlue : AppColors.white;

    return Container(
      decoration: BoxDecoration(
        color: colorSelection ? AppColors.darkPurple : AppColors.purple,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
      ),
      child: SafeArea(
        child: Column(
          spacing: 20,
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Row(
                    spacing: 8,
                    children: [
                      Expanded(
                        child: Column(
                          spacing: 10,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              locale.welcomeBack,
                              style: Theme.of(
                                context,
                              ).textTheme.bodyLarge!.copyWith(
                                color:
                                    colorSelection
                                        ? AppColors.lightBlue
                                        : AppColors.white,
                              ),
                            ),
                            Text(
                              FirebaseAuthServices.user?.displayName ?? "",
                              style: Theme.of(
                                context,
                              ).textTheme.titleLarge!.copyWith(
                                color:
                                    colorSelection
                                        ? AppColors.lightBlue
                                        : AppColors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          provider.changeTheme(
                            provider.isDark()
                                ? ThemeMode.light
                                : ThemeMode.dark,
                          );
                        },
                        icon: Icon(
                          provider.isDark()
                              ? Icons.dark_mode
                              : Icons.light_mode,
                          color: colorDarkLight,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          provider.changeLocale(provider.isEn() ? "ar" : "en");
                        },
                        child: Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: colorDarkLight,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            provider.isEn() ? "EN" : "ع",
                            style: TextStyle(
                              color:
                                  provider.isDark()
                                      ? AppColors.darkPurple
                                      : AppColors.purple,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: MediaQuery.sizeOf(context).height * 0.02),
                  Row(
                    spacing: 10,
                    children: [
                      Icon(Icons.location_on_outlined, color: colorDarkLight),
                      Text(
                        locale.cairoEgypt,
                        style: Theme.of(
                          context,
                        ).textTheme.titleLarge!.copyWith(color: colorDarkLight),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            DefaultTabController(
              length: categoriesList.length,
              child: TabBar(
                onTap: (index){
                  onCategorySelected(categoriesList[index]);
                },
                indicator: null,
                indicatorColor: Colors.transparent,
                dividerHeight: 0,
                isScrollable: true,
                padding: EdgeInsets.symmetric(horizontal: 8),
                labelPadding: EdgeInsets.symmetric(horizontal: 8),
                tabAlignment: TabAlignment.start,
                tabs:
                    categoriesList
                        .map(
                          (category) => Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 8,
                              horizontal: 16,
                            ),
                            decoration: BoxDecoration(
                              color:
                                  category.id == selectedCategory.id
                                      ? AppColors.white
                                      : Colors.transparent,
                              borderRadius: BorderRadius.circular(1000),
                              border: Border.all(
                                width: 1,
                                color: colorDarkLight,
                              ),
                            ),
                            child: Row(
                              spacing: 8,
                              children: [
                                Icon(
                                  category.icon,
                                  color:
                                      category.id == selectedCategory.id
                                          ? Theme.of(
                                            context,
                                          ).colorScheme.primary
                                          : AppColors.white,
                                ),
                                Text(
                                  provider.isEn()
                                      ? category.nameEN
                                      : category.nameAR,
                                  style: TextStyle(
                                    color:
                                        category.id == selectedCategory.id
                                            ? Theme.of(
                                              context,
                                            ).colorScheme.primary
                                            : AppColors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                        .toList(),
              ),
            ),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.01),
          ],
        ),
      ),
    );
  }
}
