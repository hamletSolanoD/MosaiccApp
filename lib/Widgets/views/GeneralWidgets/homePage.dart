import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mosaicc/Widgets/views/JournalWidgets/JournalMain.dart';
import 'package:mosaicc/Widgets/views/Media/MediaMain.dart';
import 'package:mosaicc/Widgets/views/Money/MoneyMain.dart';

class homePage extends StatefulWidget {
  final StreamController<UserCredential> UserCredentials;

  const homePage(this.UserCredentials);

  @override
  _homePageState createState() => _homePageState(UserCredentials);
}

class _homePageState extends State<homePage> {
  StreamController<UserCredential> UserCredentials;
  _homePageState(StreamController<UserCredential> UserCredentials) {
    this.UserCredentials = UserCredentials;
  }
  int _selectedScreenIndex = 0;
  final List _screens = [
    {
      "screen": JournalMain(),
      "title": "Journal",
      "BottomNavItem":
          BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Journal')
    },
    {
      "screen": MoneyMain(),
      "title": "Money",
      "BottomNavItem": BottomNavigationBarItem(
          icon: Icon(Icons.monetization_on), label: 'Money')
    },
    {
      "screen": MediaMain(),
      "title": "Media",
      "BottomNavItem":
          BottomNavigationBarItem(icon: Icon(Icons.image), label: 'Media')
    },
  ];

  /// here is the definition of all the bottom bar screens, only modify here in order to add or remove new pages in the main bottom bar

  PageController _mainPageController = PageController(initialPage: 0);

  void _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_screens[_selectedScreenIndex]["title"]),
      ),
      body: _screens
          .map((e) => e["screen"] as Widget)
          .toList()[_selectedScreenIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // Fixed
        backgroundColor: Colors.white, // <-- This works for fixed
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black45,
        currentIndex: _selectedScreenIndex,
        onTap: _selectScreen,
        items:
            (_screens.map((e) => e["BottomNavItem"] as BottomNavigationBarItem))
                .toList(),
      ),
    );
  }
}
