import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_application/cubit/app_cubit_states.dart';
import 'package:habit_application/cubit/app_cubits.dart';
import 'package:habit_application/screens/nav_screens/home_screen.dart';
import 'package:habit_application/screens/popupcards/view_habit_screen.dart';
import 'package:habit_application/screens/start_screen.dart';

class AppCubitLogics extends StatefulWidget {
  const AppCubitLogics({Key? key}) : super(key: key);

  @override
  _AppCubitLogicsState createState() => _AppCubitLogicsState();
}

class _AppCubitLogicsState extends State<AppCubitLogics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppCubits, CubitStates>(
        builder: (context, state) {
          if (state is WelcomeState) {
            return const StartScreen();
          }
          if (state is DetailState) {
            return const ViewButton();
          }
          if (state is LoadedState) {
            return const HomeScreen();
          }
          if (state is HomeLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
