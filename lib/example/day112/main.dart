// React에서의 Router 역할

import 'package:app_flutter/example/day112/pages/Detail.dart';
import 'package:app_flutter/example/day112/pages/Home.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
} // main end

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      routes: {
        // "경로" : (context) => 위젯명(),
        "/" : (context) => Home(),
        "/detail" : (context) => Detail()
      },
    );
  } // build end
} // class end