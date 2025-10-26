import 'package:evently/firebase/events_database.dart';
import 'package:evently/screens/card_details.dart';
import 'package:evently/widgets/home_header.dart';
import 'package:flutter/material.dart';
import '../../../core/model/category.dart';
import '../../../widgets/event_card.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {

  List<CategoryDM> categories = [];
  late CategoryDM selectedCategory;

  @override
  void initState() {
    super.initState();
    categories.add(CategoryDM("All", "الكل", -1, "", Icons.explore));
    categories.addAll(categoriesList);
    selectedCategory = categories.first;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HomeHeader(
          categoriesList: categories,
          selectedCategory: selectedCategory,
          onCategorySelected: onCategorySelected,
        ),
        // FutureBuilder(
        //   future: EventDataBase().createEventsList(selectedCategory),
        //   builder: (context, snapshot) {
        //     if (snapshot.connectionState == ConnectionState.waiting) {
        //       return const Center(child: CircularProgressIndicator());
        //     } else if (snapshot.hasError) {
        //       return Center(
        //         child: Text("Error Loading Event ${snapshot.error.toString()}"),
        //       );
        //     } else if (snapshot.hasData) {
        //       var events = snapshot.data ?? [];
        //       return Expanded(
        //         child: ListView.separated(
        //           separatorBuilder:
        //               (context, index) => SizedBox(
        //                 height: MediaQuery.sizeOf(context).height * 0.02,
        //               ),
        //           padding: EdgeInsets.all(16),
        //           itemCount: events.length,
        //           itemBuilder:
        //               (context, index) => EventCard(eventsDM: events[index]),
        //         ),
        //       );
        //     } else {
        //       return SizedBox();
        //     }
        //   },
        // ),
        StreamBuilder(
          stream: EventDataBase().createEventsListStream(selectedCategory),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(
                child: Text("Error Loading Event ${snapshot.error.toString()}"),
              );
            } else if (snapshot.hasData) {
              var events =
                  snapshot.data?.docs.map((e) => e.data()).toList() ?? [];
              return Expanded(
                child: ListView.separated(
                  separatorBuilder:
                      (context, index) => SizedBox(
                        height: MediaQuery.sizeOf(context).height * 0.02,
                      ),
                  padding: EdgeInsets.all(16),
                  itemCount: events.length,
                  itemBuilder:
                      (context, index) => GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            CardDetailsScreen.routeName,
                            arguments: events[index],
                          );
                        },
                        child: EventCard(eventsDM: events[index]),
                      ),
                ),
              );
            } else {
              return SizedBox();
            }
          },
        ),
      ],
    );
  }

  onCategorySelected(category) {
    setState(() {
      selectedCategory = category;
    });
  }
}
