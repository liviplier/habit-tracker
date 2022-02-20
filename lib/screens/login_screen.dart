// ignore_for_file: prefer_typing_uninitialized_variables, unused_field

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_application/Widgets/app_color.dart';
import 'package:habit_application/cubit/app_cubit_states.dart';
import 'package:habit_application/cubit/app_cubits.dart';
import 'package:habit_application/screens/forgot_pass_screen.dart';
import 'package:habit_application/screens/nav_screens/main_screen.dart';
import 'package:habit_application/screens/signup_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
// _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  var _email;
  var _password;
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AppCubits, CubitStates>(
          builder: (context, state) => _buildLoginScreen(),
          listener: (context, state) {
            // if login failed displays error message
            if (state is AuthLoginError) {
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(SnackBar(
                  content: Text(state.errorMessage!),
                ));
              // if login success route to main screen
              if (state is AuthLoginSuccess) {
                _formKey.currentState!.reset();
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const MainScreen()));
              }
            }
          }),
    );
  }

  Widget _buildLoginScreen() {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: Image.asset("assets/icons/angle-small-left.png"),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: Container(
          height: size.height,
          width: double.infinity,
          color: Colors.white,
          child: Center(
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Image.asset(
                        "images/logo.jpg",
                        width: 200,
                        height: 200,
                      ),
                    ),
                    const SizedBox(height: 30),
                    const Text(
                      "Email",
                      style:
                          TextStyle(color: AppColors.textColor2, fontSize: 30),
                    ),
                    TextFormField(
                      onSaved: (emailValue) {
                        _email = emailValue;
                      },
                      decoration: InputDecoration(
                        focusedBorder: kOutlineBorder,
                        enabledBorder: kOutlineBorder,
                        errorBorder: kErrorBorder,
                        focusedErrorBorder: kErrorBorder,
                        contentPadding: const EdgeInsets.all(8),
                        prefixIcon: const Icon(
                          Icons.email,
                        ),
                        prefixIconColor: AppColors.textColor2,
                        hintText: "Enter email",
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Password",
                      style:
                          TextStyle(color: AppColors.textColor2, fontSize: 30),
                    ),
                    TextFormField(
                      onSaved: (passwordValue) {
                        _password = passwordValue;
                      },
                      decoration: InputDecoration(
                        enabledBorder: kOutlineBorder,
                        focusedBorder: kOutlineBorder,
                        errorBorder: kErrorBorder,
                        focusedErrorBorder: kErrorBorder,
                        contentPadding: const EdgeInsets.all(8),
                        prefixIcon: const Icon(
                          Icons.lock,
                        ),
                        prefixIconColor: AppColors.textColor2,
                        hintText: 'Enter Password',
                        suffixIcon: InkWell(
                          onTap: () {
                            setState(() {
                              isObscure = isObscure;
                            });
                          },
                          child: Icon(isObscure
                              ? Icons.radio_button_off
                              : Icons.radio_button_checked),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Login",
                          style: TextStyle(
                            color: AppColors.textColor1,
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(
                          width: 220,
                          height: 40,
                          child: ElevatedButton(
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                final appCubits =
                                    BlocProvider.of<AppCubits>(context);
                                await appCubits.Login(
                                    _formKey
                                        .currentState!.fields['email'].value,
                                    _formKey.currentState!.fields['password']
                                        .value);
                              }
                            },
                            child: BlocConsumer(
                              builder: (context, state) {
                                if (state is AuthLoginLoading) {
                                  return kLoaderBtn;
                                } else {
                                  return Image.asset(
                                      "assets/icons/sign-in-alt.png");
                                }
                              },
                              listener: (context, state) {},
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                            onPressed: () => Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (_) => SignUpScreen())),
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                "Sign Up",
                              ),
                            )),
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (_) => const ForgotPassScreen()));
                            },
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                "Forgot Password",
                              ),
                            )),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

var kOutlineBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(8),
  borderSide: const BorderSide(color: Colors.transparent),
);

var kErrorBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(8),
  borderSide: const BorderSide(color: Colors.red),
);

const kLoaderBtn = SizedBox(
  height: 20,
  width: 20,
  child: CircularProgressIndicator(
    strokeWidth: 1.5,
    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
  ),
);
