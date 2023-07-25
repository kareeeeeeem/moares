import 'package:flutter/material.dart';
import '../Services/MenuDialog.dart';
import '../Services/toast.dart';
import '../modules/Chat.dart';
import '../modules/colors.dart';
import '../modules/connect.dart';
import '../modules/solution.dart';

class SpecialCases extends StatefulWidget {
  final double wealth;
  SpecialCases(this.wealth);

  @override
  State<SpecialCases> createState() => _SpecialCasesState();
}

class _SpecialCasesState extends State<SpecialCases> {
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

  int wives = 0;
  int husband = 0;

  int father = 0;
  int mother = 0;
  int grandfather = 0;

  int fullSister = 0;
  int fullBrother = 0;
  int paternalGrandMother = 0; // ام الاب
  int maternalGrandMother = 0; // ام الام
  int paternalBrothers = 0; // اخ من الاب
  int paternalSisters = 0; // اخت من الاب
  int maternalBrothers = 0; // اخ من الام
  int maternalSisters = 0; // اخت من الام
  int fullNephews = 0; // ابناء الاخ
  int paternalNephews = 0; // ابن الاخ من الاب
  int fullPaternalUncles = 0; //عم شقيق
  int paternalPaternalUncles = 0; // عم لأب
  int fullCousins = 0; // اولاد عم شقيق
  int paternalCousins = 0; // اولاد عم لاب

