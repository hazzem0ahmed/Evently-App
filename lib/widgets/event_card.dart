import 'package:evently/core/model/event_dm.dart';
import 'package:evently/core/utils/date_extension.dart';
import 'package:evently/firebase/events_database.dart';
import 'package:flutter/material.dart';
import '../firebase/firebase_auth.dart';

class EventCard extends StatelessWidget {
  final EventsDM eventsDM;

  const EventCard({required this.eventsDM, super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 361 / 203,
      child: Container(
        padding: EdgeInsets.all(8),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            width: 3,
            color: Theme.of(context).colorScheme.primary,
          ),
          image: DecorationImage(
            image: AssetImage(eventsDM.category.image),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                eventsDM.date.formattedDate,
                textAlign: TextAlign.center,
              ),
            ),
            Spacer(),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      eventsDM.title,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: favouriteClick,
                    child: Icon(
                      eventsDM.favouriteUser.contains(
                            FirebaseAuthServices.user?.uid,
                          )
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> favouriteClick() async {
    var dataBase = EventDataBase();
    await dataBase.addEventLike(FirebaseAuthServices.user!.uid, eventsDM);
  }
}
