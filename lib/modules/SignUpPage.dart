import 'package:flutter/material.dart';
import 'package:graduation_project/modules/LoginPage.dart';
import '../Services/Login&SignUp.dart';


import 'colors.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  var name = TextEditingController();
  var phone = TextEditingController();
  var email = TextEditingController();
  var password = TextEditingController();

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
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 50.0,
                    ),
                    Image(
                      // assets/images/male.png
                      image: AssetImage("assets/images/secondphoto.png"),
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    Text(
                      'تسجيل حساب جديد',
                      style: TextStyle(
                        fontSize: 30.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        height: 70.0,
                        width: 315.0,
                        child: TextFormField(
                            controller: name,
                            decoration: InputDecoration(
                              hintText: 'الاسم',
                              suffixIcon: Icon(
                                Icons.person,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.grey,
                                ),
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                            )),
                      ),
                    ),
                    SizedBox(
                      height: 12.0,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        height: 70.0,
                        width: 315.0,
                        child: TextFormField(
                            controller: phone,
                            decoration: InputDecoration(
                              hintText: 'رقم الهاتف',
                              suffixIcon: Icon(
                                Icons.phone,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.grey,
                                ),
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                            )),
                      ),
                    ),
                    SizedBox(
                      height: 12.0,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        height: 70.0,
                        width: 315.0,
                        child: TextFormField(
                            controller: email,
                            decoration: InputDecoration(
                              hintText: 'البريد الالكتروني',
                              suffixIcon: Icon(
                                Icons.email,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.grey,
                                ),
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                            )),
                      ),
                    ),
                    SizedBox(
                      height: 12.0,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        height: 80.0,
                        width: 315.0,
                        child: TextFormField(
                            controller: password,
                            decoration: InputDecoration(
                              hintText: 'كلمة المرور',
                              suffixIcon: Icon(
                                Icons.lock,
                              ),
                              prefixIcon: Icon(
                                Icons.remove_red_eye,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.grey,
                                ),
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                            )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 59.0,
                            width: 150.0,
                            decoration: BoxDecoration(
                              color: fontColor,
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: MaterialButton(
                              onPressed: () {
                               signUpData(context, email.text.trim(), password.text.trim(), name.text.trim(), phone.text.trim());
                              },
                              child: Text(
                                'التسجيل',
                                style: TextStyle(
                                    fontFamily: "Cairo",
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => LoginPage(),
                                  ));
                            },
                            child: Text(
                              'تسجيل الدخول',
                              style: TextStyle(
                                fontSize: 18.0,
                                color: fontColor,
                              ),
                            )),
                        Text(
                          'لديك حساب بالفعل؟',
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5.0,
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
