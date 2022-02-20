// ignore_for_file: prefer_const_literals_to_create_immutables, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_search_bar/flutter_search_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  // SearchBar searchBar;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          // searchBar.getSearchAction(context)
        ],
      ),
    );
  }

  void onSubmitted(String value) {
    setState(
      () {
        _scaffoldKey.currentState
            ?.showSnackBar(SnackBar(content: Text("$value!")));
      },
    );
//     _SearchBarState(){
//       searchBar = new SearchBar(
//         inBar: false,
//         buildDefaultAppBar: buildAppBar,
//         setState: setState,
//         onSubmitted: onSubmitted,
//         onCleared: () {
//           print("Cleared"),
//         }
//       );

//     }
//     @override
//     Widget build(BuildContext context),
//     key: _scaffoldKey,
//     body: Center(
//       child: Text("Search"),
//     );
  }
}
