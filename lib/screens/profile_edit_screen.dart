// ignore_for_file: unused_field, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:habit_application/Widgets/app_color.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfileEdit extends StatefulWidget {
  const ProfileEdit({Key? key}) : super(key: key);

  @override
  _ProfileEditState createState() => _ProfileEditState();
}

class _ProfileEditState extends State<ProfileEdit> {
  final _formKey = GlobalKey<FormState>();

  var _pass;
  var _email;
  var _name;
  // final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Image.asset("assets/icons/angle-small-left.png"),
          )),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Stack(
            children: [
              const Center(
                child: CircleAvatar(
                  backgroundImage: NetworkImage(""),
                  radius: 30,
                ),
              ),
              Positioned(
                bottom: 0,
                right: 4,
                child: IconButton(
                  icon: const Icon(
                    Icons.camera_alt_rounded,
                    color: Colors.white,
                    size: 20,
                  ),
                  tooltip: 'Open Gallery',
                  onPressed: () {},
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Form(
            key: _formKey,
            child: Column(
              children: [
                const Text(
                  'Name',
                  style: TextStyle(
                    fontSize: 25,
                    color: AppColors.textColor2,
                  ),
                ),
                Container(
                  width: 350,
                  height: 40,
                  decoration: BoxDecoration(
                    border: Border.all(width: 2),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: TextFormField(
                    onSaved: (nameValue) {
                      _name = nameValue;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  'Email',
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.grey,
                  ),
                ),
                Container(
                  width: 350,
                  height: 40,
                  decoration: BoxDecoration(
                    border: Border.all(width: 2),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: TextFormField(
                    onSaved: (emailValue) {
                      _email = emailValue;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  'Password',
                  style: TextStyle(
                    fontSize: 25,
                    color: AppColors.textColor2,
                  ),
                ),
                Container(
                  width: 350,
                  height: 40,
                  decoration: BoxDecoration(
                    border: Border.all(width: 2),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: TextFormField(
                    onSaved: (passValue) {
                      _pass = passValue;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        child: const Text("Delete Account"),
                        onPressed: () {
                          // auth.delete
                          ScaffoldMessenger.of(context)
                            ..hideCurrentSnackBar()
                            ..showSnackBar(const SnackBar(
                              content: Text("Are you sure?"),
                            ));
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        child: const Text("Apply Changes"),
                        onPressed: () {
                          _formKey.currentState!.save();
                          // auth.update thing
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
