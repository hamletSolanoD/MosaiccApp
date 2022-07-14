import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mosaicc/Widgets/controllers/auth.dart';

class signIn extends StatelessWidget {
  const signIn({
    Key key,
    @required this.manager,
    @required this.isLoading,
  }) : super(key: key);
  final Auth manager;
  final bool isLoading;
  static const Key emailPasswordKey = Key('email-password');

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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
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
                  fillColor: Colors.white, filled: true, counterText: '')),
          SizedBox(
            height: 30,
          ),
          Text("Password"),
          TextField(
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
              onPressed: () => {_signInAnonymously(context)},
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
          TextButton(onPressed: () => {}, child: Text("Sign up!"))
        ],
      ),
    );
  }
}
