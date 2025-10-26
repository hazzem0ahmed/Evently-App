import 'package:evently/firebase/events_database.dart';
import 'package:evently/firebase/firebase_auth.dart';
import 'package:evently/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';

import '../../../widgets/event_card.dart';
import '../../card_details.dart';

class FavouriteTab extends StatefulWidget {
  const FavouriteTab({super.key});

  @override
  State<FavouriteTab> createState() => _FavouriteTabState();
}

class _FavouriteTabState extends State<FavouriteTab> {
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var locale  = AppLocalizations.of(context)!;
    return SafeArea(
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            TextFormField(
              controller: searchController,
              onChanged: (value) {
                setState(() {});
              },
              decoration:  InputDecoration(
                hintText: locale.searchUsingTitle,
                prefixIcon: Icon(Icons.search),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: StreamBuilder(
                stream: EventDataBase()
                    .getFavouriteTabStream(FirebaseAuthServices.user?.uid ?? ""),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text("Error: ${snapshot.error.toString()}"),
                    );
                  }

                  final allEvents =
                      snapshot.data?.docs.map((e) => e.data()).toList() ?? [];

                  final filteredEvents = allEvents
                      .where((event) => event.title
                          .toLowerCase()
                          .contains(searchController.text.toLowerCase()))
                      .toList();

                  if (filteredEvents.isEmpty) {
                    return  Center(
                      child: Text(locale.noFavourite),
                    );
                  }

                  return ListView.separated(
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 16),
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    itemCount: filteredEvents.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            CardDetailsScreen.routeName,
                            arguments: filteredEvents[index],
                          );
                        },
                        child: EventCard(eventsDM: filteredEvents[index]),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
