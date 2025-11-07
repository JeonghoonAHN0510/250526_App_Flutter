import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

final dio = Dio();

class FindAllPage extends StatefulWidget{

  FindAllPageState createState() => FindAllPageState();
} // class end

class FindAllPageState extends State<FindAllPage>{
  dynamic todoList = [];

  void findAll() async {
    try {
      final response = await dio.get("http://192.168.40.190:8080/api/todo");
      final data = response.data;
      print("[GET] 성공 : ${data}");
      setState(() {
        todoList = data;
      });
    } catch (error) {
      print("[GET] 실패 : ${error}");
    } // try-catch end
  } // func end

  // 위젯 최초 실행시 1번 실행
  void initState(){
    findAll();
  } // func end

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("todo 목록조회"),),
      body: Column(
        children: [
          ElevatedButton(onPressed: findAll, child: Text("재조회")),
          Expanded(
            child: ListView.builder(
              itemCount: todoList.length,
              itemBuilder: (context, index){
                dynamic item = todoList[index];
                return Card(
                  child: ListTile(
                    title: Text(item["title"]),
                    subtitle: Text(item["content"]),
                    onTap: () async {
                      try {
                        final response = await dio.delete("http://192.168.40.190:8080/api/todo?id=${item["id"]}");
                        final data = response.data;
                        print("[GET] 성공 : ${data}");
                        setState(() {
                          todoList.remove(item);
                        });
                      } catch (error) {
                        print("[GET] 실패 : ${error}");
                      } // try-catch end
                    },
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  } // build end
} // class end