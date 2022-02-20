import 'package:flutter/material.dart';
import 'package:habit_application/Widgets/button_widget.dart';
import 'package:habit_application/screens/login_screen.dart';
import 'package:habit_application/screens/signup_screen.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:introduction_screen/introduction_screen.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: IntroductionScreen(
        pages: [
          PageViewModel(
            title: "Welcome to My Habit Tracker",
            body:
                "My Habit Tracker is your personal assistant to daily self-care",
            image: buildImage("assets/images/meditating.png"),
            decoration: getPageDecoration(),
          ),
          PageViewModel(
            title: "Form and quit habits",
            body: "Track your mood with an intelligent habit tracker",
            image: buildImage("assets/images/painting.png"),
            decoration: getPageDecoration(),
          ),
          PageViewModel(
            title: "Reflect on your days",
            body: "see what makes you happy or sad",
            image: buildImage("assets/images/cooking.png"),
            decoration: getPageDecoration(),
          ),
          PageViewModel(
            title: "Check your progress",
            body:
                "Get an overview of how you are performing to motivate yourself and achieve more",
            image: buildImage("assets/images/stretching.png"),
            decoration: getPageDecoration(),
            footer: Row(
              children: [
                GestureDetector(
                  onTap: () => Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (_) => SignUpScreen())),
                  child: ButtonWidget(
                    text: "Sign Up",
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (_) => const LoginScreen())),
                  child: ButtonWidget(
                    text: "Login",
                  ),
                ),
              ],
            ),
          ),
        ],
        showSkipButton: true,
        skip: const Text("Skip Intro"),
      ),
    );
  }

  Widget buildImage(String path) => Center(
        child: Image.asset(
          path,
          width: 350,
        ),
      );

  PageDecoration getPageDecoration() => PageDecoration(
        titleTextStyle: const TextStyle(
            fontSize: 28,
            fontFamily: "Libre Baskerville",
            fontWeight: FontWeight.w700),
        bodyTextStyle: const TextStyle(fontSize: 20),
        descriptionPadding: const EdgeInsets.all(16).copyWith(bottom: 0),
        imagePadding: const EdgeInsets.all(24),
        pageColor: Colors.white,
      );
}
