import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '/modules/ExamStart.dart';
import '../Admin/AddQuestion.dart';
import '../modules/LoginPage.dart';
import '../modules/colors.dart';
import '../main.dart';

class Exams extends StatefulWidget {
  @override
  State<Exams> createState() => _ExamsState();
}

class _ExamsState extends State<Exams> {
  TextEditingController exam = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FirebaseAuth.instance.currentUser!.email!.toLowerCase() == "admin@admin.com" ? FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return StatefulBuilder(builder: (context, nsetState) {
                  return AlertDialog(
                    backgroundColor: Colors.white,
                    actionsAlignment: MainAxisAlignment.center,
                    content: Container(
                      height: 220.0,
                      width: 300.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Directionality(
                          textDirection: TextDirection.rtl,
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      'الاختبار',
                                      style: TextStyle(
                                          fontFamily: "Cairo",
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20.0),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 15.0,
                                ),
                                TextFormField(
                                    controller: exam,
                                    keyboardType: TextInputType.text,
                                    decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      hintText: 'من فضلك ادخل اسم الاختبار',
                                    ),
                                    onChanged: (value) {
                                      print(value);
                                    }),
                                SizedBox(
                                  height: 20.0,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 59.0,
                                      width: 100.0,
                                      decoration: BoxDecoration(
                                        color: fontColor,
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                      ),
                                      child: MaterialButton(
                                        onPressed: () {
                                          FirebaseFirestore.instance.collection("Exams").add({
                                            "name" : exam.text.trim(),
                                            "exam" : []
                                          }).then((value){
                                            Navigator.pop(context);
                                          });
                                        },
                                        child: Text(
                                          'اضافة',
                                          style: TextStyle(
                                              fontFamily: "Cairo",
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20.0),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10.0,
                                    ),
                                    Container(
                                      height: 59.0,
                                      width: 100.0,
                                      decoration: BoxDecoration(
                                        color: Colors.grey[100],
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                        border: Border.all(color: fontColor),
                                      ),
                                      child: MaterialButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text(
                                          'الغاء',
                                          style: TextStyle(
                                              fontFamily: "Cairo",
                                              color: fontColor,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20.0),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                });
              });
        },
        child: Icon(Icons.add),
        backgroundColor: fontColor,
      ):Container(),
      appBar: AppBar(
        backgroundColor: fontColor,
        title: Text("صفحة الاختبارات"),
        centerTitle: true,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/Vector.jpg"),
                fit: BoxFit.cover)),
        child:StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection("Exams").snapshots(),
      builder:(context,snapshots){
        if (snapshots.hasError)
          return Center(child: Text("Error"));
        switch (snapshots.connectionState) {
          case ConnectionState.waiting: return Center(
            child: Center(child: CircularProgressIndicator())
          );
          default:
      return ListView(shrinkWrap: true, children: snapshots.data!.docs.map((doc)=> card(context, doc["name"] ,"assets/images/exam.png",doc)).toList());
      }})
      ),
    );
  }

  Widget card(BuildContext context, text, image, DocumentSnapshot doc) {
    return InkWell(
      onTap: (){
        FirebaseAuth.instance.currentUser!.email!.toLowerCase() == "admin@admin.com" ?
        Navigator.push(context, MaterialPageRoute(builder: (context)=> AddQuestion(doc["name"], doc.id, doc))):
        Navigator.push(context, MaterialPageRoute(builder: (context)=> ExamStarts(doc)));
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            border: Border.all(color: fontColor, width: 2.5)),
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.all(10),
        width: MediaQuery.of(context).size.width - 23,
        child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
          Text(
            text,
            style: TextStyle(
              color: fontColor,
              fontSize: 20,
              fontWeight: FontWeight.w800,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(width: 15),
          Image.asset(image, height: 70),
        ]),
      ),
    );
  }
}
