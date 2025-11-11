import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

final dio = Dio();

class Detail extends StatefulWidget{
  DetailState createState() => DetailState();
} // class end

class DetailState extends State<Detail>{
  // 1. 위젯이 최초로 실행되면 1번 실행하는 함수
  @override
  void initState() {

  } // func end
  // 2. 이전(부모) 위젯이 변경되면 실행되는 함수
  @override
  void didChangeDependencies() {
    // 이전 위젯에서 상세버튼을 클릭하면, 서로 다른 매개변수를 가져온다.
    // ModalRoute.of(context)!.settings.arguments as 타입;
    int id = ModalRoute.of(context)!.settings.arguments as int;
    findById(id);
  } // func end
  // 3. Spring 서버로부터 개별조회
  void findById(int id) async {
    try {
      final response = await dio.get("http://192.168.40.190:8080/api/todo/detail?id=${id}");
      final data = await response.data;
      setState(() {
        todo = data;
      });
    } catch (error) {
      print(error);
    } // try-catch end
  } // func end
  // 4. Spring 서버로부터 가져온 todo
  dynamic todo = {};


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("TODO 상세페이지"),),
      body: Padding(
        // padding: EdgeInsets.fromLTRB(left, top, right, bottom),
        padding: EdgeInsets.fromLTRB(30, 30, 30, 40),
        child: Column(   // 세로형 위젯
          crossAxisAlignment: CrossAxisAlignment.start, // 좌측 정렬
          children: [
            Text("제목 : ${todo['title']}", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            SizedBox(height: 10),
            Text("내용 : ${todo['content']}", style: TextStyle(fontSize: 18, color: Colors.pink)),
            SizedBox(height: 20),
            Text("완료 여부 : ${todo['done'] == true ? '완료' : '미완료'}", style: TextStyle(fontSize: 18)),
            SizedBox(height: 20),
            Text("등록일 : ${todo['createDate']}", style: TextStyle(fontSize: 18))
          ],
        ),
      )
    );
  } // build end
} // class end