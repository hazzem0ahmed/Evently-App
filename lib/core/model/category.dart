import 'package:flutter/material.dart';

class CategoryDM {
  String nameEN;
  String nameAR;
  int id;
  String image;
  IconData icon;

  CategoryDM(this.nameEN, this.nameAR, this.id, this.image, this.icon);
}

final List<CategoryDM> categoriesList = [
  CategoryDM(
    "Sport",
    "رياضة",
    1,
    "assets/category/Sport.png",
    Icons.sports_soccer,
  ),
  CategoryDM(
    "Birthday",
    "عيد ميلاد",
    2,
    "assets/category/birthday.png",
    Icons.cake,
  ),
  CategoryDM(
    "Meeting",
    "اجتماع",
    3,
    "assets/category/meeting.png",
    Icons.meeting_room,
  ),
  CategoryDM(
    "Gaming",
    "ألعاب",
    4,
    "assets/category/gaming.png",
    Icons.videogame_asset,
  ),
  CategoryDM(
    "Eating",
    "طعام",
    5,
    "assets/category/eating.png",
    Icons.restaurant,
  ),
  CategoryDM(
    "Holiday",
    "عطلة",
    6,
    "assets/category/holiday.png",
    Icons.beach_access,
  ),
  CategoryDM(
    "Exhibition",
    "معرض",
    7,
    "assets/category/exhibition.png",
    Icons.museum,
  ),
  CategoryDM(
    "Workshop",
    "ورشة",
    8,
    "assets/category/workshop.png",
    Icons.handyman,
  ),
  CategoryDM(
    "Book Club",
    "نادي الكتاب",
    9,
    "assets/category/book_club.png",
    Icons.menu_book,
  ),
];
