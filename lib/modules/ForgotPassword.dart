import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../Services/MenuDialog.dart';
import '../Services/toast.dart';
import '../modules/Chat.dart';
import '../modules/LoginPage.dart';
import '../modules/colors.dart';
import '../modules/connect.dart';
import '../modules/next.dart';

import '../main.dart';
import 'SpecialCases.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  var email = TextEditingController();
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
                    Container(
                      margin: EdgeInsets.only(top: 40),
                      child: Row(
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
                                child: Icon(
                                  Icons.arrow_back,
                                  color: fontColor,
                                )),
                          ),
                          Spacer(),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 35.0,
                    ),
                    Text(
                      'اعادة ضبط كلمة المرور',
                      style: TextStyle(
                          fontFamily: "Cairo",
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 30.0),
                    ),
                        Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: Text(
                        'لا تقلق ! يحدث ذلك. الرجاء ادخال البريد الالكتروني المسجل لدينا مسبقاً وسيتم ارسال رابط لاعادة ضبط كلمة مرورك',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Directionality(
                      textDirection: TextDirection.rtl,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 5.0,
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Container(
                              height: 80.0,
                              width: 325.0,
                              child: TextFormField(
                                  controller: email,
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: InputDecoration(
                                    hintText:
                                        'ادخل بريدك الالكتروني لاعادة ضبط كلمة المرور',
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.grey,
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
                      height: 20.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Column(
                        children: [
                          Container(
                            height: 59.0,
                            width: 140.0,
                            decoration: BoxDecoration(
                              color: fontColor,
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: MaterialButton(
                              onPressed: () async {
                                try{
                                await FirebaseAuth.instance.sendPasswordResetEmail(email: email.text.trim()).then((value){
                                  toast("تم ارسال الايميل بنجاح");
                                  Navigator.pop(context);
                                });
                                }on FirebaseAuthException catch (e) {
                                  toast(e.toString());
                                }on Exception catch (exception) {
                                  print(exception);
                                  toast( "$exception");
                                }
                                catch(e){
                                  toast(e.toString());
                                }
                              },
                              child: Text(
                                'ارسال',
                                style: TextStyle(
                                    fontFamily: "Cairo",
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 8,
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
