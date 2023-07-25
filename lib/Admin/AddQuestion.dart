import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../Services/toast.dart';
import '../modules/LoginPage.dart';
import '../modules/colors.dart';
import '../main.dart';

class AddQuestion extends StatefulWidget {
  final String name , docId;
  final DocumentSnapshot doc;
  AddQuestion(this.name,this.docId,this.doc);
  @override
  State<AddQuestion> createState() => _AddQuestionState();
}

class _AddQuestionState extends State<AddQuestion> {
  TextEditingController quest = TextEditingController();
  TextEditingController c1 = TextEditingController();
  TextEditingController c2 = TextEditingController();
  TextEditingController c3 = TextEditingController();
  TextEditingController c4 = TextEditingController();
  TextEditingController pass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return StatefulBuilder(builder: (context, nsetState) {
                  return AlertDialog(
                    backgroundColor: Colors.white,
                    actionsAlignment: MainAxisAlignment.center,
                    content: Container(
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
                                      'السؤال',
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
                                    controller: quest,
                                    keyboardType: TextInputType.text,
                                    decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      hintText: 'من فضلك ادخل نص السؤال',
                                    ),
                                    onChanged: (value) {
                                      print(value);
                                    }),
                                SizedBox(
                                  height: 15.0,
                                ),
                                TextFormField(
                                    controller: c1,
                                    keyboardType: TextInputType.text,
                                    decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      hintText: 'من فضلك ادخل الاختيار الاول',
                                    ),
                                    onChanged: (value) {
                                      print(value);
                                    }),
                                SizedBox(
                                  height: 15.0,
                                ),
                                TextFormField(
                                    controller: c2,
                                    keyboardType: TextInputType.text,
                                    decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      hintText: 'من فضلك ادخل الاختيار الثاني',
                                    ),
                                    onChanged: (value) {
                                      print(value);
                                    }),
                                SizedBox(
                                  height: 15.0,
                                ),
                                TextFormField(
                                    controller: c3,
                                    keyboardType: TextInputType.text,
                                    decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      hintText: 'من فضلك ادخل الاختيار الثالث',
                                    ),
                                    onChanged: (value) {
                                      print(value);
                                    }),
                                SizedBox(
                                  height: 15.0,
                                ),
                                TextFormField(
                                    controller: c4,
                                    keyboardType: TextInputType.text,
                                    decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      hintText: 'من فضلك ادخل الاختيار الرابع',
                                    ),
                                    onChanged: (value) {
                                      print(value);
                                    }),
                                SizedBox(
                                  height: 15.0,
                                ),
                                TextFormField(
                                    controller: pass,
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      hintText: 'الاختيار الصحيح رقم ؟',
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
                                          if(quest.text.trim() != "" &&
                                              c1.text.trim() != "" &&
                                              c2.text.trim() != "" &&
                                              c3.text.trim() != "" &&
                                              c4.text.trim() != "" &&
                                              pass.text.trim() != ""){
                                          FirebaseFirestore.instance.collection("Exams").doc(widget.docId).update({
                                            "exam" : FieldValue.arrayUnion([
                                              {
                                                "quest" : quest.text.trim(),
                                                "answer" : [c1.text.trim(),
                                                            c2.text.trim(),
                                                            c3.text.trim(),
                                                            c4.text.trim(),
                                                            pass.text.trim()],
                                              }
                                            ])
                                          }).then((value){
                                            Navigator.pop(context);
                                          });
                                          }else{
                                            toast("من فضلك املئ كل البيانات");
                                          }
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
      ),
      appBar: AppBar(
        backgroundColor: fontColor,
        title: Text("${widget.name}"),
        centerTitle: true,

      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/Vector.jpg"),
                fit: BoxFit.cover)),
        child:StreamBuilder<DocumentSnapshot>(
      stream: FirebaseFirestore.instance.collection("Exams").doc(widget.docId).snapshots(),
      builder:(context,snapshots){
        if (snapshots.hasError)
          return Center(child: Text("Error"));
        switch (snapshots.connectionState) {
          case ConnectionState.waiting: return Center(
            child: Center(child: CircularProgressIndicator())
          );
          default:
      return SingleChildScrollView(
        child: Column(
          children: [
            for(int i=0; i<snapshots.data!["exam"].length ; i++)...[
              card(context, snapshots.data!["exam"][i]["quest"] , i)
            ]
        ]),
      );
      }})
      ),
    );
  }

  Widget card(BuildContext context, text, int i) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: fontColor, width: 2.5)),
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width - 23,
      child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
        Container(
          width: MediaQuery.of(context).size.width - 115,
          child: Text(
            text,
            style: TextStyle(
              color: fontColor,
              fontSize: 20,
              fontWeight: FontWeight.w800,
            ),
            textAlign: TextAlign.right,
          ),
        ),
        SizedBox(width: 10),
        Container(
          width: 35,
          height: 35,
          decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: fontColor, width: 2.5)),
          alignment: Alignment.center,
          child: Text(
          (i+1).toString(),
          style: TextStyle(
            color: fontColor,
            fontSize: 20,
            fontWeight: FontWeight.w800,
          ),
          textAlign: TextAlign.center,
        ),
        )
      ]),
    );
  }
}
