import 'package:flutter/material.dart';

class MinJournalEntry extends StatefulWidget {
  Color _backgroundColor;
  String _entryDescription;
  String _Title;
  String _Image;

  MinJournalEntry(Color color, String Title, String Description,
      {String Image = ""}) {
    _backgroundColor = color;
    _entryDescription = Description;
    _Title = Title;
    _Image = Image;
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MinJournalEntryState(_backgroundColor, _Title, _entryDescription,
        Image: _Image);
  }
}

class MinJournalEntryState extends State<MinJournalEntry> {
  Color _backgroundColor;
  String _entryDescription;
  String _Title;
  String _Image;

  MinJournalEntryState(Color color, String Title, String Description,
      {String Image}) {
    _backgroundColor = color;
    _entryDescription = Description;
    _Title = Title;
    _Image = Image;
  }

  Widget _buildHeader() {
    return Row(
      children: [
        Text(
          _Title.substring(0, _Title.length > 17 ? 17 : _Title.length),
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Row(children: [
          IconButton(
            iconSize: 20,
            icon: const Icon(Icons.favorite_border),
            onPressed: () {},
          ),
          IconButton(
            iconSize: 20,
            icon: const Icon(Icons.edit_outlined),
            onPressed: () {},
          )
        ]),
      ],
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
    );
  }

  Widget _buildDescription() {
    if (_Image == "") {
      return TextField(
        maxLines: 5,
        minLines: 5,
        style: TextStyle(color: Colors.black45),
        decoration: InputDecoration(
            fillColor: _backgroundColor, filled: true, counterText: ''),
        enabled: false,
        controller: TextEditingController(text: _entryDescription),
      );
    } else {
      return Row(
        children: [
          Expanded(
              child: TextField(
                maxLines: 7,
                minLines: 7,
                style: TextStyle(color: Colors.black45),
                decoration: InputDecoration(
                    fillColor: _backgroundColor, filled: true, counterText: ''),
                enabled: false,
                controller: TextEditingController(text: _entryDescription),
              )),
              Expanded(child:  Container(
                width: 200,
                height: 200,
              decoration: BoxDecoration(
                color: Color(0xff7c94b6),
                image: DecorationImage(
                  image: NetworkImage(_Image),
                  fit: BoxFit.fitHeight,
                ),
              )))
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: new BoxDecoration(
          borderRadius: new BorderRadius.circular(16.0),
          color: _backgroundColor,
        ),
        child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [_buildHeader(), _buildDescription()],
            )));
  }
}
