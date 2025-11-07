import 'package:app_flutter/example/task/task04/pages/FindAllPage.dart';
import 'package:app_flutter/example/task/task04/pages/HomePage.dart';
import 'package:app_flutter/example/task/task04/pages/MainPage.dart';
import 'package:app_flutter/example/task/task04/pages/SavePage.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
} // main end

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",    // 앱을 시작하는 최초 경로
      routes: {
        "/" : (context) => MainPage(),
        "/home" : (context) => HomePage(),
        "/save" : (context) => SavePage(),
        "/findAll" : (context) => FindAllPage()
      },
    );
  } // build end
} // class end