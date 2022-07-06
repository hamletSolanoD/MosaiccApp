
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
      await manager.signInAnonymously();
    } on Exception catch (e) {
      _showSignInError(context, e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Time Tracker'),
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
          SizedBox(height: 48.0),
          TextButton(
            child: Text("Anonymus"),
            onPressed:  () =>_signInAnonymously(context),
          ),
        ],
      ),
    );
  }




}