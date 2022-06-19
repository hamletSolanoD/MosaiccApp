import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextAreaEntry extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TextAreaEntryState();
}

class EntryWidget {
  TextFormField title;
  TextFormField description;
  Container fatherContainer;
  FocusNode titleFocusNode;
  FocusNode descriptionFocusNode;
  TextEditingController titleEditingController;
  TextEditingController descriptionEditingController;

  EntryWidget(BuildContext context) {
    titleEditingController = TextEditingController();
    descriptionEditingController = TextEditingController();
    descriptionFocusNode = FocusNode();
    titleFocusNode = FocusNode();

    titleEditingController.text = "Entry Title";
    descriptionEditingController.text = "Write something here";

    fatherContainer = Container(
      child: Column(
          children: {
        TextFormField(
          focusNode: titleFocusNode,
          minLines: 1,
          maxLines: 1,
          keyboardType: TextInputType.text,
          onEditingComplete: () =>
              {FocusScope.of(context).requestFocus(descriptionFocusNode)},
          controller: titleEditingController,
          textInputAction: TextInputAction.next,
          style: const TextStyle(
            color: Colors.black54,
          ),
          decoration: InputDecoration(fillColor: Colors.white, filled: true,counterText: ''),
        
        ),
        TextFormField(
          focusNode: descriptionFocusNode,
          minLines: 20,
          textInputAction: TextInputAction.done,
          maxLines: 20,
          maxLength: 1100,
          keyboardType: TextInputType.multiline,
          controller: descriptionEditingController,
          style: TextStyle(color: Colors.black45),
          decoration: InputDecoration(fillColor: Colors.white, filled: true,counterText: ''),
        )
      }.toList()),
    );
  }

  Container getEntry() {
    return fatherContainer;
  }

  void dispose() {
    titleFocusNode.dispose();
    descriptionFocusNode.dispose();
  }
}

class _TextAreaEntryState extends State<TextAreaEntry> {
  List<EntryWidget> _entryList = [];
  CarouselController _carouselController = CarouselController();
  int currentPage = 0;

  @override
  void dispose() {
    _entryList.forEach((element) {
      element.dispose();
    });
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          PreferredSize(
              preferredSize: Size.fromWidth(100.0),
             child: AppBar(
              automaticallyImplyLeading: false, // hides leading widget
              elevation: 0,
                title: const Text(
                  "Entry",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
                backgroundColor: Colors.white,
                actions: <Widget> [TextButton(
                    onPressed: () => {_addNewEntryEvent()},
                    child: const Text("Add Entry")),
                TextButton(
                    onPressed: () => {_removeEntryEvent()},
                    child: const Text("remove Entry"))
                ],
                
           
            ),
          ),
     
          Column(
            children: [
         
              CarouselSlider(
                carouselController: _carouselController,
                items: _entryList.map((item) => item.getEntry()).toList(),
                options: CarouselOptions(
                  onPageChanged: (index, reasson) => {
                    setState(() {
                      currentPage = index;
                    })
                  },
                  initialPage: 0,
                  height: 540,
                  autoPlay: false,
                  disableCenter: true,
                  enableInfiniteScroll: false,
                  enlargeCenterPage: true,
                ),
              ),
                   Text(
                
                "${currentPage + 1}/${_entryList.length}",
                style: TextStyle(backgroundColor: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _addNewEntryEvent() {
    setState(() {
      _entryList.add(EntryWidget(this.context));
    });
    _carouselController.jumpToPage(_entryList
        .length); // this method from the lib uses pages starting with 1 instead of 0
  }

  void _removeEntryEvent() {
    setState(() {
      _carouselController.jumpToPage(currentPage -
          1); // this method from the lib uses pages starting with 1 instead of 0
      _entryList.removeAt(currentPage + 1);
    });
  }
}
