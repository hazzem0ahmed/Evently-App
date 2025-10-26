import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently/core/model/category.dart';
import 'package:evently/core/model/event_dm.dart';
import 'package:evently/core/utils/date_extension.dart';


class EventDataBase {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  CollectionReference<EventsDM> getCollectionReferences() {
    return firestore
        .collection("events")
        .withConverter(
          fromFirestore: EventsDM.fromFirestore,
          toFirestore: (EventsDM event, options) => event.toFirestore(),
        );
  }

  Future<void> createEvent(EventsDM event) async {
    var collectionReferences = getCollectionReferences();
    var doc = collectionReferences.doc();
    event.id = doc.id;
    await doc.set(event);
  }

  Future<List<EventsDM>> createEventsList(CategoryDM category) async {
    var collectionReferences = getCollectionReferences();
    var date = DateTime.now().dateOnly.microsecondsSinceEpoch;

    QuerySnapshot<EventsDM> data;
    if (category.id == -1) {
      data =
          await collectionReferences
              .where("date", isGreaterThanOrEqualTo: date)
              .get();
    } else {
      data =
          await collectionReferences
              .where("date", isGreaterThanOrEqualTo: date)
              .where("categoryId", isEqualTo: category.id)
              .get();
    }

    var events = data.docs.map((doc) => doc.data()).toList();
    return events;
  }

  Stream<QuerySnapshot<EventsDM>> createEventsListStream(CategoryDM category) {
    var collectionReferences = getCollectionReferences();
    var date = DateTime.now().dateOnly.microsecondsSinceEpoch;

    Stream<QuerySnapshot<EventsDM>> data;
    if (category.id == -1) {
      data =
          collectionReferences
              .where("date", isGreaterThanOrEqualTo: date)
              .snapshots();
    } else {
      data =
          collectionReferences
              .where("date", isGreaterThanOrEqualTo: date)
              .where("categoryId", isEqualTo: category.id)
              .snapshots();
    }
    return data;
  }

  Future<void> addEventLike(String uid, EventsDM event) async {
    if (event.favouriteUser.contains(uid)) {
      event.favouriteUser.remove(uid);
    } else {
      event.favouriteUser.add(uid);
    }
    var collectionReferences = getCollectionReferences();
    var doc = collectionReferences.doc(event.id);
    await doc.update(event.toFirestore());
  }

  Stream<QuerySnapshot<EventsDM>> getFavouriteTabStream(String uid) {
    var collectionReferences = getCollectionReferences();

    Stream<QuerySnapshot<EventsDM>> data =
        collectionReferences
            .where("favouriteUsers", arrayContains: uid)
            .snapshots();

    return data;
  }

 Future<void> deleteEvent(String eventID) async{
    var collectionReferences = getCollectionReferences();
    await collectionReferences.doc(eventID).delete();
  }

  Future<void> updateEvent(EventsDM event)async{
    await FirebaseFirestore.instance.collection("events").doc(event.id).update(event.toFirestore());

  }
}
