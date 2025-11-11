import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

final dio = Dio();

class Home extends StatefulWidget{
  HomeState createState() => HomeState();
} // class end

class HomeState extends State<Home>{
  // 1. 위젯이 최초로 실행되면 1번 실행하는 함수
  void initState(){
    findAll();
  } // func end
  // 2. Spring 서버로부터 todo 전체 목록 가져오기
  void findAll() async {
    try {
      final response = await dio.get("http://192.168.40.190:8080/api/todo");
      final data = await response.data;
      setState(() {
        todoList = data;
      });
    } catch (error) {
      print(error);
    } // try-catch end
  } // func end
  // 3. Spring 서버로부터 가져온 todo 목록
  List<dynamic> todoList = [];
  // 4. Spring 서버로부터 todo 개별 삭제
  void deleteById(int id) async {
    try {
      final response = await dio.delete("http://192.168.40.190:8080/api/todo?id=${id}");
      final data = await response.data;
      if (data == true) findAll();
    } catch (error) {
      print(error);
    } // try-catch end
  } // func end



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("TODO"),),
      body: Center(     // 가운데 정렬
        child: Column(  // 세로형 위젯
          children: [
            Expanded(   // 확장형 세로 스크롤 위젯 지원
              child: ListView(
                children:
                // 반복문을 이용하여 여러 개의 Card 대입
                // map은 dynamic 타입을 지원하지 않는다.
                // todoList.map((반복변수명){return 반환위젯()}).toList()
                // 또는 day108_example2.dart 참고하여 builder로 만들기
                  todoList.map((todo){
                    return Card(child: ListTile(
                      title: Text(todo['title']),
                      subtitle: Text(todo['content']),
                      trailing: Row(  // 가로형 위젯
                        mainAxisSize: MainAxisSize.min,   // Row 배치에서 위젯들의 넓이를 자동으로 최소 크키로 할당
                        children: [
                          IconButton(onPressed: (){deleteById(todo['id']);}, icon: Icon(Icons.delete_forever)),
                          IconButton(onPressed: (){Navigator.pushNamed(context, "/update", arguments: todo['id']);}, icon: Icon(Icons.edit)),
                          // 위젯 간 이동 + 매개변수 전달 : Navigator.pushNamed(context, "이동경로", arguments: 매개변수);
                          IconButton(onPressed: (){Navigator.pushNamed(context, "/detail", arguments: todo['id']);}, icon: Icon(Icons.info)),
                        ],
                      ),
                    ));
                  }).toList()
                ,
              ),
            )
          ],
        ),
      )
    );
  } // build end
} // class end