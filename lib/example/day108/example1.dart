/*
- 주요 통신 기술
JS : Fetch
JQuery : AJAX
React : Axios
Flutter : DIO
- 통신 테스트 페이지 : https://jsonplaceholder.typicode.com/
- Flutter 라이브러리 공유 페이지 : https://pub.dev/
Spring : build.gradle
JS : cdn
React : npm(node package manager)
Flutter : pubspec.yaml
*/

import 'package:dio/dio.dart';

final dio = Dio();    // 상수에 Dio 객체 저장

// [1] GET 요청 함수
void getEvent() async {
  try {
    // final response = await dio.get("URL");
    final response = await dio.get("https://jsonplaceholder.typicode.com/posts/1");
    print("[GET] 성공 : ${response.data}");
  } catch (error) {
    print("[GET] 실패 : ${error}");
  } // try-catch end
} // func end

// [2] POST 요청 함수
void postEvent() async {
  try {
    final obj = {'title': 'foo', 'body': 'bar', 'userId': 1};   // 전송할 데이터
    // final response = await dio.post("URL", data: 전송할데이터);
    final response = await dio.post("https://jsonplaceholder.typicode.com/posts", data: obj);
    print("[POST] 성공 : ${response.data}");
  } catch (error) {
    print("[POST] 실패 : ${error}");
  } // try-catch end
} // func end

void main(){
  print("*Dart 프로그램 시작점*");
  // 1. DIO 설치 : pubspec.yaml 파일 내 dependencies에 'dio: ^5.9.0' 추가
  // -> 들여쓰기 주의하여 추가
  // 2. 상단 Pub get을 클릭하여, 설치하기
  // 3. dart 파일 상단에서 Dio 객체를 생성

  // [1] GET 요청 함수 실행하기
  getEvent();
  // [2] POST 요청 함수 실행하기
  postEvent();
} // main end