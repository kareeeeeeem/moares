import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../Admin/AddQuestion.dart';
import '../modules/LoginPage.dart';
import '../modules/colors.dart';
import '../main.dart';

class ExamStarts extends StatefulWidget {
  final DocumentSnapshot doc;
  ExamStarts(this.doc);
  @override
  State<ExamStarts> createState() => _ExamsState();
}

class _ExamsState extends State<ExamStarts> {
  TextEditingController exam = TextEditingController();
  int counter = 0;
  List<int> answerIndex = [];
  bool result = false;
  int score = 0;
  List<int> answer = [0,0,0,0];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: fontColor,
        title: Text("${widget.doc["name"]}"),
        centerTitle: true,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/Vector.jpg"),
                fit: BoxFit.cover)),
        child:SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(height: 15,),
              Text(
                widget.doc["exam"][counter]["quest"],
                style: TextStyle(
                  color: fontColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                ),
                textAlign: TextAlign.end,
              ),
              SizedBox(height: 15,),
              for(int i = 0;i<4 ; i++)...[
                card(context,widget.doc["exam"][counter]["answer"][i], i , answer)
              ],
              SizedBox(height: 15,),
              result ?Text(
                "النتيجة : $score / ${widget.doc["exam"].length}",
                style: TextStyle(
                  color: fontColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                ),
                textAlign: TextAlign.end,
              ):Container(),
            ],
          ),
        )
      ),
    );
  }

  Widget card(BuildContext context, text, index,List<int> answers) {
    return InkWell(
      onTap: (){
        if((widget.doc["exam"].length - 1 > counter)){
          answerIndex.add(index);
          setState(() {
            if(answerIndex[counter] == (int.parse(widget.doc["exam"][counter]["answer"][4]) - 1)){
              answer[index] = 1;
            }else{
              answer[index] = -1;
              answer[(int.parse(widget.doc["exam"][counter]["answer"][4]) - 1)] = 1;
            }
          });
          Future.delayed(Duration(milliseconds: 2000),(){
            setState(() {
            counter = counter +1;
            answer = [0,0,0,0];
            });
          });
        }else if(widget.doc["exam"].length - 1 == counter){
          answerIndex.add(index);
          print(answerIndex);
          for (var i = 0; i < answerIndex.length; i++) {
            if(answerIndex[i] == (int.parse(widget.doc["exam"][i]["answer"][4]) - 1)){
              print(score);
              score = score + 1;
            }
          }
          setState(() {
            if(answerIndex[counter] == (int.parse(widget.doc["exam"][counter]["answer"][4]) - 1)){
              answer[index] = 1;
            }else{
              answer[index] = -1;
              answer[(int.parse(widget.doc["exam"][counter]["answer"][4]) - 1)] = 1;
            }
          });
          Future.delayed(Duration(milliseconds: 500),(){
            setState(() {
            result = true;
          });
          });
          
        }
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: answers[index] == 0 ? Colors.transparent : answers[index] == 1 ? Colors.green : Colors.red,
            border: Border.all(color: fontColor, width: 2.5)),
        padding: EdgeInsets.all(15),
        margin: EdgeInsets.all(10),
        width: MediaQuery.of(context).size.width - 23,
        child: 
          Container(
            width: MediaQuery.of(context).size.width - 80,
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
      ),
    );
  }
}
