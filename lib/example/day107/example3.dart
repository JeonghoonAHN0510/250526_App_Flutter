// [1] 상태(state)가 있는 위젯
import 'package:flutter/material.dart';

class MyApp extends StatefulWidget{    // [1-1] StatefulWidget 상속받기
  // [1-3] 상태를 관리할 하위 위젯들을 등록
  // 등록할위젯명 createState() => 등록할위젯명();
  MyAppState createState() => MyAppState();
} // class end

// [1-2] 상태를 사용하는 위젯 선언
// 하위 위젯은 extends State<상위위젯명>
class MyAppState extends State<MyApp>{
  int count1 = 0;
  int count2 = 0;
  // [1-4] 상태 변경시키기 : React와 다르게 하나의 setState에서 관리할 수 있다.
  // setState(){새로운값;}
  void increment(){
    setState(() {
      count1++;
      count2--;
    });
  } // func end

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("상단제목")
        ),
        body: Center(
          child: Column(
          children: [
            Text("count1 : ${count1}"),
            Text("count2 : ${count2}"),
            TextButton(onPressed: increment, child: Text("증가 버튼"))
          ],
          )
        )
      )
    );
  } // build end
} // class end

void main(){
  runApp(MyApp());
}