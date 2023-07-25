import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '/Admin/AdminHomePage.dart';
import '/modules/start.dart';
import 'LoginPage.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(
     
      const Duration(seconds: 3),() =>
       FirebaseAuth.instance.currentUser != null ? 
       (FirebaseAuth.instance.currentUser!.email!.toLowerCase() == "admin@admin.com" ?
       Navigator.pushReplacement( context,MaterialPageRoute( builder: (context) =>AdminHomePage())):
       Navigator.pushReplacement( context,MaterialPageRoute( builder: (context) =>Start()))):
       Navigator.pushReplacement( context,MaterialPageRoute( builder: (context) =>LoginPage())),

    );
    super.initState();
  }
//                                                'assets/images/back.png'
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/firstphoto.png"),fit: BoxFit.cover)),
      )
        );
  }
}