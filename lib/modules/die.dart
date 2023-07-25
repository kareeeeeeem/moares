import 'package:flutter/material.dart';
import '../Services/MenuDialog.dart';
import '../modules/Chat.dart';
import '../modules/colors.dart';
import '../modules/connect.dart';
import '../modules/mother.dart';

class Die extends StatefulWidget {
  final double wealth;
  final int wives;
  Die(this.wealth, this.wives);

  @override
  State<Die> createState() => _DieState();
}

class _DieState extends State<Die> {
  int husband = 0;
  bool father = false;

  bool border = false;

  var money = TextEditingController();

  bool mon = false;

  bool felo = false;

  bool bebo = false;
  bool male = false;
  bool female = false;
  bool live = false;
  bool die = false;

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
                              'نوع المتوفي',
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
                                  if (male == true) {
                                    setState(() {
                                      husband = 0;
                                      male = false;
                                      female = false;
                                    });
                                  } else {
                                    setState(() {
                                      husband = 0;
                                      male = true;
                                      female = false;
                                    });
                                  }
                                },
                                child: Container(
                                  height: 106.0,
                                  width: 140.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.0),
                                    color: male ? fontColor : Colors.white,
                                    border: Border.all(color: fontColor),
                                  ),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 8.0),
                                        child: Image(
                                          image: AssetImage(
                                              'assets/images/male.png'),
                                          color: fontColor,
                                        ),
                                      ),
                                      Text(
                                        'ذكر',
                                        style: TextStyle(
                                            fontFamily: "Cairo",
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 22.0),
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
                                  if (female == true) {
                                    setState(() {
                                      husband = 0;
                                      female = false;
                                      male = false;
                                    });
                                  } else {
                                    setState(() {
                                      husband = 1;
                                      female = true;
                                      male = false;
                                    });
                                  }
                                },
                                child: Container(
                                  height: 106.0,
                                  width: 140.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.0),
                                    color: female ? fontColor : Colors.white,
                                    border: Border.all(color: fontColor),
                                  ),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 5.0),
                                        child: Image(
                                          image: AssetImage(
                                              'assets/images/fema.png'),
                                        ),
                                      ),
                                      Text(
                                        'انثي',
                                        style: TextStyle(
                                            fontFamily: "Cairo",
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 21.0),
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
                              'حالة الاب',
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
                                    setState(() {
                                      father = false;
                                      live = false;
                                      die = false;
                                    });
                                  } else {
                                    setState(() {
                                      father = true;
                                      live = true;
                                      die = false;
                                    });
                                  }
                                },
                                child: Container(
                                  height: 106.0,
                                  width: 140.0,
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
                                    setState(() {
                                      father = false;
                                      die = false;
                                      live = false;
                                    });
                                  } else {
                                    setState(() {
                                      father = false;
                                      die = true;
                                      live = false;
                                    });
                                  }
                                },
                                child: Container(
                                  height: 106.0,
                                  width: 140.0,
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
                                  width: 140.0,
                                  decoration: BoxDecoration(
                                    color: fontColor,
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  child: MaterialButton(
                                    onPressed: () {
                                      int wife = widget.wives;
                                      if (husband == 1) {
                                        wife = 0;
                                      }
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => Mother(
                                                widget.wealth,
                                                wife,
                                                husband,
                                                father),
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
                                  width: 140.0,
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
