import 'package:flutter/material.dart';
class generalErrorDialog extends StatelessWidget{
  String _errorString;
  generalError(String error){
    _errorString = error;
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }


}