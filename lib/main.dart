import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mosaicc/Widgets/views/GeneralWidgets/SignUp.dart';
import 'package:mosaicc/Widgets/views/GeneralWidgets/signIn.dart';
import 'package:mosaicc/Widgets/views/JournalWidgets/JournalMain.dart';
import 'package:mosaicc/Widgets/views/Media/MediaMain.dart';
import 'package:mosaicc/Widgets/views/Money/MoneyMain.dart';
import 'package:mosaicc/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(newApp());
}

class newApp extends StatelessWidget {
              StreamController<UserCredential> UserCredentials = StreamController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        title: "Mosaicc",
        theme: ThemeData(primarySwatch: Colors.lightBlue),
        home: signIn(UserCredentials));
  }
}
