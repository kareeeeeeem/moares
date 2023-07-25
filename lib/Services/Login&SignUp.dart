import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../main.dart';
import '../modules/start.dart';
import 'toast.dart';

Future loginData(BuildContext context,String email, String password) async {
    try {
        toast("Wait a moment...");
        await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
          if(value.user != null){
          
          Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => MyApp(startwidget:Start())),
              (Route<dynamic> route) => false,
        );
          
          }
        });
        
    } catch (e) {
 
      toast( "${e.toString()}");
    }
  }

  Future signUpData(BuildContext context,String email, String password, String name, String phone) async {
    try {
      toast("Please wait a moment...");
        await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password)
            .then((val) {
          FirebaseFirestore.instance
              .collection("Users")
              .doc("${val.user!.uid}")
              .set({
            "name": name,
            "phone": phone,
            "email": email,
            "active": true,
          }).then((value) {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => MyApp(startwidget:Start())),
              (Route<dynamic> route) => false,
            );
          });
        });
    } on Exception catch (exception) {
      print(exception);
      toast("$exception");
    } catch (e) {
      toast("${e.toString()}");
    }
  }