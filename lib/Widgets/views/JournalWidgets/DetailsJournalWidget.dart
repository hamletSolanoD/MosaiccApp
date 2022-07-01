import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/weather.dart';

class DetailsJournalWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return DetailsJournalWidgetState();
  }
}

class DetailsJournalWidgetState extends State<DetailsJournalWidget> {
  DateTime CreationDate;
  DateTime LastUpdate;
  double Weather;
  String CreationDevice;
  String  Apikey = "7895b73b5938744ae7f76395d4349a33";
  WeatherFactory wheaterFactory;
  Position takedPosition;

  Future<Position> _setCurrentPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  Future<void> initializeDetails() async {
    takedPosition = await _setCurrentPosition();
    wheaterFactory = WeatherFactory(Apikey);


    CreationDate = DateTime.now();
    LastUpdate = DateTime.now();
    Weather =  (await wheaterFactory.currentWeatherByLocation(takedPosition.latitude, takedPosition.longitude)).temperature.celsius;
       final deviceInfoPlugin = DeviceInfoPlugin();
   
    

     if (Platform.isAndroid) {
       final deviceInfo = await deviceInfoPlugin.androidInfo;
      CreationDevice =deviceInfo.model;
        }


  }

  Future<List<Widget>> _createWidgetsRows()async {
    await initializeDetails();
    return [
      Row(
        children: [
          Text("Creation Date"),
          Flexible(child: Container()),
          Text(CreationDate.toString()),
        ],
      ),
      Divider(
        height: 20,
        thickness: 2,
        indent: 0,
        endIndent: 0,
        color: Colors.black,
      ),
      Row(
        children: [
          Text("Last Update"),
          Flexible(child: Container()),
          Text(LastUpdate.toString()),
        ],
      ),
      Divider(
        height: 20,
        thickness: 2,
        indent: 0,
        endIndent: 0,
        color: Colors.black,
      ),
      Row(
        children: [
          Text("Weather"),
          Flexible(child: Container()),
          Text(Weather.toString() + "C."),
        ],
      ),
      Divider(
        height: 20,
        thickness: 2,
        indent: 0,
        endIndent: 0,
        color: Colors.black,
      ),
      Row(
        children: [
          Text("Elevation"),
          Flexible(child: Container()),
          Text(takedPosition.altitude.toString() + "ft."),
        ],
      ),
      Divider(
        height: 20,
        thickness: 2,
        indent: 0,
        endIndent: 0,
        color: Colors.black,
      ),
      Row(
        children: [
          Text("Creation Device"),
          Flexible(child: Container()),
          Text(CreationDevice),
        ],
      ),
      Divider(
        height: 20,
        thickness: 2,
        indent: 0,
        endIndent: 0,
        color: Colors.black,
      ),
      Row(
        children: [
          Text("Location"),
          Flexible(child: Container()),
          Text("Lat: " +
              takedPosition.latitude.toString() +
              "\nLong: " +
              takedPosition.longitude.toString()),
        ],
      ),
      Divider(
        height: 20,
        thickness: 2,
        indent: 0,
        endIndent: 0,
        color: Colors.black,
      ),
    ];
  }




  @override
  Widget build(BuildContext context) {
    // TODO: implement build


    return Container(
      child: FutureBuilder <List<Widget>> (
        future: _createWidgetsRows(),
        builder: (context, snapshot){

          if(snapshot.hasData){ return Column(
            children: snapshot.data,
          );}
          else{
            return Column( children: [Text("Data")]);
          }

         
          }
        ) ,
    
    );

  }
}
