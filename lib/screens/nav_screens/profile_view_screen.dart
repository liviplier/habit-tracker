import 'package:flutter/material.dart';
import 'package:habit_application/Widgets/app_color.dart';
import 'package:habit_application/screens/profile_edit_screen.dart';
import 'package:habit_application/Widgets/change_theme_button_widget.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfileView extends StatefulWidget {
  ProfileView({Key? key}) : super(key: key);
  final _auth = FirebaseAuth.instance;
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            Stack(
              children: [
                Center(
                  child: CircleAvatar(
                    child: FutureBuilder(
                      future: Provider.of(context).auth.currentUser(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          return Text(
                            "${snapshot.data!.path}",
                            style: const TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          );
                        } else {
                          return const CircularProgressIndicator();
                        }
                      },
                    ),
                    backgroundColor: AppColors.maincolor,
                    radius: 30,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 4,
                  child: IconButton(
                    icon: const Icon(
                      Icons.edit,
                      size: 20,
                      color: AppColors.textColor1,
                    ),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (_) => const ProfileEdit()));
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: FutureBuilder(
                future: Provider.of(context).auth.currentUser(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return Text(
                      "${snapshot.data!.name}",
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  } else {
                    return const CircularProgressIndicator();
                  }
                },
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
              child: FutureBuilder(
                  future: Provider.of(context).auth.currentUser(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return Text(
                        "${snapshot.data!.email}",
                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      );
                    } else {
                      return const CircularProgressIndicator();
                    }
                  }),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "Dark Mode",
                  style: TextStyle(color: AppColors.textColor2),
                ),
                ChangeThemeButtonWidget(),
              ],
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                child: const Text('Logout'),
                onPressed: () {
                  _auth.signOut();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future currentUser() async {
    return await _auth.cureentUser();
  }
}
