import 'package:flutter/material.dart';
import 'package:mosaicc/ui/pages/JournalWidgets/Widgets/HCalendarSelector.dart';

class JournalMain extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return JournalMainState();
  }
}

class JournalMainState extends State<JournalMain> {
  Widget _buildBody() {
    return Stack(children: [
      Positioned(top: 0.0, left: 0.0, right: 0.0, child: _buildAppBar()),
      Padding(
        padding: EdgeInsets.only(top: 210),
        child: Container(
          decoration: new BoxDecoration(
            borderRadius: new BorderRadius.circular(30),
            color: Colors.green,
          ),
        ),
      ),
    ]);
  }

  Widget _buildAppBar() {
    return AppBar(
      toolbarHeight: 200,
      title: Padding(
        child: Text(
          "Journal",
          style: TextStyle(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
        ),
        padding: EdgeInsets.only(bottom: 70),
      ),
      flexibleSpace: 
      
    
       Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [ SizedBox(height: 80),HCalendarSelector()],
        ),
      
    );
  }

Widget _buildContainment(){
  
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }
}
