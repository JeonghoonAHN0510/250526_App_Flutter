// example1.dart 파일 생성
// 1. void main(){}를 이용한 최초 실행 코드 작성
// 2. 위젯을 작성한다. -> 위젯이란? 화면을 구성하는 가장 작은 단위(= 컴포넌트)

// [1] 위젯 만들기
// 1-1. StatelessWidget을 상속받는다.
// 1-2. build 함수를 오버라이딩한다.
// 1-3. build 함수 내에서 'MaterialApp'을 반환한다.
import 'package:flutter/material.dart';

class MyApp1 extends StatelessWidget{
  // extends : 특정 클래스로부터 물려받는 행위
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Text("안녕하세요"));
  } // build end
} // class end

class MyApp2 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // return MaterialApp(속성명: 출력할 위젯);
    // return MaterialApp(home: Scaffold(속성명:값, 속성명:값));
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(title: Text("여기가 상단바"),),                    // 상단바
            body: Center(child: Text("여기가 본문"),),                       // 본문
            bottomNavigationBar: BottomAppBar(child: Text("여기가 하단바"),)  // 하단바
        ) // Scaffold end
    ); // MaterialApp end
  } // build end
} // class end

void main(){            // public static void main(){}와 비슷한 main 스레드
  print("dart 입니다."); // System.out.println()와 비슷한 출력함수
  // runApp(MyApp1());     // 위젯을 실행시키는 함수
  runApp(MyApp2());
}
// 자바와 비슷하게 최초 실행은 void main에서 시작된다.