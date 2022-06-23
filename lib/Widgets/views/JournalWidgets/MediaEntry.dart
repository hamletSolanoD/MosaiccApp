import 'dart:ffi';

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

  List<String>
      _IdImages; // this is only for exemple propuses, this list will fill with urls to the stored images in firebase in this specific entry

  List<audioPlayer_object>
      _audioRecordlist; // this is onnly for example propujses, this list will be filled out with all the  audios stored in this specific entry

  @override
  void dispose() {
    _audioRecordlist.forEach((element) {
      element.dispose();
    });
    super.dispose();
  }

  @override
  initState() {
    super.initState();
  }

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
    return Container(
      height: 100,
      width: 1000,
      child: ListView.builder(
          itemCount: _IdImages.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (Context, Index) {
            return Image.network(_IdImages[Index]);
          }),
    );
  }

  Widget _audioWidget() {
    return Container(
      height: 100,
      width: 1000,
      child: ListView.builder(
          itemCount: _audioRecordlist.length,
          itemBuilder: ((context, index) {
            return Container(
              margin: const EdgeInsets.all(10.0),
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  TextButton(
                      child: _audioRecordlist[index].getPlayerState() ==
                              PlayerState.playing
                          ? Icon(Icons.stop)
                          : Icon(Icons.play_arrow),
                      onPressed: () {
                        switch (_audioRecordlist[index].getPlayerState()) {
                          case PlayerState.completed:
                            _audioRecordlist[index].play();
                            _audioRecordlist[index]
                                .setPlayerState(PlayerState.playing);
                            break;
                          case PlayerState.paused:
                            _audioRecordlist[index].play();
                            _audioRecordlist[index]
                                .setPlayerState(PlayerState.playing);
                            setState(() {});
                            break;
                          case PlayerState.stopped:
                            _audioRecordlist[index].play();
                            _audioRecordlist[index]
                                .setPlayerState(PlayerState.playing);
                            setState(() {});
                            break;
                          case PlayerState.playing:
                            _audioRecordlist[index].pause();
                            _audioRecordlist[index]
                                .setPlayerState(PlayerState.stopped);
                            setState(() {});

                            break;
                        }
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              content: new Text(_audioRecordlist[index]
                                  .getPlayerState()
                                  .toString()),
                            );
                          },
                        );
                      }),
                  Slider(
                      value: _audioRecordlist[index].getAudioPosition(),
                      onChanged: (value) {
                        print('Current position: $value');
                        //_audioRecordlist[index].setPosition(value);

                        setState(() {});
                      }),
                ],
              ),
            );
          })),
    );
  }

  void initializationOfStoredMedia() {
    _IdImages = [
      "https://picsum.photos/id/34/200/300",
      "https://picsum.photos/id/344/200/300",
      "https://picsum.photos/id/345/200/300",
      "https://picsum.photos/id/312/200/300",
      "https://picsum.photos/id/356/200/300",
      "https://picsum.photos/id/376/200/300",
      "https://picsum.photos/id/312/200/300",
    ];
    _audioRecordlist = [
      audioPlayer_object(AssetSource("audios/test.mp3")),
    ];
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    initializationOfStoredMedia();
    return Container(
      margin: const EdgeInsets.all(30.0),
      padding: const EdgeInsets.all(10.0),
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

class audioPlayer_object {
  Source _source;
  AudioPlayer _audioPlayer;
  Function _methdOnFocus;
  int _positionInSeconds;
  PlayerState _playerState;
  audioPlayer_object(
    this._source,
  ) {
    _positionInSeconds = 0;
    _audioPlayer = AudioPlayer();
    _playerState = PlayerState.stopped;
    _audioPlayer.onPlayerStateChanged.listen((event) {
      _playerState = event;
    });
    _audioPlayer.onPositionChanged.listen((Duration p) {
      _positionInSeconds = p.inSeconds;
    });
  }

  void dispose() {
    _audioPlayer.release();
    _audioPlayer.dispose();
  }

  void setPosition(double seconds) async {
    await _audioPlayer.seek(Duration(milliseconds: seconds.toInt()));
  }

  double getAudioPosition() => _positionInSeconds.toDouble();
  PlayerState getPlayerState() => _playerState;
  void setPlayerState(PlayerState p) {
    _playerState = p;
  }

  void stop() async {
    _audioPlayer.stop();
  }
  void pause() async {
    _audioPlayer.pause();
  }

  void play() async {
    await _audioPlayer.setSource(_source);
    await _audioPlayer.resume();
  }
}
