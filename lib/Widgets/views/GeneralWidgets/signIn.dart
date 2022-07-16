import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mosaicc/Widgets/controllers/auth.dart';
import 'package:mosaicc/Widgets/views/GeneralWidgets/SignUp.dart';
import 'package:mosaicc/Widgets/views/GeneralWidgets/homePage.dart';

class signIn extends StatelessWidget {
   signIn(
    StreamController<UserCredential>  UserCredentials,
    {
    Key key,
    @required this.manager,
    @required this.isLoading,
  }) : super(key: key){
    this.UserCredentials = UserCredentials;
  }
   StreamController<UserCredential>  UserCredentials;
  final Auth manager;
  final bool isLoading;
  TextEditingController EmailController = TextEditingController();
  TextEditingController PasswordController = TextEditingController();




  void _showSignInError(BuildContext context, Exception exception) {
    if (exception is FirebaseException &&
        exception.code == 'ERROR_ABORTED_BY_USER') {
      return;
    }
  }

  Future<void> _signInAnonymously(BuildContext context) async {
    try {
      final credentials = await FirebaseAuth.instance.signInAnonymously();
      print('${credentials.user.uid}');
    } on Exception catch (e) {
      _showSignInError(context, e);
    }
  }

  Future<void> _signInWithEmail(BuildContext context) async {

 try {
       final credentials = await FirebaseAuth.instance.signInWithEmailAndPassword(email: EmailController.text, password:PasswordController.text);

            UserCredentials.add(credentials);
            Navigator.push(
    context,
    MaterialPageRoute(builder: (context) =>  homePage(UserCredentials)),
  );

            

            print('${credentials.toString()}');

    } on Exception catch (e) {
      _showSignInError(context, e);
    }

    
  }

 void _registerNewUser (BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) =>  SignUp()),
  );
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
          SizedBox(height: 140,),
          Text(
            "Welcome Back",
            style: TextStyle(
                color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 30),
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
                  controller:EmailController ,
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
          Center(child: Text("Don't have an account?")),
          TextButton(onPressed: () => _registerNewUser(context), child: Text("Sign up!"))
        ],
      ),),
    );
  }
}
