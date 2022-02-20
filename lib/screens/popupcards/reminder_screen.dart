// ignore_for_file: unused_element, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:habit_application/Widgets/app_color.dart';
import '../hero_dialog_route.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ReminderScreen extends StatefulWidget {
  const ReminderScreen({Key? key}) : super(key: key);

  @override
  _ReminderScreenState createState() => _ReminderScreenState();
}

TimeOfDay _timeOfDay = const TimeOfDay(hour: 12, minute: 00);

class _ReminderScreenState extends State<ReminderScreen> {
  _showTimePicker() {
    showTimePicker(context: context, initialTime: TimeOfDay.now())
        .then((value) {
      setState(() {
        _timeOfDay = value!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Hero(
        tag: _heroReminderCard,
        child: _showTimePicker(),
      ),
    );
  }
}

String _heroReminderCard = 'add-hero';

class ReminderButton extends StatelessWidget {
  const ReminderButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(HeroDialogRoute(
            builder: (context) {
              return const ReminderScreen();
            },
          ));
        },
        child: Hero(
          tag: _heroReminderCard,
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
