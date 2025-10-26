import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently/core/model/category.dart';

class EventsDM {
  String title;
  String id;
  String description;
  int date;
  int time;
  CategoryDM category;
  List<String> favouriteUser;


  static List<EventsDM> eventsList = [];

  EventsDM({
    required this.title,
    required this.id,
    required this.description,
    required this.date,
    required this.time,
    required this.category,
    this.favouriteUser = const [],
  });

  factory EventsDM.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data() ?? <String, dynamic>{};
    return EventsDM(
      title: data["title"],
      id: data['id'],
      description: data['description'],
      date: data['date'],
      time: data['time'],
      favouriteUser:
          ((data["favouriteUsers"]??[]) as List<dynamic>)
              .map((e) => e.toString())
              .toList(),
      category: categoriesList.firstWhere((e) => e.id == data['categoryId']),

    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      "title": title,
      "id": id,
      "description": description,
      "date": date,
      "time": time,
      "categoryId": category.id,
      "favouriteUsers": favouriteUser,

    };
  }
}
