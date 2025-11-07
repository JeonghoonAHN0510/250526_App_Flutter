import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

final dio = Dio();

class SavePage extends StatefulWidget{

  SavePageState createState() => SavePageState();
} // class end

class SavePageState extends State<SavePage>{
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();

  void todoSave() async {
    final obj = {"title" : titleController.text, "content" : contentController.text};
    try {
      final response = await dio.post(
        "http://192.168.40.190:8080/api/todo",
        data: obj
      );
      final data = response.data;
      print("[POST] 성공 : ${data}");
    } catch (error) {
      print("[POST] 실패 : ${error}");
    } // try-catch end
  } // func end

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("todo 저장 페이지"),),
      body: Center(
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: "todo 제목"),
              controller: titleController,
            ),

            TextField(
              decoration: InputDecoration(labelText: "todo 내용"),
              controller: contentController,
            ),

            ElevatedButton(onPressed: todoSave, child: Text("todo 등록"))
          ],
        ),
      ),
    );
  } // build end
} // class end