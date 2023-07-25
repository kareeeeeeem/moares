import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../modules/solution.dart';
import '../Services/MenuDialog.dart';
import '../Services/pdf.dart';
import '../modules/Chat.dart';
import '../modules/colors.dart';
import '../modules/connect.dart';

class History extends StatefulWidget {
  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  List<DocumentSnapshot> docs = [];
  @override
  void initState() {
    FirebaseFirestore.instance
        .collection("Users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("History")
        .get()
        .then((val) {
      val.docs.forEach((element) {
        setState(() {
          docs.add(element);
        });
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image(
            image: AssetImage('assets/images/Vector.jpg'),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
          SizedBox(
            width: double.infinity,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              height: 45.0,
                              width: 45.0,
                              decoration: BoxDecoration(
                                color: Colors.grey[100],
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: Image(
                                image: AssetImage(
                                  'assets/images/back.png',
                                ),
                              ),
                            ),
                          ),
                          Spacer(),
                          InkWell(
                            onTap: () {
                              menuDialog(context);
                            },
                            child: Container(
                              height: 45.0,
                              width: 45.0,
                              decoration: BoxDecoration(
                                color: Colors.grey[100],
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: const Image(
                                image: AssetImage(
                                  'assets/images/menu.png',
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              SizedBox(
                                height: 10.0,
                              ),
                              Column(
                                children: [
                                  for (int i = 0; i < docs.length; i++) ...[
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => Solution(
                                                    docs[i]["wealth"],
                                                    docs[i]["husband"],
                                                    docs[i]["wives"],
                                                    docs[i]["sons"],
                                                    docs[i]["daughters"],
                                                    docs[i]["father"],
                                                    docs[i]["mother"],
                                                    docs[i]["grandfather"],
                                                    docs[i]["grandSons"],
                                                    docs[i]["grandDaughters"],
                                                    docs[i]["fullSister"],
                                                    docs[i]["fullBrother"],
                                                    docs[i]["name"],
                                                    docs[i]["paternalGrandMother"],
                                                    docs[i]["maternalGrandMother"],
                                                    docs[i]["paternalBrothers"],
                                                    docs[i]["paternalSisters"],
                                                    docs[i]["maternalBrothers"],
                                                    docs[i]["maternalSisters"],
                                                    docs[i]["fullNephews"],
                                                    docs[i]["paternalNephews"],
                                                    docs[i]["fullPaternalUncles"],
                                                    docs[i]["paternalPaternalUncles"],
                                                    docs[i]["fullCousins"],
                                                    docs[i]["paternalCousins"],
                                                    true)
                                                    ));
                                      },
                                      child: Container(
                                        height: 50.0,
                                        width:
                                            MediaQuery.of(context).size.width -
                                                90,
                                        decoration: BoxDecoration(
                                          border: Border.all(color: fontColor),
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Center(
                                                child: Text(
                                                  docs[i]["name"] ?? "",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: fontColor,
                                                    fontSize: 16.0,
                                                  ),
                                                ),
                                              ),
                                              InkWell(
                                                onTap: (){
                                                  FirebaseFirestore.instance
                                                  .collection("Users")
                                                  .doc(FirebaseAuth.instance.currentUser!.uid)
                                                  .collection("History").doc(docs[i].id).delete();
                                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>History()));
                                                },
                                                child: Icon(Icons.delete,color: Colors.red[800],size: 28,))
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                  ]
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
