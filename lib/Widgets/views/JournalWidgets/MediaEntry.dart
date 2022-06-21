import 'dart:ffi';
import 'dart:html';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class MediaEntry extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return mediaEntryState();
  }
}

class mediaEntryState extends State<MediaEntry> {
  int _VideoAndImagesCounter = 0;
  int _AudiosCounter = 0;
  int _DocsCounter = 0;

  List<int> IdImages = [0, 54, 23, 213, 52, 345, 544, 43, 213, 54, 213, 54];

  Widget _detailSectionCreator(String Title, int Counter) {
    return Container(
        width: 400,
        child: Row(
          children: [
            Text(
              Title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
            Flexible(child: Container()),
            Text(
              Counter.toString(),
              style: TextStyle(fontWeight: FontWeight.normal, fontSize: 25),
            ),
            Flexible(child: Container()),
            TextButton(
              onPressed: () => {},
              child: Icon(
                Icons.add,
                color: Color.fromARGB(255, 81, 118, 199),
                size: 25.0,
              ),
            )
          ],
        ));
  }

  Widget _videoAndImagesWidget() {
    // return Scrollbar(
    //     child: SingleChildScrollView(
    //         scrollDirection: Axis.horizontal,child:

    return Container(
      height: 150,
      width: 1000,
      child: ListView.builder(
          itemCount: IdImages.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (Context, Index) {
            return Image.network(
                "https://picsum.photos/id/${IdImages[Index]}/200/300");
          }),

      //  GridView.builder(
      //     shrinkWrap: true,
      //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //         crossAxisCount: 1),
      //         itemCount: IdImages.length,
      //     itemBuilder: (Context, Index) {
      //       return Image.network(
      //           "https://picsum.photos/id/${IdImages[Index]}/200/300");
      //     })
    );
    //));
  }

  Widget _audioWidget() {}
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Container(
      child: Column(
        children: [
          _detailSectionCreator("Video & Images", _VideoAndImagesCounter),
          _videoAndImagesWidget(),
          _detailSectionCreator("Audios", _AudiosCounter),
          _audioWidget(),
          _detailSectionCreator("Docs", _DocsCounter),
        ],
      ),
    );
  }
}

class audioPlayer {
  String _url;
  Float _length;
  AudioPlayer _audioPlayer;
  Function _methdOnFocus;
  PlayerState _audioPlayerStates;
  audioPlayer(this._url, this._methdOnFocus) {
    _audioPlayer = AudioPlayer();
    _audioPlayer.onPlayerStateChanged.listen((event) {
      _methdOnFocus(event);
    });
  }

  void dispose() {
    _audioPlayer.release();
    _audioPlayer.dispose();
  }

  void stop() async {
    _audioPlayer.stop();

  }
  void play() async {
    await _audioPlayer.play(UrlSource(_url));
  }
}
