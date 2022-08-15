import 'package:flutter/material.dart';
import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:mosaicc/ui/pages/JournalWidgets/Widgets/HCalendarSelector.dart';
import 'package:mosaicc/ui/pages/JournalWidgets/Widgets/JournalTypesSelector.dart';
import 'package:mosaicc/ui/pages/JournalWidgets/Widgets/MinJournalEntry.dart';

class JournalMain extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return JournalMainState();
  }
}

class JournalMainState extends State<JournalMain> {
  List<MinJournalEntry> _recentEntries = [];
  List<MinJournalEntry> _onThisDay = [];

  Widget _buildBody() {
    return Stack(children: [
      Positioned(top: 0.0, left: 0.0, right: 0.0, child: _buildAppBar()),
      Padding(
        padding: EdgeInsets.only(top: 210),
        child: Container(
          decoration: new BoxDecoration(
            borderRadius: new BorderRadius.circular(25),
            color: Color.fromARGB(255, 245, 245, 245),
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.only(top: 230),
        child: _buildContainment(),
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
      flexibleSpace: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [SizedBox(height: 80), HCalendarSelector()],
      ),
    );
  }

  Widget _buildContainment() {
    return SingleChildScrollView(
      child:  Padding(
          padding: EdgeInsets.all(10),
          child:
          Column(children: [
        JournalTypesSelector(),
        SizedBox(
          height: 40,
        ),
        _entriesBox(
            "Recent Entries",
            _recentEntries.sublist(
                0, _recentEntries.length > 3 ? 3 : _recentEntries.length)),
                  SizedBox(
          height: 40,
        ),
        _entriesBox(
            "On this Day",
            _recentEntries.sublist(
                0, _recentEntries.length > 2 ? 2 : _recentEntries.length))
      ])),
    );
  }

  void _testingStorage() {
    _recentEntries.add(MinJournalEntry(Colors.yellow,
        lorem(paragraphs: 2, words: 60), lorem(paragraphs: 2, words: 60)));
    _recentEntries.add(MinJournalEntry(Colors.lightBlueAccent,
        lorem(paragraphs: 2, words: 60), lorem(paragraphs: 2, words: 60)));
    _recentEntries.add(MinJournalEntry(Colors.red,
        lorem(paragraphs: 2, words: 60), lorem(paragraphs: 2, words: 60)));
    _recentEntries.add(MinJournalEntry(Colors.white,
        lorem(paragraphs: 2, words: 60), lorem(paragraphs: 2, words: 60)));
    _recentEntries.add(MinJournalEntry(Colors.purple,
        lorem(paragraphs: 2, words: 60), lorem(paragraphs: 2, words: 60)));

    _onThisDay.add(MinJournalEntry(Colors.lightBlueAccent,
        lorem(paragraphs: 2, words: 60), lorem(paragraphs: 2, words: 60)));
    _onThisDay.add(MinJournalEntry(Colors.lightBlueAccent,
        lorem(paragraphs: 2, words: 60), lorem(paragraphs: 2, words: 60)));
    _onThisDay.add(MinJournalEntry(Colors.lightBlueAccent,
        lorem(paragraphs: 2, words: 60), lorem(paragraphs: 2, words: 60)));
  }

  @override
  Widget build(BuildContext context) {
    _testingStorage();
    return Scaffold(
      body: _buildBody(),
    );
  }
}

class _entriesBox extends StatelessWidget {
  List<MinJournalEntry> _recentEntries;
  String _title;
  _entriesBox(String _Title, List<MinJournalEntry> _RecentEntries) {
    _recentEntries = _RecentEntries;
    _title = _Title;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        height: (240.0 * _recentEntries.length)+30,
        decoration: new BoxDecoration(
          borderRadius: new BorderRadius.circular(16.0),
          color: Colors.white,
        ),
        child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      _title,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    )),
                Expanded(
                    child: ListView.separated(
                  separatorBuilder: (BuildContext context, int index) =>
                      SizedBox(height: 10),
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: _recentEntries.length,
                  itemBuilder: (BuildContext context, int index) {
                    return _recentEntries[index];
                  },
                ))
              ],
            )));
  }
}
