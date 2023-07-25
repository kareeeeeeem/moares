import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'Admin/AdminHomePage.dart';
import 'cubit/bloc.dart';
import 'cubit/states.dart';
import 'modules/Chat.dart';
import 'modules/LoginPage.dart';
import 'modules/mwareth.dart';

import 'modules/colors.dart';
import 'modules/splash.dart';
import 'modules/start.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init('dataBox2');

  Widget widget;
  widget = LoginPage();
   runApp(MyApp(
        //isdark: isDark,
        startwidget: widget,
      ));
}
class MyApp extends StatelessWidget {
  final Widget startwidget;

  MyApp({
    //this.isdark,
    required this.startwidget,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => AppCubit()..initDataBox(),
        ),
      ],
      child: BlocConsumer<AppCubit, AppStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(primaryColor: fontColor),
              home: SplashScreen(),
            );
          }),
    );
  }
}
