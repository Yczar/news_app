import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
//import 'package:isales2/db/users.dart';

enum Status{Uninitialized, Authenticated, Authenticating, Unauthenticated}

class UserProvider with ChangeNotifier{
  FirebaseAuth _auth;
  FirebaseUser _user;
  Status _status = Status.Uninitialized;
  Status get status => _status;
  FirebaseUser get user => _user;
  Firestore _firestore = Firestore.instance;
//  UserServices _userServices = UserServices();



  UserProvider.initialize(): _auth = FirebaseAuth.instance{
    _auth.onAuthStateChanged.listen(_onStateChanged);
  }

  Future<bool> signIn(String email, String password)async{
    try{
      _status = Status.Authenticating;
      notifyListeners();
      await _auth.signInWithEmailAndPassword(email: email, password: password).then((result){
        Fluttertoast.showToast(msg: "Login Successful");
      }).catchError((e){
        Fluttertoast.showToast(msg: "${e.toString()}", toastLength: Toast.LENGTH_LONG);
        _status = Status.Unauthenticated;
      });
      return true;
    }catch(e){
      _status = Status.Unauthenticated;
      notifyListeners();
      print(e.toString());
      return false;
    }
  }


  Future<bool> signUp(String fullname, String email, String password)async{
    try{
      _status = Status.Authenticating;
      notifyListeners();
      await _auth.createUserWithEmailAndPassword(email: email, password: password).then((user){
        _firestore.collection('users').document(_user.uid).setData({
          'email':email,
          "fullname" : fullname,
          "password" : password,
          "Occupation" : "Tap to Edit",
          "LGA" : "Tap to Edit",
          "Location" : "Loading",
          'uid':_user.uid,
          "profileimage" : "https://firebasestorage.googleapis.com/v0/b/news-app-ae0cd.appspot.com/o/placeholder.jpg?alt=media&token=8252afad-2d6c-4b07-ab4d-455d5de93539",
        }).catchError((onError){
          Fluttertoast.showToast(msg: "${onError}");
        });
      });
      return true;
    }catch(e){
      _status = Status.Unauthenticated;
      notifyListeners();
      print(e.toString());
      return false;
    }
  }

  Future signOut()async{
    _auth.signOut();
    _status = Status.Unauthenticated;
    notifyListeners();
    return Future.delayed(Duration.zero);
  }



  Future<void> _onStateChanged(FirebaseUser user) async{
    if(user == null){
      _status = Status.Unauthenticated;
    }else{
      _user = user;
      _status = Status.Authenticated;
    }
    notifyListeners();
  }
}