import 'package:flutter/material.dart';
import '../Services/MenuDialog.dart';
import '../modules/Chat.dart';
import '../modules/colors.dart';
import '../modules/connect.dart';
import '../modules/solution.dart';

import '../Services/toast.dart';

class Mwareeth extends StatefulWidget {
  final int husband;
  final int wives;
  final bool father;
  final bool grandfather;
  final bool mother;
  final double wealth;
  Mwareeth(this.wealth, this.husband, this.wives, this.father, this.mother,
      this.grandfather);

  @override
  State<Mwareeth> createState() => _MwareethState();
}

class _MwareethState extends State<Mwareeth> {
  bool border = false;
  bool mon = false;
  bool felo = false;
  bool bebo = false;
  int counter = 0;
  int c = 0;
  int child = 0;
  int girl = 0;
  int pro = 0;
  int sis = 0;

  var dead = TextEditingController();
  var female = TextEditingController();
  var grandpa = TextEditingController();
  var mother = TextEditingController();

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
                    Row(
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
                    SizedBox(
                      height: 35.0,
                    ),
                    Text(
                      'المواريث',
                      style: TextStyle(
                          fontFamily: "Cairo",
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 30.0),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'كم عدد الابناء الذكور',
                          style: TextStyle(
                              fontFamily: "Cairo",
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0),
                        ),
                        Container(
                          height: 70.0,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: Colors.grey[100],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          counter++;
                                        });
                                      },
                                      child: Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Icon(Icons.arrow_drop_up,
                                              color: Colors.grey, size: 28),
                                        )
                                      
                                    ),
                                    SizedBox(
                                      height: 14.0,
                                    ),
                                    InkWell(
                                        onTap: () {
                                          if (counter <= 0) {
                                          } else {
                                            setState(() {
                                              counter--;
                                            });
                                          }
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Icon(Icons.arrow_drop_down,
                                              color: Colors.grey, size: 28),
                                        )),
                                  ],
                                ),
                                
                                Text(
                                  '$counter',
                                  style: TextStyle(
                                    fontSize: 15.0,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Text(
                          'كم عدد الابناء البنات',
                          style: TextStyle(
                              fontFamily: "Cairo",
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0),
                        ),
                        Container(
                          height: 70.0,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: Colors.grey[100],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    InkWell(
                                        onTap: () {
                                          setState(() {
                                            c++;
                                          });
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Icon(Icons.arrow_drop_up,
                                              color: Colors.grey, size: 28),
                                        )),
                                    SizedBox(
                                      height: 14.0,
                                    ),
                                    InkWell(
                                        onTap: () {
                                          if (c <= 0) {
                                          } else {
                                            setState(() {
                                              c--;
                                            });
                                          }
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Icon(Icons.arrow_drop_down,
                                              color: Colors.grey, size: 28),
                                        )),
                                  ],
                                ),
                                
                                Text(
                                  '$c',
                                  style: TextStyle(
                                    fontSize: 15.0,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Text(
                          'كم عدد ابناء الابناء',
                          style: TextStyle(
                              fontFamily: "Cairo",
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0),
                        ),
                        Container(
                          height: 70.0,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: Colors.grey[100],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    InkWell(
                                        onTap: () {
                                          setState(() {
                                            child++;
                                          });
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Icon(Icons.arrow_drop_up,
                                              color: Colors.grey, size: 28),
                                        )),
                                    SizedBox(
                                      height: 14.0,
                                    ),
                                    InkWell(
                                        onTap: () {
                                          if (child <= 0) {
                                          } else {
                                            setState(() {
                                              child--;
                                            });
                                          }
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Icon(Icons.arrow_drop_down,
                                              color: Colors.grey, size: 28),
                                        )),
                                  ],
                                ),
                                
                                Text(
                                  '$child',
                                  style: TextStyle(
                                    fontSize: 15.0,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Text(
                          'كم عدد بنات الابناء',
                          style: TextStyle(
                              fontFamily: "Cairo",
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0),
                        ),
                        Container(
                          height: 70.0,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: Colors.grey[100],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    InkWell(
                                        onTap: () {
                                          setState(() {
                                            girl++;
                                          });
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Icon(Icons.arrow_drop_up,
                                              color: Colors.grey, size: 28),
                                        )),
                                    SizedBox(
                                      height: 14.0,
                                    ),
                                    InkWell(
                                        onTap: () {
                                          if (girl <= 0) {
                                          } else {
                                            setState(() {
                                              girl--;
                                            });
                                          }
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Icon(Icons.arrow_drop_down,
                                              color: Colors.grey, size: 28),
                                        )),
                                  ],
                                ),
                                
                                Text(
                                  '$girl',
                                  style: TextStyle(
                                    fontSize: 15.0,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Text(
                          'كم عدد الاخوة الاشقاء',
                          style: TextStyle(
                              fontFamily: "Cairo",
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0),
                        ),
                        Container(
                          height: 70.0,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: Colors.grey[100],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    InkWell(
                                        onTap: () {
                                          setState(() {
                                            pro++;
                                          });
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Icon(Icons.arrow_drop_up,
                                              color: Colors.grey, size: 28),
                                        )),
                                    SizedBox(
                                      height: 14.0,
                                    ),
                                    InkWell(
                                        onTap: () {
                                          if (pro <= 0) {
                                          } else {
                                            setState(() {
                                              pro--;
                                            });
                                          }
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Icon(Icons.arrow_drop_down,
                                              color: Colors.grey, size: 28),
                                        )),
                                  ],
                                ),
                                
                                Text(
                                  '$pro',
                                  style: TextStyle(
                                    fontSize: 15.0,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Text(
                          'كم عدد الاخوات الاشقاء',
                          style: TextStyle(
                              fontFamily: "Cairo",
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0),
                        ),
                        Container(
                          height: 70.0,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: Colors.grey[100],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    InkWell(
                                        onTap: () {
                                          setState(() {
                                            sis++;
                                          });
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Icon(Icons.arrow_drop_up,
                                              color: Colors.grey, size: 28),
                                        )),
                                    SizedBox(
                                      height: 14.0,
                                    ),
                                    InkWell(
                                        onTap: () {
                                          if (sis <= 0) {
                                          } else {
                                            setState(() {
                                              sis--;
                                            });
                                          }
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Icon(Icons.arrow_drop_down,
                                              color: Colors.grey, size: 28),
                                        )),
                                  ],
                                ),
                                Text(
                                  '$sis',
                                  style: TextStyle(
                                    fontSize: 15.0,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 40.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 59.0,
                              width: 140,
                              decoration: BoxDecoration(
                                color: Colors.grey[100],
                                borderRadius: BorderRadius.circular(15.0),
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
                            SizedBox(
                              width: 30.0,
                            ),
                            Container(
                              height: 59.0,
                              width: 140,
                              decoration: BoxDecoration(
                                color: fontColor,
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: MaterialButton(
                                onPressed: () {
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
                                                Text(
                                                  'اضافة اسماء الورثة',
                                                  style: TextStyle(
                                                      fontFamily: "Cairo",
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 23.0),
                                                ),
                                              ],
                                            ),
                                            content: Container(
                                              height: 240.0,
                                              width: 300.0,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(50.0),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 8.0),
                                                child: Directionality(
                                                  textDirection:
                                                      TextDirection.rtl,
                                                  child: SingleChildScrollView(
                                                    child: Column(
                                                      children: [
                                                        Row(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .end,
                                                          children: [
                                                            Text(
                                                              'المتوفي',
                                                              style: TextStyle(
                                                                  fontFamily:
                                                                      "Cairo",
                                                                  color: Colors
                                                                      .black,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize:
                                                                      20.0),
                                                            ),
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          height: 15.0,
                                                        ),
                                                        TextFormField(
                                                            controller: dead,
                                                            keyboardType:
                                                                TextInputType
                                                                    .emailAddress,
                                                            decoration:
                                                                InputDecoration(
                                                              enabledBorder:
                                                                  OutlineInputBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            20),
                                                              ),
                                                              hintText:
                                                                  'من فضلك ادخل اسم المتوفي',
                                                            ),
                                                            onChanged: (value) {
                                                              print(value);
                                                            }),
                                                        SizedBox(
                                                          height: 20.0,
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Container(
                                                              height: 59.0,
                                                              width: 100.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color:
                                                                    fontColor,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            15.0),
                                                              ),
                                                              child:
                                                                  MaterialButton(
                                                                onPressed: () {
                                                                  if (dead.text
                                                                          .trim() !=
                                                                      "") {
                                                                    Navigator.push(
                                                                        context,
                                                                        MaterialPageRoute(
                                                                          builder: (context) => Solution(
                                                                              widget.wealth,
                                                                              widget.husband,
                                                                              widget.wives,
                                                                              counter,
                                                                              c,
                                                                              widget.father,
                                                                              widget.mother,
                                                                              widget.grandfather,
                                                                              child,
                                                                              girl,
                                                                              sis,
                                                                              pro,
                                                                              dead.text.trim()),
                                                                        ));
                                                                  } else {
                                                                    toast(
                                                                        "من فضلك ادخل اسم المتوفي ثلاثي");
                                                                  }
                                                                },
                                                                child: Text(
                                                                  'اضافة',
                                                                  style: TextStyle(
                                                                      fontFamily:
                                                                          "Cairo",
                                                                      color: Colors
                                                                          .white,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontSize:
                                                                          20.0),
                                                                ),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width: 10.0,
                                                            ),
                                                            Container(
                                                              height: 59.0,
                                                              width: 100.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Colors
                                                                    .grey[100],
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            15.0),
                                                                border: Border.all(
                                                                    color:
                                                                        fontColor),
                                                              ),
                                                              child:
                                                                  MaterialButton(
                                                                onPressed: () {
                                                                  Navigator.pop(
                                                                      context);
                                                                },
                                                                child: Text(
                                                                  'الغاء',
                                                                  style: TextStyle(
                                                                      fontFamily:
                                                                          "Cairo",
                                                                      color:
                                                                          fontColor,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontSize:
                                                                          20.0),
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
                                child: Text(
                                  'التالي',
                                  style: TextStyle(
                                      fontFamily: "Cairo",
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
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
