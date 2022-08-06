import 'package:flutter/material.dart';

import '../pages/AuthPages/SignUp.dart';
import '../pages/AuthPages/signIn.dart';
import '../pages/homePage.dart';
class RouteGenerator{
  

static Route<dynamic> _errorRoute(){

return MaterialPageRoute(builder:(_){
  return Scaffold(appBar: AppBar(title: Text("Error")),body: Center(child:Text("ERROR"),),);
}

);
}


static Route<dynamic> generateRoute(RouteSettings settings){
  final args = settings.arguments;


  switch(settings.name){
    case '/signIn': return MaterialPageRoute(builder: (_) => signIn(args)) ;
    case '/homePage': return MaterialPageRoute(builder: (_) =>  homePage(args));
    case '/signUp': return MaterialPageRoute(builder: (_) =>  SignUp(args));

    default: return _errorRoute();


    
  }
}


}