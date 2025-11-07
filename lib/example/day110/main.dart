import 'package:app_flutter/example/day110/pages/HomePage.dart';
import 'package:app_flutter/example/day110/pages/InfoPage.dart';
import 'package:app_flutter/example/day110/pages/MainPage.dart';
import 'package:app_flutter/example/day110/pages/SettingPage.dart';
import 'package:flutter/material.dart';

void main(){        // Flutter 프로그램 실행 시작점
  runApp(MyApp());  // runApp() : Flutter 앱을 시작하는 함수
                    // MyApp() : 내가 만든 최초 위젯
} // main end

// 앱 전체의 루트 위젯 정의
class MyApp extends StatelessWidget{
  // StatelessWidget : 상태가 없는 위젯으로부터 상속받기
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",    // 앱을 시작하는 최초 경로 지정
                            // routes: {"경로명" : (context) => 위젯명()},
      routes: {             // 경로와 해당 위젯을 연결하는 Map 구조
        "/" : (context) => MainPage(),
        "/home" : (context) => HomePage(),
        "/info" : (context) => Infopage(),
        "/setting" : (context) => SettingPage()
      },
    ); // MaterialApp end
  } // build end
} // class end