  var dead = TextEditingController();

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
                                        )),
                                    SizedBox(
                                      width: 10.0,
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
                                      width: 14.0,
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
                                      width: 14.0,
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
                                      width: 14.0,
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
                                      width: 14.0,
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
                          'كم عدد الاخوه للاب',
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
                                            paternalBrothers++;
                                          });
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Icon(Icons.arrow_drop_up,
                                              color: Colors.grey, size: 28),
                                        )),
                                    SizedBox(
                                      width: 14.0,
                                    ),
                                    InkWell(
                                        onTap: () {
                                          if (paternalBrothers <= 0) {
                                          } else {
                                            setState(() {
                                              paternalBrothers--;
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
                                  '$paternalBrothers',
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
                        Text(
                          'كم عدد الاخوه للأم',
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
                                            maternalBrothers++;
                                          });
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Icon(Icons.arrow_drop_up,
                                              color: Colors.grey, size: 28),
                                        )),
                                    SizedBox(
                                      width: 14.0,
                                    ),
                                    InkWell(
                                        onTap: () {
                                          if (maternalBrothers <= 0) {
                                          } else {
                                            setState(() {
                                              maternalBrothers--;
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
                                  '$maternalBrothers',
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
                        Text(
                          'كم عدد الاخوه الشقيقات',
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
                                      width: 14.0,
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
                        Text(
                          'كم عدد الاخوه الفتيات للاب',
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
                                            paternalSisters++;
                                          });
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Icon(Icons.arrow_drop_up,
                                              color: Colors.grey, size: 28),
                                        )),
                                    SizedBox(
                                      width: 14.0,
                                    ),
                                    InkWell(
                                        onTap: () {
                                          if (paternalSisters <= 0) {
                                          } else {
                                            setState(() {
                                              paternalSisters--;
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
                                  '$paternalSisters',
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
                        Text(
                          'كم عدد الاخوه الفتيات للام',
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
                                            maternalSisters++;
                                          });
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Icon(Icons.arrow_drop_up,
                                              color: Colors.grey, size: 28),
                                        )),
                                    SizedBox(
                                      width: 14.0,
                                    ),
                                    InkWell(
                                        onTap: () {
                                          if (maternalSisters <= 0) {
                                          } else {
                                            setState(() {
                                              maternalSisters--;
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
                                  '$maternalSisters',
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
                        Text(
                          'كم عدد ابن اخ شقيق',
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
                                            fullNephews++;
                                          });
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Icon(Icons.arrow_drop_up,
                                              color: Colors.grey, size: 28),
                                        )),
                                    SizedBox(
                                      width: 14.0,
                                    ),
                                    InkWell(
                                        onTap: () {
                                          if (fullNephews <= 0) {
                                          } else {
                                            setState(() {
                                              fullNephews--;
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
                                  '$fullNephews',
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
                        Text(
                          'كم عدد ابن اخ للاب',
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
                                            paternalNephews++;
                                          });
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Icon(Icons.arrow_drop_up,
                                              color: Colors.grey, size: 28),
                                        )),
                                    SizedBox(
                                      width: 14.0,
                                    ),
                                    InkWell(
                                        onTap: () {
                                          if (paternalNephews <= 0) {
                                          } else {
                                            setState(() {
                                              paternalNephews--;
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
                                  '$paternalNephews',
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
                        Text(
                          'كم عدد عم شقيق',
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
                                            fullPaternalUncles++;
                                          });
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Icon(Icons.arrow_drop_up,
                                              color: Colors.grey, size: 28),
                                        )),
                                    SizedBox(
                                      width: 14.0,
                                    ),
                                    InkWell(
                                        onTap: () {
                                          if (fullPaternalUncles <= 0) {
                                          } else {
                                            setState(() {
                                              fullPaternalUncles--;
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
                                  '$fullPaternalUncles',
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
                        Text(
                          'كم عدد عم للاب',
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
                                            paternalPaternalUncles++;
                                          });
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Icon(Icons.arrow_drop_up,
                                              color: Colors.grey, size: 28),
                                        )),
                                    SizedBox(
                                      width: 14.0,
                                    ),
                                    InkWell(
                                        onTap: () {
                                          if (paternalPaternalUncles <= 0) {
                                          } else {
                                            setState(() {
                                              paternalPaternalUncles--;
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
                                  '$paternalPaternalUncles',
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
                        Text(
                          'كم عدد أبن عم شقيق',
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
                                            fullCousins++;
                                          });
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Icon(Icons.arrow_drop_up,
                                              color: Colors.grey, size: 28),
                                        )),
                                    SizedBox(
                                      width: 14.0,
                                    ),
                                    InkWell(
                                        onTap: () {
                                          if (fullCousins <= 0) {
                                          } else {
                                            setState(() {
                                              fullCousins--;
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
                                  '$fullCousins',
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
                        Text(
                          'كم عدد أبن عم للاب',
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
                                            paternalCousins++;
                                          });
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Icon(Icons.arrow_drop_up,
                                              color: Colors.grey, size: 28),
                                        )),
                                    SizedBox(
                                      width: 14.0,
                                    ),
                                    InkWell(
                                        onTap: () {
                                          if (paternalCousins <= 0) {
                                          } else {
                                            setState(() {
                                              paternalCousins--;
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
                                  '$paternalCousins',
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
                        Text(
                          'أب',
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
                                            father++;
                                          });
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Icon(Icons.arrow_drop_up,
                                              color: Colors.grey, size: 28),
                                        )),
                                    SizedBox(
                                      width: 14.0,
                                    ),
                                    InkWell(
                                        onTap: () {
                                          if (father <= 0) {
                                          } else {
                                            setState(() {
                                              father--;
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
                                  '$father',
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
                        Text(
                          'أم',
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
                                            mother++;
                                          });
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Icon(Icons.arrow_drop_up,
                                              color: Colors.grey, size: 28),
                                        )),
                                    SizedBox(
                                      width: 14.0,
                                    ),
                                    InkWell(
                                        onTap: () {
                                          if (mother <= 0) {
                                          } else {
                                            setState(() {
                                              mother--;
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
                                  '$mother',
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
                        Text(
                          'جد',
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
                                            grandfather++;
                                          });
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Icon(Icons.arrow_drop_up,
                                              color: Colors.grey, size: 28),
                                        )),
                                    SizedBox(
                                      width: 14.0,
                                    ),
                                    InkWell(
                                        onTap: () {
                                          if (grandfather <= 0) {
                                          } else {
                                            setState(() {
                                              grandfather--;
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
                                  '$grandfather',
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
                        Text(
                          ' أم ألاب',
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
                                            paternalGrandMother++;
                                          });
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Icon(Icons.arrow_drop_up,
                                              color: Colors.grey, size: 28),
                                        )),
                                    SizedBox(
                                      width: 14.0,
                                    ),
                                    InkWell(
                                        onTap: () {
                                          if (paternalGrandMother <= 0) {
                                          } else {
                                            setState(() {
                                              paternalGrandMother--;
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
                                  '$paternalGrandMother',
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
                        Text(
                          ' أم  ألام',
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
                                            maternalGrandMother++;
                                          });
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Icon(Icons.arrow_drop_up,
                                              color: Colors.grey, size: 28),
                                        )),
                                    SizedBox(
                                      width: 14.0,
                                    ),
                                    InkWell(
                                        onTap: () {
                                          if (maternalGrandMother <= 0) {
                                          } else {
                                            setState(() {
                                              maternalGrandMother--;
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
                                  '$maternalGrandMother',
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
                        Text(
                          'الزوجات',
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
                                            wives++;
                                          });
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Icon(Icons.arrow_drop_up,
                                              color: Colors.grey, size: 28),
                                        )),
                                    SizedBox(
                                      width: 14.0,
                                    ),
                                    InkWell(
                                        onTap: () {
                                          if (wives <= 0) {
                                          } else {
                                            setState(() {
                                              wives--;
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
                                  '$wives',
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
                        Text(
                          'الزوج',
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
                                            husband++;
                                          });
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Icon(Icons.arrow_drop_up,
                                              color: Colors.grey, size: 28),
                                        )),
                                    SizedBox(
                                      width: 14.0,
                                    ),
                                    InkWell(
                                        onTap: () {
                                          if (husband <= 0) {
                                          } else {
                                            setState(() {
                                              husband--;
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
                                  '$husband',
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
                          height: 20.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              height: 59.0,
                              width: 130.0,
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
                              width: 20.0,
                            ),
                            Container(
                              height: 59.0,
                              width: 140.0,
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
                                              height: 540.0,
                                              width: 342.0,
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
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Container(
                                                              height: 59.0,
                                                              width: 110.0,
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
                                                                    if ((husband >
                                                                                1 &&
                                                                            wives ==
                                                                                0) ||
                                                                        (wives >
                                                                                1 &&
                                                                            wives <
                                                                                5 &&
                                                                            husband ==
                                                                                0) ||
                                                                        (husband ==
                                                                                0 &&
                                                                            wives ==
                                                                                0)) {
                                                                      Navigator.push(
                                                                          context,
                                                                          MaterialPageRoute(
                                                                            builder: (context) =>
                                                                                Solution(
                                                                              widget.wealth,
                                                                              husband > 1 && wives == 0 ? 1 : husband,
                                                                              wives,
                                                                              counter,
                                                                              c,
                                                                              father > 0,
                                                                              mother > 0,
                                                                              grandfather > 0,
                                                                              child,
                                                                              girl,
                                                                              sis,
                                                                              pro,
                                                                              dead.text.trim(),
                                                                              paternalGrandMother,
                                                                              maternalGrandMother,
                                                                              paternalBrothers,
                                                                              paternalSisters,
                                                                              maternalBrothers,
                                                                              maternalSisters,
                                                                              fullNephews,
                                                                              paternalNephews,
                                                                              fullPaternalUncles,
                                                                              paternalPaternalUncles,
                                                                              fullCousins,
                                                                              paternalCousins,
                                                                            ),
                                                                          ));
                                                                    } else {
                                                                      toast(
                                                                          "من فضلك ادخل زوج او عدد زوجات صحيح");
                                                                    }
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
                                                              width: 15.0,
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
                                                                  Navigator.pop(context);
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
