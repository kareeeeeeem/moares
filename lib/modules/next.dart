import 'package:flutter/material.dart';
import '../Services/MenuDialog.dart';
import '../modules/Chat.dart';
import '../modules/colors.dart';
import '../modules/connect.dart';
import '../modules/die.dart';

class Example extends StatefulWidget {
  final double wealth;
  Example(this.wealth);

  @override
  State<Example> createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  bool border = false;
  bool mon = false;
  bool felo = false;
  bool bebo = false;
  bool co1 = false;
  bool co2 = false;
  bool co3 = false;
  bool co4 = false;
  bool co5 = false;

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
                      height: 65.0,
                    ),
                    Text(
                      'كم عدد الزوجات؟',
                      style: TextStyle(
                          fontFamily: "Cairo",
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 25.0),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Text(
                      'اختر عدد الزوجات لديك',
                      style: TextStyle(
                          fontFamily: "Cairo",
                          color: Colors.grey,
                          fontSize: 14.0),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            if (co1 == true) {
                              setState(() {
                                co1 = false;
                                co2 = false;
                                co3 = false;
                                co4 = false;
                                co5 = false;
                              });
                            } else {
                              setState(() {
                                co1 = true;
                                co2 = false;
                                co3 = false;
                                co4 = false;
                                co5 = false;
                              });
                            }
                          },
                          child: Container(
                            width: 55.0,
                            height: 57.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              color: co1 ? fontColor : Colors.white,
                            ),
                            child: Center(
                              child: Text(
                                '0',
                                style: TextStyle(
                                    fontFamily: "Cairo",
                                    color: co1 ? Colors.white : Colors.black,
                                    fontSize: 14.0),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 6.0,
                        ),
                        InkWell(
                          onTap: () {
                            if (co2 == true) {
                              setState(() {
                                co2 = false;
                                co1 = false;
                                co3 = false;
                                co4 = false;
                                co5 = false;
                              });
                            } else {
                              setState(() {
                                co2 = true;
                                co1 = false;
                                co3 = false;
                                co4 = false;
                                co5 = false;
                              });
                            }
                          },
                          child: Container(
                            width: 55.0,
                            height: 57.0,
                            decoration: BoxDecoration(
                              color: co2 ? fontColor : Colors.white,
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Center(
                              child: Text(
                                '1',
                                style: TextStyle(
                                    fontFamily: "Cairo",
                                    color: co2 ? Colors.white : Colors.black,
                                    fontSize: 14.0),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 6.0,
                        ),
                        InkWell(
                          onTap: () {
                            if (co3 == true) {
                              setState(() {
                                co3 = false;
                                co1 = false;
                                co2 = false;
                                co4 = false;
                                co5 = false;
                              });
                            } else {
                              setState(() {
                                co3 = true;
                                co1 = false;
                                co2 = false;
                                co4 = false;
                                co5 = false;
                              });
                            }
                          },
                          child: Container(
                            width: 55.0,
                            height: 57.0,
                            decoration: BoxDecoration(
                              color: co3 ? fontColor : Colors.white,
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Center(
                              child: Text(
                                '2',
                                style: TextStyle(
                                    fontFamily: "Cairo",
                                    color: co3 ? Colors.white : Colors.black,
                                    fontSize: 14.0),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 6.0,
                        ),
                        InkWell(
                          onTap: () {
                            if (co4 == true) {
                              setState(() {
                                co4 = false;
                                co1 = false;
                                co2 = false;
                                co3 = false;
                                co5 = false;
                              });
                            } else {
                              setState(() {
                                co4 = true;
                                co1 = false;
                                co2 = false;
                                co3 = false;
                                co5 = false;
                              });
                            }
                          },
                          child: Container(
                            width: 55.0,
                            height: 57.0,
                            decoration: BoxDecoration(
                              color: co4 ? fontColor : Colors.white,
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Center(
                              child: Text(
                                '3',
                                style: TextStyle(
                                    fontFamily: "Cairo",
                                    color: co4 ? Colors.white : Colors.black,
                                    fontSize: 14.0),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 6.0,
                        ),
                        InkWell(
                          onTap: () {
                            if (co5 == true) {
                              setState(() {
                                co5 = false;
                                co1 = false;
                                co2 = false;
                                co3 = false;
                                co4 = false;
                              });
                            } else {
                              setState(() {
                                co5 = true;
                                co1 = false;
                                co2 = false;
                                co3 = false;
                                co4 = false;
                              });
                            }
                          },
                          child: Container(
                            width: 55.0,
                            height: 57.0,
                            decoration: BoxDecoration(
                              color: co5 ? fontColor : Colors.white,
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Center(
                              child: Text(
                                '4',
                                style: TextStyle(
                                    fontFamily: "Cairo",
                                    color: co5 ? Colors.white : Colors.black,
                                    fontSize: 14.0),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 365,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
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
                                int wives = 0;
                                if(co1){
                                  wives = 0;
                                }
                                else if(co2){
                                  wives = 1;
                                }
                                else if(co3){
                                  wives = 2;
                                }
                                else if(co4){
                                  wives = 3;
                                }
                                else if(co5){
                                  wives = 4;
                                }
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Die(widget.wealth,wives),
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
