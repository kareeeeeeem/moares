import 'package:flutter/material.dart';
import '../Services/MenuDialog.dart';
import '../modules/Chat.dart';
import '../modules/colors.dart';

class Connect extends StatelessWidget {
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
                    Center(
                      child: Text(
                        'تواصل معنا',
                        style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40.0,
                    ),
                    Container(
                      height: 206.0,
                      width: 342.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(35.0),
                        color: Colors.grey[200],
                        border: Border.all(color: fontColor),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            Text(
                              'شبكات التواصل',
                              style: TextStyle(
                                  color: fontColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 21.0),
                            ),
                            SizedBox(
                              height: 60.0,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15.0),
                              child: Row(
                                children: [
                                  InkWell(
                                      onTap: () {},
                                      child: Image(
                                        image: AssetImage(
                                            'assets/images/face.png'),
                                      )),
                                  SizedBox(
                                    width: 55,
                                  ),
                                  InkWell(
                                      onTap: () {},
                                      child: Image(
                                        image: AssetImage(
                                            'assets/images/google.png'),
                                      )),
                                  SizedBox(
                                    width: 55,
                                  ),
                                  InkWell(
                                      onTap: () {},
                                      child: Image(
                                        image: AssetImage(
                                            'assets/images/twitter.png'),
                                      )),
                                ],
                              ),
                            ),
                          ],
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
