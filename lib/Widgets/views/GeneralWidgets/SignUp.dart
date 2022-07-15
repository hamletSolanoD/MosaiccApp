import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  _signInState createState() => _signInState();
}

class _signInState extends State<SignUp> {
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
    // TODO: implement build
    return Container(
        child: SingleChildScrollView(
            child: Padding(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    SizedBox(
                      height: 140,
                    ),
                    Text(
                      "Sign Up",
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 30),
                    ),
                    Text(
                      "please fill all the data",
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
                          fillColor: Colors.white,
                          filled: true,
                          counterText: ''),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text("Password"),
                    TextField(
                        decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            counterText: '')),
                    SizedBox(
                      height: 30,
                    ),
                    Text("Confirm password"),
                    TextField(
                        decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            counterText: '')),
                    SizedBox(
                      height: 30,
                    ),
                    TextButton(
                        onPressed: () => {},
                        child: const Text("Get started!",
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.blue),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    side: BorderSide(color: Colors.blue))))),
                    SizedBox(
                      height: 30,
                    ),
                    Center(child: Text("Already part of the community?")),
                    TextButton(onPressed: () => {}, child: Text("Login!"))
                  ],
                ),
                padding: EdgeInsets.fromLTRB(40, 0, 40, 0))));
  }
}
