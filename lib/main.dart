// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_application/app_routes.dart';
import 'package:habit_application/cubit/app_cubit_logics.dart';
import 'package:habit_application/cubit/app_cubits.dart';
import 'package:habit_application/screens/forgot_pass_screen.dart';
import 'package:habit_application/screens/nav_screens/main_screen.dart';
import 'package:habit_application/screens/login_screen.dart';
import 'package:habit_application/screens/signup_screen.dart';
import 'package:habit_application/screens/start_screen.dart';
import 'package:habit_application/themes.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await firebase.initializeApp();
  runApp(HabitApp());
}

class HabitApp extends StatelessWidget {
  var DataServices;

  HabitApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider(
          create: (_) => AppCubits(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'My Habit Tracker',
        theme: Mythemes.lightTheme,
        initialRoute: AppRoutes.welcome,
        routes: <String, WidgetBuilder>{
          AppRoutes.welcome: (_) => const StartScreen(),
          AppRoutes.login: (_) => const LoginScreen(),
          AppRoutes.signup: (_) => SignUpScreen(),
          AppRoutes.forgotpassword: (_) => const ForgotPassScreen(),
          AppRoutes.main: (_) => const MainScreen(),
        },
      ),
    );
  }
}
