import 'package:evently/core/app_colors.dart';
import 'package:evently/core/model/event_dm.dart';
import 'package:evently/core/utils/app_dialogs.dart';
import 'package:evently/firebase/events_database.dart';
import 'package:evently/provider/home_provider.dart';
import 'package:evently/screens/event_edit.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../l10n/generated/app_localizations.dart';

class CardDetailsScreen extends StatefulWidget {
  static const String routeName = "/CardDetailsScreen";

  const CardDetailsScreen({super.key});

  @override
  State<CardDetailsScreen> createState() => _CardDetailsScreenState();
}

class _CardDetailsScreenState extends State<CardDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<HomeProvider>(context);
    TextStyle textStyle = Theme.of(context).textTheme.titleLarge!.copyWith(
      color: Theme.of(context).colorScheme.primary,
    );
    var locale = AppLocalizations.of(context)!;
    var info = ModalRoute.of(context)?.settings.arguments as EventsDM;
    return Scaffold(
      appBar: AppBar(
        title: Text(locale.eventDetails, style: textStyle),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              spacing: 8,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      EventEdit.routeName,
                      arguments: info,
                    );
                  },
                  child: Icon(Icons.edit),
                ),
                GestureDetector(
                  onTap: () {
                    AppDialogs.showActionDialog(
                      context,
                      title: locale.attention,
                      content: locale.deleteContent,
                      posActionTitle: locale.yes,
                      posActionClick: () async {
                        EventDataBase().deleteEvent(info.id);
                        Navigator.pop(context);
                      },
                      negActionTitle: locale.cancel,
                      negActionClick: () {
                        Navigator.pop(context);
                      },
                    );
                  },
                  child: Icon(Icons.delete_outline, color: Colors.red),
                ),
              ],
            ),
          ),
        ],
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: 1,
        itemBuilder:
            (context, index) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 10,
              children: [
                AspectRatio(
                  aspectRatio: 361 / 203,
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      image: DecorationImage(
                        image: AssetImage(info.category.image),
                      ),
                    ),
                  ),
                ),
                Text(info.title, style: textStyle),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 0, vertical: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      width: 2,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  child: ListTile(
                    leading: Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      child: Icon(
                        Icons.calendar_month,
                        color:
                            provider.isDark()
                                ? AppColors.black
                                : AppColors.white,
                        size: 35,
                      ),
                    ),
                    title: Text(
                      DateFormat(
                        "dd/MM/yyyy",
                      ).format(DateTime.fromMicrosecondsSinceEpoch(info.date)),
                    ),
                    subtitle: Text(
                      DateFormat(
                        "h:mm a",
                      ).format(DateTime.fromMicrosecondsSinceEpoch(info.time)),
                    ),
                  ),
                ),
                Image.asset(
                  "assets/images/it doesn't matter.png",
                  width: double.infinity,
                ),
                Image.asset(
                  "assets/images/it doesn't matter2.png",
                  width: double.infinity,
                ),
                Text(
                  locale.description,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color:
                        provider.isDark() ? AppColors.white : AppColors.black,
                  ),
                ),
                Text(
                  info.description,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color:
                        provider.isDark() ? AppColors.white : AppColors.black,
                  ),
                ),
              ],
            ),
      ),
    );
  }
}
