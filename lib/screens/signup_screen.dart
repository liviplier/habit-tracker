// ignore_for_file: unused_import, must_be_immutable, unused_field, prefer_typing_uninitialized_variables, sized_box_for_whitespace, empty_catches, empty_statements

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_application/cubit/app_cubit_states.dart';
import 'package:habit_application/cubit/app_cubits.dart';
import 'package:habit_application/screens/nav_screens/home_screen.dart';
import 'package:habit_application/screens/login_screen.dart';
import 'package:habit_application/screens/nav_screens/main_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  var _name;
  var _email;
  var _password;
  var _passConfirm;

  SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Image.asset("assets/icons/angle-small-left.png"),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: size.height,
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Name",
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                TextFormField(
                  onSaved: (namevalue) {
                    _name = namevalue;
                  },
                  obscureText: true,
                  decoration:
                      const InputDecoration(labelText: 'Enter your name here'),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Email",
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                TextFormField(
                  onSaved: (emailvalue) {
                    _email = emailvalue;
                  },
                  obscureText: true,
                  decoration:
                      const InputDecoration(labelText: 'Enter your email here'),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Password",
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                TextFormField(
                  onSaved: (passvalue) {
                    _password = passvalue;
                  },
                  obscureText: true,
                  decoration: const InputDecoration(
                      labelText: 'Enter your password here'),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Confirm Password",
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                TextFormField(
                  onSaved: (passConvalue) {
                    _passConfirm = passConvalue;
                  },
                  obscureText: true,
                  decoration: const InputDecoration(
                      labelText: 're-enter your password here'),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const Text("or Sign Up with"),
                    ElevatedButton(
                      onPressed: () {
                        // gmail API
                      },
                      child: const Text(
                        "Gmail",
                      ),
                    ),
                  ],
                ),
                Center(
                  child: ElevatedButton(
                    child: const Text(
                      "Sign Up",
                    ),
                    onPressed: () async {
                      _formKey.currentState!.save();
                      try {
                        final newUser =
                            await _auth.createUserwithEmailAndPassword(
                                email: _email, password: _password);
                        if (newUser != null) {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (_) => const MainScreen()));
                          BlocProvider.of<AppCubits>(context).getData();
                        }
                      } catch (e) {}
                      ;
                      BlocProvider.of<AppCubits>(context).getData();
                    },
                  ),
                ),
                Positioned(
                  child: GestureDetector(
                    child: const Text(
                      "Login",
                    ),
                    onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => const LoginScreen())),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
