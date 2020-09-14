import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simpleshop/screens/home.dart';
import 'package:simpleshop/screens/questions/questions.dart';

import 'models/server.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
//    ScreenUtil.init(context, width: 375, height: 812);
//      return MaterialApp(
//        debugShowCheckedModeBanner: false,
//        title: 'Flutter_ScreenUtil',
//        theme: ThemeData(
//          primarySwatch: Colors.blue,
//        ),
//        home: Home(),
//      );
    return MultiProvider(
      providers: [
        Provider<ServerRepository>(
          create: (_) => ServerRepository(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primaryColor: Color(0xFF87B26A),
        ),
        home: Questions(),
      ),
    );
  }
}



