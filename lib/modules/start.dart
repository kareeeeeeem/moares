import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../Services/MenuDialog.dart';
import '../modules/Chat.dart';
import '../modules/LoginPage.dart';
import '../modules/colors.dart';
import '../modules/connect.dart';
import '../modules/next.dart';

import '../main.dart';
import 'SpecialCases.dart';


class Start extends StatefulWidget {
  const Start({Key? key}) : super(key: key);

  @override
  State<Start> createState() => _StartState();
}
class _StartState extends State<Start> {
  bool border=false;
  var money=TextEditingController();
  bool mon=false;
  bool felo=false;
  bool bebo=false;
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
  child:   Padding(
    padding: const EdgeInsets.all(20.0),
    child:   Column(
      children: [
        Container(
          margin: EdgeInsets.only(top:40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                onTap: (){
                FirebaseAuth.instance.currentUser == null ? Navigator.pop(context) :  FirebaseAuth.instance.signOut().then((value){
                     Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => MyApp(startwidget:LoginPage())),
                      (Route<dynamic> route) => false,
                    );
                  });
                },
                child: Container(
                  height: 45.0,
                  width: 45.0,
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: FirebaseAuth.instance.currentUser == null ? Icon(Icons.arrow_back , color: fontColor,) : Icon(Icons.exit_to_app , color: fontColor,)
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
          height: 35.0,
        ),
        Text('المواريث',
          style: TextStyle
            (fontFamily: "Cairo" , color: Colors.black,fontWeight: FontWeight.bold,fontSize: 30.0),
        ),
        SizedBox(
          height: 20.0,
        ),
        Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Text('مقدار التركة',style: TextStyle(
                    fontFamily: "Cairo" , color: Colors.black,fontWeight: FontWeight.bold,fontSize: 17.0
                ),),
              ),
              SizedBox(
                height: 5.0,
              ),
              Align(
                alignment:Alignment.center ,
                child: Container(
                  height: 80.0,
                  width: 325.0,
                  child: TextFormField(
                      controller: money,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: 'من فضلك ادخل مقدار التركة',
                        enabledBorder: OutlineInputBorder(
                          borderSide:  BorderSide(
                            color: Colors.grey ,
                          ),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      )),



                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height:20.0,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            children: [

              // Container(
              //   height: 59.0,
              //   width: 151.0,
              //   decoration: BoxDecoration(
              //     color: Colors.grey[100],
              //     borderRadius: BorderRadius.circular(15.0),
              //     border:Border.all(color:fontColor) ,

              //   ),
              //   child: MaterialButton(onPressed: (){},child:
              //   Text('الغاء',
              //     style: TextStyle(fontFamily: "Cairo" , color: fontColor,fontWeight: FontWeight.bold,fontSize: 20.0),
              //   ),
              //   ),
              // ),
              // SizedBox(
              //   width: 20.0,
              // ),
              Container(
                height: 59.0,
                width: 140.0,
                decoration: BoxDecoration(
                  color: fontColor,
                  borderRadius: BorderRadius.circular(15.0),

                ),
                child: MaterialButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(
                    builder:(context)=>Example(double.parse(money.text.trim() == "" ? "0" : money.text.trim())),
                  ));
                },child:
                Text('التالي',
                  style: TextStyle(fontFamily: "Cairo" , color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20.0),
                ),
                ),
              ),
              SizedBox(height: 8,),

              Container(
                height: 59.0,
                width: 190.0,
                decoration: BoxDecoration(
                  color: fontColor,
                  borderRadius: BorderRadius.circular(15.0),

                ),
                child: MaterialButton(onPressed: (){
                 Navigator.push(context, MaterialPageRoute(builder:(context) => SpecialCases(double.parse((money.text.trim() == "" ? "0" : money.text.trim())))));
                },child:
                Text('خيارات متقدمة',
                  style: TextStyle(fontFamily: "Cairo" , color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20.0),
                ),
                ),
              ),


            ],
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
