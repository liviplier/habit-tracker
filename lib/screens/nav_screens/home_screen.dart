// ignore_for_file: unused_import, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_application/Widgets/edit_habit_button.dart';
import 'package:habit_application/Widgets/app_color.dart';
import 'package:habit_application/cubit/app_cubit_states.dart';
import 'package:habit_application/cubit/app_cubits.dart';
import 'package:habit_application/screens/popupcards/view_habit_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var info;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(
              top: 70,
              left: 20,
            ),
            child: Row(
              children: [
                const Text(
                  "Home",
                  style: TextStyle(fontSize: 16, color: AppColors.textColor1),
                ),
                Expanded(child: Container()),
                Container(
                  margin: const EdgeInsets.only(right: 20),
                  width: 50,
                  height: 50,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  child: Image.asset("assets/icons/home.png"),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Container(
            margin: const EdgeInsets.only(left: 20),
            child: const Text(
              "Habits",
              style: TextStyle(fontSize: 30, color: AppColors.textColor1),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            width: 200,
            height: double.maxFinite,
            margin: const EdgeInsets.only(left: 20, right: 20),
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: info.length,
                itemBuilder: (_, index) {
                  return Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          BlocProvider.of<AppCubits>(context)
                              .detailScreen(info[index]);
                        },
                        child: Container(
                          width: 200,
                          height: 300,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                          ),
                          child: Center(
                            child: BlocBuilder<AppCubits, CubitStates>(
                              builder: (context, state) {
                                if (state is LoadedState) {
                                  var info = state.habits;
                                  return Text(
                                    info[index].habitname,
                                    style: const TextStyle(
                                        fontSize: 20,
                                        color: AppColors.textColor2),
                                  );
                                } else {
                                  return Container();
                                }
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                }),
          ),
          Container(
            margin: const EdgeInsets.only(right: 20),
            child: Positioned(
              right: 20,
              bottom: 70,
              child: FloatingActionButton(
                onPressed: () {
                  const EditHabitButton();
                },
                elevation: 3,
                tooltip: "Create Habit",
                backgroundColor: AppColors.maincolor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
