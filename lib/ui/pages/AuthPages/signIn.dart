import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mosaicc/data/repositories/firebase_login_repository.dart';
import 'package:mosaicc/ui/pages/JournalWidgets/Widgets/HCalendarSelector.dart';

import '../../widgets/alertDIalog.dart';

class signIn extends StatelessWidget {
  signIn(
    StreamController<UserCredential> UserCredentials, {
    Key key,
    @required this.isLoading,
  }) : super(key: key) {
    this.UserCredentials = UserCredentials;
  }
  StreamController<UserCredential> UserCredentials;
  final bool isLoading;
  TextEditingController EmailController = TextEditingController();
  TextEditingController PasswordController = TextEditingController();

  Future<void> _signInAnonymously(BuildContext context) async {
    FirebaseLoginRepository firebaseLoginRepository = FirebaseLoginRepository();
    Future<UserCredential> userFeature =
        (firebaseLoginRepository.signInWithEmail(
            username: EmailController.text, password: PasswordController.text));

    userFeature.then(
      (user) {
        if (user != null) {
          UserCredentials.add(user);
          Navigator.of(context)
              .pushNamed("/homePage", arguments: UserCredentials);
        } else {
          alertDialog().showAlertDialog(context, "Authentication failed");
        }
      },
    );
  }

  Future<void> _signInWithEmail(BuildContext context) async {
    FirebaseLoginRepository firebaseLoginRepository = FirebaseLoginRepository();
    Future<UserCredential> userFeature =
        (firebaseLoginRepository.signInWithEmail(
            username: EmailController.text, password: PasswordController.text));

    userFeature.then(
      (user) {
        if (user != null) {
          UserCredentials.add(user);
          Navigator.of(context)
              .pushNamed("/homePage", arguments: UserCredentials);
        } else {
          alertDialog().showAlertDialog(context, "Authentication failed");
        }
      },
    );
  }

  void _registerNewUser(BuildContext context) {
    Navigator.of(context).pushNamed("/signUp", arguments: UserCredentials);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mosaicc'),
        elevation: 2.0,
      ),
      body: _buildContent(context),
      backgroundColor: Colors.grey[200],
    );
  }

  Widget _buildContent(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(
              height: 140,
            ),
            Text(
              "Welcome Back",
              style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
            ),
            Text(
              "ready for a new day?",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.black45),
            ),
            SizedBox(
              height: 48,
            ),
            Text("Email"),
            TextField(
              decoration: InputDecoration(
                  fillColor: Colors.white, filled: true, counterText: ''),
              controller: EmailController,
            ),
            SizedBox(
              height: 30,
            ),
            Text("Password"),
            TextField(
                obscureText: true,
                controller: PasswordController,
                decoration: InputDecoration(
                    fillColor: Colors.white, filled: true, counterText: '')),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                  onPressed: () => {}, child: Text("Forgot password?")),
            ),
            SizedBox(
              height: 30,
            ),
            TextButton(
                onPressed: () => {_signInWithEmail(context)},
                child: const Text("Login",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.blue),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            side: BorderSide(color: Colors.blue))))),
            SizedBox(
              height: 48,
            ),
            Center(child: Text("Don't have an account?") 
            
            ),
            TextButton(
                onPressed: () => _registerNewUser(context),
                child: Text("Sign up!"))
          ],
        ),
      ),
    );
  }
}
