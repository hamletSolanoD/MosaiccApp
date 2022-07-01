import 'package:flutter/material.dart';
import 'package:mosaicc/Widgets/views/JournalWidgets/DetailsJournalWidget.dart';
class JournalMain extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return JournalMainState();
  }
}

class JournalMainState extends State<JournalMain> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
      return Padding(padding: EdgeInsets.fromLTRB(20, 10, 20, 10), child: DetailsJournalWidget());
  }


}