import 'package:flutter/material.dart';
import '../Services/MenuDialog.dart';
import '../modules/Chat.dart';
import '../modules/colors.dart';
import '../modules/connect.dart';
import '../modules/mwareth.dart';

class Mother extends StatefulWidget {
  final double wealth;
  final int wives;
  final int husband;
  final bool father;

  Mother(this.wealth, this.wives, this.husband, this.father);
  @override
  State<Mother> createState() => _MotherState();
}

class _MotherState extends State<Mother> {
  bool mother = false;
  bool grandFather = false;

  bool border = false;
  var money = TextEditingController();
  bool mon = false;
  bool felo = false;
  bool bebo = false;
  bool live = false;
  bool die = false;
  bool livee = false;
  bool diee = false;
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
                      height: 50.0,
                    ),
                    Directionality(
                      textDirection: TextDirection.rtl,
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.topRight,
                            child: Text(
                              'حالة الام',
                              style: TextStyle(
                                  fontFamily: "Cairo",
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 23.0),
                            ),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () {
                                  if (live == true) {
                                    mother = false;
                                    setState(() {
                                      live = false;
                                      die = false;
                                    });
                                  } else {
                                    setState(() {
                                      mother = true;
                                      live = true;
                                      die = false;
                                    });
                                  }
                                },
                                child: Container(
                                  height: 106.0,
                                  width: 140,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.0),
                                    color: live ? fontColor : Colors.white,
                                    border: Border.all(color: fontColor),
                                  ),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 20.0),
                                        child: Text(
                                          'حي',
                                          style: TextStyle(
                                              fontFamily: "Cairo",
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 28.0),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 23.0,
                              ),
                              InkWell(
                                onTap: () {
                                  if (die == true) {
                                    mother = false;
                                    setState(() {
                                      die = false;
                                      live = false;
                                    });
                                  } else {
                                    setState(() {
                                      mother = false;
                                      die = true;
                                      live = false;
                                    });
                                  }
                                },
                                child: Container(
                                  height: 106.0,
                                  width: 140,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.0),
                                    color: die ? fontColor : Colors.white,
                                    border: Border.all(color: fontColor),
                                  ),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 20.0),
                                        child: Text(
                                          'ميت',
                                          style: TextStyle(
                                              fontFamily: "Cairo",
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 25.0),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: Text(
                              'حالة الجد',
                              style: TextStyle(
                                  fontFamily: "Cairo",
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 23.0),
                            ),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () {
                                  if (livee == true) {
                                    grandFather = false;
                                    setState(() {
                                      livee = false;
                                      diee = false;
                                    });
                                  } else {
                                    setState(() {
                                      grandFather = true;
                                      livee = true;
                                      diee = false;
                                    });
                                  }
                                },
                                child: Container(
                                  height: 106.0,
                                  width: 140,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.0),
                                    color: livee ? fontColor : Colors.white,
                                    border: Border.all(color: fontColor),
                                  ),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 20.0),
                                        child: Text(
                                          'حي',
                                          style: TextStyle(
                                              fontFamily: "Cairo",
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 28.0),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 23.0,
                              ),
                              InkWell(
                                onTap: () {
                                  if (diee == true) {
                                    setState(() {
                                      grandFather = false;
                                      diee = false;
                                      livee = false;
                                    });
                                  } else {
                                    setState(() {
                                      grandFather = false;
                                      diee = true;
                                      livee = false;
                                    });
                                  }
                                },
                                child: Container(
                                  height: 106.0,
                                  width: 140,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.0),
                                    color: diee ? fontColor : Colors.white,
                                    border: Border.all(color: fontColor),
                                  ),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 20.0),
                                        child: Text(
                                          'ميت',
                                          style: TextStyle(
                                              fontFamily: "Cairo",
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 25.0),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 190.0,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 59.0,
                                  width: 140,
                                  decoration: BoxDecoration(
                                    color: fontColor,
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  child: MaterialButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => Mwareeth(
                                                widget.wealth,
                                                widget.husband,
                                                widget.wives,
                                                widget.father,
                                                mother,
                                                grandFather),
                                          ));
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
                                SizedBox(
                                  width: 20.0,
                                ),
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
                              ],
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
