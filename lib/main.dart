import 'package:flutter/material.dart';
import 'package:mosaicc/Widgets/JournalWidgets/TextAreaEntry.dart';


void main() {
  runApp(newApp());
}

class newApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "Mosaicc",
      theme: ThemeData(
        primarySwatch: Colors.lightBlue
      ),
      home:  Scaffold(
        appBar: AppBar(
        title: const Text("Main"),        
        ),
        body: TextAreaEntry()
      )
    );
  }
}
