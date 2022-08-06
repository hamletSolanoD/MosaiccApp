
import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';

abstract class AbstractLoginRepository {

 Future<dynamic> signInWithEmail({String username, String password});

   Future<dynamic> signInAnonymusly({String username, String password});

    Future<dynamic> signUp({String username, String password});

  
  
}