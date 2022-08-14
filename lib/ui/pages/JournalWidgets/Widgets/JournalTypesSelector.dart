import 'package:flutter/material.dart';

class JournalTypesSelector extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return JournalTypesSelectorState();
  }
}

class JournalTypesSelectorState extends State<JournalTypesSelector> {
  Widget createButtons(Color color, String text) {
    return Column(children: [
      IconButton(
        iconSize: 75,
        icon: const Icon(Icons.text_snippet_outlined),
        color: color,
        onPressed: () {},
      ),
      Text(text)
    ]);
  }

  Widget _buildBoxes() {
    return Row(
      children: [
        Expanded(child: createButtons(Colors.red, "Personal")),
        Expanded(child: createButtons(Colors.blue, "Trip's Ideas")),
        Expanded(child: createButtons(Colors.green, "School")),
        Expanded(child: createButtons(Colors.yellow, "Friends")),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "My Journals",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    iconSize: 40,
                    icon: const Icon(Icons.arrow_forward),
                    onPressed: () {},
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              _buildBoxes()
            ],
          )),
      decoration: new BoxDecoration(
        borderRadius: new BorderRadius.circular(16.0),
        color: Colors.white,
      ),
    );
  }
}
