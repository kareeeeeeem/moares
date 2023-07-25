import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../Admin/Exams.dart';
import '../modules/LoginPage.dart';
import '../modules/colors.dart';
import '../main.dart';

class AdminHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: fontColor,
        title: Text("لوحة الادمن"),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              FirebaseAuth.instance.signOut().then((value) {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => MyApp(startwidget: LoginPage(),)),
                  (Route<dynamic> route) => false,
                );
              });
            },
            icon: Icon(Icons.exit_to_app)),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/images/Vector.jpg"),fit: BoxFit.cover)
        ),
        child: ListView(
          shrinkWrap: true,
          children: [
            Row(
              children: [
                InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> Exams()));
                    },
                    child: card(context, "اختبارات المواريث", "assets/images/exam.png")),
                
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget card(BuildContext context, text, image) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          border:
              Border.all(color: fontColor, width: 2.5)),
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.all(10),
      height: 230,
      width: MediaQuery.of(context).size.width * 0.5 - 22,
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Image.asset(image, height: 95),
        SizedBox(height: 20),
        Text(
          text,
          style: TextStyle(
            color: fontColor,
            fontSize: 20,
            fontWeight: FontWeight.w800,
          ),
          textAlign: TextAlign.center,
        ),
      ]),
    );
  }
}
