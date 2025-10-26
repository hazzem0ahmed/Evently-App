import 'package:evently/core/model/category.dart';
import 'package:evently/core/model/event_dm.dart';
import 'package:evently/core/utils/app_dialogs.dart';
import 'package:evently/core/utils/validation.dart';
import 'package:evently/firebase/events_database.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../core/app_colors.dart';
import '../../l10n/generated/app_localizations.dart';
import '../../provider/home_provider.dart';

class EventManagement extends StatefulWidget {
  static const String routeName = "/EventManagement";

  const EventManagement({super.key});

  @override
  State<EventManagement> createState() => _EventManagementState();
}

class _EventManagementState extends State<EventManagement> {
  CategoryDM selectedCategory = categoriesList.first;

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<HomeProvider>(context);
    var textColorSelection =
        provider.isDark() ? AppColors.lightBlue : AppColors.black;
    var primaryColor = Theme.of(context).colorScheme.primary;
    var surfaceColor = Theme.of(context).colorScheme.surface;
    var locale = AppLocalizations.of(context)!;
    var size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          locale.createEvent,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: 1,
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          itemBuilder:
              (context, index) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AspectRatio(
                    aspectRatio: 360 / 203,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.asset(selectedCategory.image),
                    ),
                  ),
                  SizedBox(height: size.height * 0.03),
                  DefaultTabController(
                    length: categoriesList.length,
                    child: TabBar(
                      onTap: (index) {
                        setState(() {
                          selectedCategory = categoriesList[index];
                        });
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
                                            ? primaryColor
                                            : Colors.transparent,
                                    borderRadius: BorderRadius.circular(1000),
                                    border: Border.all(
                                      width: 1,
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                    ),
                                  ),
                                  child: Row(
                                    spacing: 8,
                                    children: [
                                      Icon(
                                        category.icon,
                                        color:
                                            category.id == selectedCategory.id
                                                ? surfaceColor
                                                : primaryColor,
                                      ),
                                      Text(
                                        provider.isEn()
                                            ? category.nameEN
                                            : category.nameAR,
                                        style: TextStyle(
                                          color:
                                              category.id == selectedCategory.id
                                                  ? surfaceColor
                                                  : primaryColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                              .toList(),
                    ),
                  ),
                  SizedBox(height: size.height * 0.01),
                  Text(
                    locale.title,
                    style: Theme.of(
                      context,
                    ).textTheme.bodyLarge!.copyWith(color: textColorSelection),
                  ),
                  SizedBox(height: size.height * 0.02),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (input) {
                      return ValidationCheck.emptyTitleValidation(
                        input,
                        context,
                      );
                    },
                    controller: titleController,
                    decoration: InputDecoration(hintText: locale.eventTitle),
                  ),
                  SizedBox(height: size.height * 0.02),
                  Text(
                    locale.description,
                    style: Theme.of(
                      context,
                    ).textTheme.bodyLarge!.copyWith(color: textColorSelection),
                  ),
                  SizedBox(height: size.height * 0.02),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (input) {
                      return ValidationCheck.emptyDescriptionValidation(
                        input,
                        context,
                      );
                    },
                    controller: descriptionController,
                    maxLines: 5,
                    decoration: InputDecoration(hintText: locale.description),
                  ),
                  SizedBox(height: size.height * 0.03),
                  Row(
                    spacing: 10,
                    children: [
                      Icon(Icons.calendar_month, color: textColorSelection),
                      Expanded(
                        child: Text(
                          locale.eventDate,
                          style: Theme.of(context).textTheme.titleSmall!
                              .copyWith(color: textColorSelection),
                        ),
                      ),

                      GestureDetector(
                        onTap: () {
                          getEventDate();
                        },
                        child: Text(
                          selectedDate == null
                              ? locale.chooseDate
                              : DateFormat("dd/MM/yyyy").format(selectedDate!),
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: size.height * 0.01),
                  Row(
                    spacing: 10,
                    children: [
                      Icon(
                        Icons.access_time_rounded,
                        color: textColorSelection,
                      ),
                      Expanded(
                        child: Text(
                          locale.eventTime,
                          style: Theme.of(context).textTheme.titleSmall!
                              .copyWith(color: textColorSelection),
                        ),
                      ),

                      GestureDetector(
                        onTap: () {
                          getEventTime();
                        },
                        child: Text(
                          selectedTime == null
                              ? locale.chooseTime
                              : DateFormat().add_jm().format(
                                DateTime(
                                  0,
                                  0,
                                  0,
                                  selectedTime!.hour,
                                  selectedTime!.minute,
                                ),
                              ),
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: size.height * 0.02),
                  FilledButton(
                    onPressed: () async {
                      String errorMessage = "";
                      if (titleController.text.isEmpty) {
                        errorMessage += "\n- ${locale.setEventTitle}";
                      }  if (descriptionController.text.isEmpty) {
                        errorMessage += "\n- ${locale.setEventDescirption}";
                      }  if (selectedDate == null) {
                        errorMessage += "\n- ${locale.setEventDate}";
                      }  if (selectedTime == null) {
                        errorMessage += "\n- ${locale.setEventTime}";
                      }
                      if (errorMessage.isNotEmpty) {
                        AppDialogs.showActionDialog(
                          context,
                          title: locale.invalidEventData,
                          content: errorMessage,
                          posActionTitle: locale.tryAgain,
                        );
                        return;
                      }
                      AppDialogs.showLoadingDialog(
                        context,
                        loadingMessage: locale.creatingEvent,
                        isDismissable: false,
                      );
                      try {
                        EventDataBase eventDataBase = EventDataBase();
                        await eventDataBase.createEvent(
                          EventsDM(
                            title: titleController.text,
                            id: "",
                            description: descriptionController.text,
                            date: selectedDate!.microsecondsSinceEpoch,
                            time:
                                DateTime(
                                  0,
                                  0,
                                  0,
                                  selectedTime!.hour,
                                  selectedTime!.minute,
                                ).microsecondsSinceEpoch,
                            category: selectedCategory,
                          ),
                        );
                        Navigator.pop(context);
                        AppDialogs.showActionDialog(
                          context,
                          title: locale.successOperation,
                          content: locale.eventCreatedSuccessfully,
                          posActionTitle: locale.ok,
                          posActionClick: () {
                            Navigator.pop(context);
                          },
                        );
                      } catch (e) {
                        Navigator.pop(context);
                        AppDialogs.showActionDialog(
                          context,
                          title: locale.failedOperation,
                          content: e.toString(),
                          posActionTitle: locale.tryAgain,
                        );
                      }
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Text(locale.addEvent)],
                    ),
                  ),
                ],
              ),
        ),
      ),
    );
  }

  Future<void> getEventDate() async {
    var date = await showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      initialDate: selectedDate ?? DateTime.now(),
      lastDate: DateTime.now().add((Duration(days: 365))),
    );
    if (date != null) {
      setState(() {
        selectedDate = date;
      });
    }
  }

  Future<void> getEventTime() async {
    var time = await showTimePicker(
      context: context,
      initialTime: selectedTime ?? TimeOfDay.now(),
    );
    if (time != null) {
      setState(() {
        selectedTime = time;
      });
    }
  }
}
