// ignore_for_file: prefer_typing_uninitialized_variables, unused_field

import 'package:flutter/material.dart';
import 'package:habit_application/Widgets/app_color.dart';
import 'package:habit_application/screens/popupcards/reminder_screen.dart';
import 'package:habit_application/screens/hero_dialog_route.dart';

class AddCard extends StatefulWidget {
  const AddCard({Key? key}) : super(key: key);

  @override
  _AddCardState createState() => _AddCardState();
}

class _AddCardState extends State<AddCard> {
  final _formKey = GlobalKey<FormState>();
  bool isVisible = false;
  var _habitName;
  List<bool> isSelected = [
    true,
    false,
    false,
  ];
  List<bool> isSelected1 = [
    true,
    false,
    false,
    false,
    false,
    false,
    false,
  ];

  List<bool> isSelected2 = [
    true,
    false,
    false,
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Hero(
          tag: _heroEditHabit,
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
                  Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TextFormField(
                          onSaved: (nameValue) {
                            _habitName = nameValue;
                          },
                          obscureText: true,
                          decoration:
                              const InputDecoration(labelText: 'Habit Name'),
                        ),
                        const Text(
                          "How often do you want to do it?",
                          style: TextStyle(
                            fontSize: 12,
                            color: AppColors.textColor2,
                          ),
                        ),
                        ToggleButtons(
                          fillColor: AppColors.maincolor,
                          selectedColor: Colors.white,
                          color: Colors.black,
                          direction: Axis.horizontal,
                          borderRadius: BorderRadius.circular(50),
                          children: const [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 12),
                              child: Text("Daily",
                                  style: TextStyle(
                                      color: AppColors.textColor1,
                                      fontSize: 18)),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 12),
                              child: Text("Weekly",
                                  style: TextStyle(
                                      color: AppColors.textColor1,
                                      fontSize: 18)),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 12),
                              child: Text("Monthly",
                                  style: TextStyle(
                                      color: AppColors.textColor1,
                                      fontSize: 18)),
                            ),
                          ],
                          isSelected: isSelected,
                          onPressed: (int newIndex) {
                            setState(() {
                              for (int index = 0;
                                  index < isSelected.length;
                                  index++) {
                                if (index == newIndex) {
                                  isSelected[index] = true;
                                } else {
                                  isSelected[index] = false;
                                }
                              }
                              if (isSelected[newIndex] == isSelected[1]) {
                                isVisible = true;
                              } else {
                                isVisible = false;
                              }
                            });
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "How many times per day",
                          style: TextStyle(
                            fontSize: 12,
                            color: AppColors.textColor2,
                          ),
                        ),
                        // COUNTER
                        Visibility(
                          visible: isVisible,
                          replacement: const SizedBox.shrink(),
                          child: Column(
                            children: [
                              const Text(
                                "What days of the week?",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: AppColors.textColor2,
                                ),
                              ),
                              ToggleButtons(
                                  fillColor: AppColors.maincolor,
                                  selectedColor: Colors.white,
                                  color: Colors.black,
                                  direction: Axis.horizontal,
                                  borderRadius: BorderRadius.circular(50),
                                  children: const [
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 12),
                                      child: Text("Mon",
                                          style: TextStyle(
                                              color: AppColors.textColor1,
                                              fontSize: 18)),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 12),
                                      child: Text("Tue",
                                          style: TextStyle(
                                              color: AppColors.textColor1,
                                              fontSize: 18)),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 12),
                                      child: Text("Wed",
                                          style: TextStyle(
                                              color: AppColors.textColor1,
                                              fontSize: 18)),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 12),
                                      child: Text("Thur",
                                          style: TextStyle(
                                              color: AppColors.textColor1,
                                              fontSize: 18)),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 12),
                                      child: Text("Fri",
                                          style: TextStyle(
                                              color: AppColors.textColor1,
                                              fontSize: 18)),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 12),
                                      child: Text("Sat",
                                          style: TextStyle(
                                              color: AppColors.textColor1,
                                              fontSize: 18)),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 12),
                                      child: Text("Sun",
                                          style: TextStyle(
                                              color: AppColors.textColor1,
                                              fontSize: 18)),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                  ],
                                  isSelected: isSelected1,
                                  onPressed: (int newIndex) {
                                    final isOneSelected = isSelected1
                                            .where((element) => element)
                                            .length ==
                                        1;
                                    if (isOneSelected &&
                                        isSelected1[newIndex]) {
                                      return;
                                    }
                                    setState(() {
                                      for (int index = 0;
                                          index > isSelected1.length;
                                          index++) {
                                        if (index == newIndex) {
                                          isSelected1[index] =
                                              !isSelected1[index];
                                        }
                                      }
                                    });
                                  }),
                            ],
                          ),
                        ),
                        const Text(
                          "What time of the day?",
                          style: TextStyle(
                            fontSize: 12,
                            color: AppColors.textColor2,
                          ),
                        ),
                        ToggleButtons(
                            fillColor: AppColors.maincolor,
                            selectedColor: Colors.white,
                            color: Colors.black,
                            direction: Axis.horizontal,
                            borderRadius: BorderRadius.circular(50),
                            children: const [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 12),
                                child: Text("Morning",
                                    style: TextStyle(
                                        color: AppColors.textColor1,
                                        fontSize: 18)),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 12),
                                child: Text("Afternoon",
                                    style: TextStyle(
                                        color: AppColors.textColor1,
                                        fontSize: 18)),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 12),
                                child: Text("Evening",
                                    style: TextStyle(
                                        color: AppColors.textColor1,
                                        fontSize: 18)),
                              ),
                            ],
                            isSelected: isSelected2,
                            onPressed: (int newIndex) {
                              setState(() {
                                for (int index = 0;
                                    index < isSelected.length;
                                    index++) {
                                  if (index == newIndex) {
                                    isSelected[index] = true;
                                  } else {
                                    isSelected[index] = false;
                                  }
                                }
                              });
                            }),
                        const SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: GestureDetector(
                            onTap: () => const ReminderButton(),
                            child: const Text(
                              "Set Reminder",
                              style: TextStyle(
                                  color: AppColors.textColor1, fontSize: 20),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: ElevatedButton(
                            child: const Icon(
                              Icons.add,
                              color: AppColors.textColor1,
                            ),
                            onPressed: () async {
                              _formKey.currentState!.save();
                              try {
                                ScaffoldMessenger.of(context)
                                  ..hideCurrentSnackBar()
                                  ..showSnackBar(const SnackBar(
                                      content:
                                          Text("Habit successfully create!!")));
                                // send to database
                              } catch (e) {
                                ScaffoldMessenger.of(context)
                                  ..hideCurrentSnackBar()
                                  ..showSnackBar(const SnackBar(
                                      content: Text(
                                          "Failed to create habit!try again!")));
                              }
                            },
                          ),
                        ),
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
}

String _heroEditHabit = 'add-hero';

class EditHabitButton extends StatelessWidget {
  const EditHabitButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(HeroDialogRoute(
            builder: (context) {
              return const AddCard();
            },
          ));
        },
        child: Hero(
          tag: _heroEditHabit,
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
