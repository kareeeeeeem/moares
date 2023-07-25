import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '/Admin/Exams.dart';
import '../Services/toast.dart';
import '../modules/History.dart';
import '../modules/start.dart';

import '../modules/Chat.dart';
import '../modules/connect.dart';

menuDialog(BuildContext context , [bool mon=false,
  bool felo=false,
  bool bebo=false,bool border=false]){
    if(FirebaseAuth.instance.currentUser != null){
showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) {
      return StatefulBuilder(
          builder: (context, nsetState) {
            return AlertDialog(
              backgroundColor: Colors.white,
              actionsAlignment:
              MainAxisAlignment.center,
              title: Row(
                mainAxisAlignment:
                MainAxisAlignment.end,
                children: [
                  const Text(
                    'مواريث',
                    style: TextStyle(
                        fontFamily: "Cairo",
                        color: Colors.black,
                        fontWeight:
                        FontWeight.bold),
                  ),
                  const SizedBox(
                    width: 15.0,
                  ),
                  Container(
                    height: 65,
                    // clipBehavior:
                    // Clip.antiAliasWithSaveLayer,
                    // decoration: const BoxDecoration(
                    //     shape: BoxShape.circle),
                    child: const Image(
                      image: AssetImage(
                        'assets/images/secondphoto.png',
                      ),
                      height: 65,
                      width: 65,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ],
              ),

              // ignore: sized_box_for_whitespace
              content: Container(
                height: 540.0,
                width: 342.0,
                decoration: BoxDecoration(
                  borderRadius:
                  BorderRadius.circular(50.0),
                ),
                child: Padding(
                  padding:
                  const EdgeInsets.symmetric(
                      vertical: 50.0),
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (context) =>
                                    Chat(),
                              ));
                        },
                        child: Ink(
                          height: 40.0,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius:
                            BorderRadius
                                .circular(15.0),
                            color: border
                                ? Colors.blue
                                : Colors.white,
                          ),
                          child: Row(
                            children: [
                              const Image(
                                  image: AssetImage(
                                      'assets/images/back.png')),
                              const Spacer(),
                              const Text(
                                'شات بوت',
                                style: TextStyle(
                                    fontFamily:
                                    "Cairo",
                                    color: Colors
                                        .black,
                                    fontSize: 20.0),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (context) =>
                                    Start(),
                              ));
                        },
                        child: Ink(
                          height: 40.0,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius:
                            BorderRadius
                                .circular(15.0),
                            color: mon
                                ? Colors.blue
                                : Colors.white,
                          ),
                          child: Row(
                            children: [
                              const Image(
                                  image: AssetImage(
                                      'assets/images/back.png')),
                              const Spacer(),
                              const Text(
                                'مسالة جديدة',
                                style: TextStyle(
                                    fontFamily:
                                    "Cairo",
                                    color: Colors
                                        .black,
                                    fontSize: 20.0),
                              ),
                            ],
                          ),
                        ),
                      ),
                        SizedBox(
                        height: 25.0,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (context) =>
                                    Connect(),
                              ));
                        },
                        child: Ink(
                          height: 40.0,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius:
                            BorderRadius
                                .circular(15.0),
                            color: felo
                                ? Colors.blue
                                : Colors.white,
                          ),
                          child: Row(
                            children: [
                              const Image(
                                  image: AssetImage(
                                      'assets/images/back.png')),
                              const Spacer(),
                              const Text(
                                'تواصل معنا',
                                style: TextStyle(
                                    fontFamily:
                                    "Cairo",
                                    color: Colors
                                        .black,
                                    fontSize: 18.0),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 25.0,
                      ),
                      InkWell(
                        onTap: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (context) =>
                                    Start(),
                              ));
                        },
                        child: Ink(
                          height: 40.0,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            color:felo ? Colors.blue:Colors.white,
                          ),
                          child:Row(
                            children: [
                              Image(image: AssetImage(
                                  'assets/images/back.png'
                              )),
                              Spacer(),
                              Text('خيارات متقدمة',style: TextStyle(fontFamily: "Cairo" , color: Colors.black,fontSize: 18.0),
                              ),

                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 25.0,
                      ),
                      InkWell(
                        onTap: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (context) =>
                                    Exams(),
                              ));
                        },
                        child: Ink(
                          height: 40.0,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            color:felo ? Colors.blue:Colors.white,
                          ),
                          child:Row(
                            children: [
                              Image(image: AssetImage(
                                  'assets/images/back.png'
                              )),
                              Spacer(),
                              Text('الاختبارات',style: TextStyle(fontFamily: "Cairo" , color: Colors.black,fontSize: 18.0),
                              ),

                            ],
                          ),
                        ),
                      ),

                      SizedBox(
                        height: 25.0,
                      ),
                      InkWell(
                        onTap: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (context) =>
                                    History(),
                              ));
                        },
                        child: Ink(
                          height: 40.0,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            color:felo ? Colors.blue:Colors.white,
                          ),
                          child:Row(
                            children: [
                              Image(image: AssetImage(
                                  'assets/images/back.png'
                              )),
                              Spacer(),
                              Text('السجل',style: TextStyle(fontFamily: "Cairo" , color: Colors.black,fontSize: 18.0),
                              ),

                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          });
    });
    }else{
      toast("من فضلك قم بتسجيل الدخول لاستخدام باقي خصائص التطبيق");
    }
}