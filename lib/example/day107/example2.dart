// [1] 상태가 없는 위젯 : 리렌더링이 필요없을 때 사용
import 'package:flutter/material.dart';
class MyStatelessApp extends StatelessWidget{      // [1-1] StatelessWidget 상속받기
  // [1-3] 이벤트 만들기
  int count = 0;
  void increment(){ count++; print(count);}


  @override
  Widget build(BuildContext context) {    // [1-2] build 함수 재구현
    // return MaterialApp(
    //   home: Text("안녕하세요"),
    // );
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            title: Text("상단 제목")
        ),
        body: Center(
            child: Column(
                children: [
                  Text("세로정렬 위젯1"),
                  Text("세로정렬 위젯2"),
                  Text("세로정렬 위젯3"),
                  TextButton(onPressed: increment, child: Text("버튼위젯1")),
                  Text("count : ${count}")
                ]
            )
        )
      )
    );
  } // build end
} // class end

// [2] 최초로 실행할 위젯 : main 함수 안에서 runApp 함수를 이용한 위젯 실행
// 상단바에서 web 또는 Phone 선택하여 실행
void main(){
  runApp(MyStatelessApp());
} // main end