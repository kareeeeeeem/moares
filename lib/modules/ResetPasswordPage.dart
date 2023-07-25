import 'package:flutter/material.dart';
import '../modules/LoginPage.dart';
import '../modules/colors.dart';

class ResetPasswordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Icon(
                  Icons.arrow_back_ios_new_sharp,
                  size: 30,
                  color: Colors.blue,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'اعاده تعيين كلمه المرور',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Image(
              image: AssetImage("assets/images/fivephoto.png"),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                '  تاكد من ان كلمه مرورك الجديده يجب ان تكون مختلفه عن كلمه المرور السابقه',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock),
                hintText: 'كلمة المرور',
              ),
            ),
            SizedBox(height: 20.0),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'تأكيد كلمة المرور',
                prefixIcon: Icon(Icons.lock),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (context) {
                      return StatefulBuilder(builder: (context, nsetState) {
                        return AlertDialog(
                          backgroundColor: Colors.white,
                          actionsAlignment: MainAxisAlignment.center,
                          title: Padding(
                            padding: EdgeInsetsDirectional.all(5.0),
                          ),
                          content: Container(
                            height: 340.0,
                            width: 270.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: Directionality(
                                textDirection: TextDirection.rtl,
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      Image(
                                          image: AssetImage(
                                              'assets/images/group.png')),
                                      SizedBox(
                                        height: 8.0,
                                      ),
                                      Text(
                                        'تهانينا !',
                                        style: TextStyle(
                                          fontSize: 19.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                      Text(
                                        'تم تغيير كلمة المرور الخاصة بك.الرجاء تسجيل الدخول مرة اخري باستخدام كلمة مرور جديدة ',
                                        style: TextStyle(
                                          fontSize: 18.0,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10.0,
                                      ),
                                      Center(
                                        child: MaterialButton(
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      LoginPage(),
                                                ));
                                          },
                                          child: Text(
                                            'تسجيل دخول',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: fontColor,
                                                fontSize: 20.0),
                                          ),
                                        ),
                                      )
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
              child: const Text('نسيت كلمه المرور؟'),
            ),
          ],
        ),
      ),
    );
  }
}
