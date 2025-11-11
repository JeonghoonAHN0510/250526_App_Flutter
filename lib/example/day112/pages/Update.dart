import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

final dio = Dio();

class Update extends StatefulWidget{
  UpdateState createState() => UpdateState();
} // class end

class UpdateState extends State<Update>{
  // 1. 이전(부모) 위젯이 변경되면 실행되는 함수 : 부모로부터 매개변수 받는 방법
  @override
  void didChangeDependencies() {
    int id = ModalRoute.of(context)!.settings.arguments as int;
    findById(id);
  } // func end
  // 2. Spring 서버로부터 개별조회
  void findById(int id) async {
    try {
      final response = await dio.get("http://192.168.40.190:8080/api/todo/detail?id=${id}");
      final data = await response.data;
      setState(() {
        todo = data;
        titleController.text = data['title'];
        contentController.text = data['content'];
      });
    } catch (error) {
      print(error);
    } // try-catch end
  } // func end
  // 3. Spring 서버로부터 가져온 todo
  dynamic todo = {};
  // 4. Input을 제어하는 컨트롤러 생성
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("TODO 수정 페이지"),),
      body: Column(
        children: [
          TextField(controller: titleController, maxLength: 30,),
          TextField(controller: contentController, maxLength: 255,),
          ElevatedButton(onPressed: (){}, child: Text("TODO 수정"))
        ],
      )
    );
  } // build end
} // class end