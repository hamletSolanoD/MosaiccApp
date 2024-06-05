import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../domain/BLoCs/entities/repositories/abstract_login.dart';

class FirebaseLoginRepository extends AbstractLoginRepository {

  @override
  Future<UserCredential> signInAnonymusly({String username, String password}) async {
    try {
      final credentials = await FirebaseAuth.instance.signInAnonymously();
      print('${credentials.user.uid}');
      return credentials;
    } on Exception catch (e) {
        print(e);
    }
    return null;
  }

  @override
 Future<UserCredential> signInWithEmail({String username, String password}) async {
    try {
      final credentials = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: username, password: password);
      print('${credentials.user.uid}');
      return credentials;
    } on Exception catch (e) {
      print(e);
    }
        return null;
  }

  @override
  Future<UserCredential> signUp({String username, String password}) async {
    // TODO: implement signUp
 try {
      final credentials = await  FirebaseAuth.instance
        .createUserWithEmailAndPassword(email:username, password:password);
      print('${credentials.user.uid}');
      return credentials;
    } on Exception catch (e) {
        print(e);
    }
        return null;
  }


  
}
