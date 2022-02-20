// ignore_for_file: sized_box_for_whitespace, unused_local_variable, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:habit_application/Widgets/app_color.dart';
import 'package:habit_application/screens/hero_dialog_route.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ViewHabit extends StatefulWidget {
  const ViewHabit({Key? key}) : super(key: key);

  @override
  _ViewHabitState createState() => _ViewHabitState();
}

class _ViewHabitState extends State<ViewHabit> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Hero(
          tag: _heroViewHabit,
          child: Material(
            color: AppColors.maincolor,
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(32.0),
            ),
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Positioned(
                    right: 5,
                    top: 5,
                    child: GestureDetector(
                      onTap: () {
                        
                      }
                      child: const Text(
                        "Edit",
                        style: TextStyle(
                            color: AppColors.textColor2, fontSize: 10),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 20),
                    width: double.maxFinite,
                    height: 20,
                    child: const Text("habit name"), // from database
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 20),
                    width: double.maxFinite,
                    height: 200,
                    child: Column(
                      children: [
                        const Text(
                          "Habit History",
                          style: TextStyle(
                              fontSize: 30, color: AppColors.textColor1),
                        ),
                        CalendarDatePicker(
                            initialDate: DateTime.now(),
                            firstDate: DateTime.utc(1999, 9, 21),
                            lastDate: DateTime.utc(3000, 12, 31),
                            onDateChanged: onDateChanged),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: double.maxFinite,
                    height: 20,
                    child: Column(
                      children: [
                        const Text("Feeling Chart"),
                        Slider(min: 1, max: 5, value: 0, onChanged: onChanged),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: double.maxFinite,
                    height: 20,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("data"),
                        Radio(value: 0, groupValue: 1, onChanged: onCompleted)
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void onDateChanged(DateTime value) {
    DateTime newValue;
    newValue = value;
  }

  void onChanged(double value) {
    double FeelingValue;
    FeelingValue = value;
  }

  void onCompleted(int? value) {
    int? Completed;
    value = Completed;
  }
}

String _heroViewHabit = 'view-hero';

class ViewButton extends StatelessWidget {
  const ViewButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(HeroDialogRoute(
            builder: (context) {
              return const ViewHabit();
            },
          ));
        },
        child: Hero(
          tag: _heroViewHabit,
          child: Material(
            color: AppColors.maincolor,
            elevation: 2,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
            child: const Icon(
              Icons.add,
              color: Colors.black,
              size: 56,
            ),
          ),
        ),
      ),
    );
  }
}
