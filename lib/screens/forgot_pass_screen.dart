// ignore_for_file: empty_catches, prefer_typing_uninitialized_variables, must_be_immutable, unused_field

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_application/Widgets/app_color.dart';
import 'package:habit_application/cubit/app_cubit_states.dart';
import 'package:habit_application/cubit/app_cubits.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ForgotPassScreen extends StatefulWidget {
  const ForgotPassScreen({Key? key}) : super(key: key);

  @override
  _ForgotPassScreenState createState() => _ForgotPassScreenState();
}

class _ForgotPassScreenState extends State<ForgotPassScreen> {
  // _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  var _email;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Focus.of(context).unfocus(),
      child: Scaffold(
        body: BlocConsumer<AppCubits, CubitStates>(builder: (context, state) {
          if (state is InitialState) {
            return _buildForgotPasswordScreen();
          } else if (state is AuthLForgotPasswordLoading) {
            return loader();
          } else if (state is AuthLForgotPasswordSuccess) {
            return _buildForgotPasswordScreen();
          } else {
            return _buildForgotPasswordScreen();
          }
        }, listener: (context, state) {
          if (state is AuthForgotPasswordError) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(SnackBar(
                content: Text(state.error!),
                backgroundColor: Colors.red,
              ));
          }
          if (state is AuthLForgotPasswordSuccess) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                const SnackBar(
                  content: Text("Reset link has been sent to your email!"),
                  backgroundColor: Colors.green,
                ),
              );
            Navigator.of(context).pop();
          }
        }),
      ),
    );
  }

  Widget _buildForgotPasswordScreen() {
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
            child: Padding(
              padding: const EdgeInsets.all(12.0),
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
                      height: 20,
                    ),
                    SizedBox(
                      width: 220,
                      height: 40,
                      child: ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            final appCubits =
                                BlocProvider.of<AppCubits>(context);
                            await appCubits.ForgotPassword(
                                _formKey.currentState!.fields['email'].value);
                          }
                        },
                        child: const Text(
                          "Send Link",
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                          ),
                        ),
                      ),
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

Widget loader() {
  return const Center(
    child: CircularProgressIndicator(),
  );
}


