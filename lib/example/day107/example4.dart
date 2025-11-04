import 'package:flutter/material.dart';

void main(){runApp(MyApp());}

// [1] 플러터 앱의 시작점 위젯
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: IOWidget(),
    );
  } // build end
} // class end

// [2] 상태가 있는 상위 위젯
class IOWidget extends StatefulWidget{
  // 현재 위젯을 상속받은 하위 위젯들을 등록하기 : createState 재정의(오버라이딩)
  @override
  IOWidgetState createState() => IOWidgetState();
} // class end

// [3] 상태가 있는 하위 위젯
class IOWidgetState extends State<IOWidget>{
  // TextField로부터 입력받은 값들을 제어할 변수 필요 : TextField 1개당 1개씩 필요
  // -> TextEditingController
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();

  // 등록버튼을 제어할 등록 함수 필요
  void onSave(){
    print(nameController.text); // 컨트롤러명.text : 현재 입력받은 값 반환
    print(ageController.text);
  } // func end

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("입출력 위젯"),
      ),
      body: Column(
        children: [
          TextField(
            controller: nameController,
            decoration: InputDecoration(
              labelText: "이름을 입력하세요."
            )
          ),
          TextField(
              controller: ageController,
              decoration: InputDecoration(
                  labelText: "나이를 입력하세요."
            )
          ),
          TextButton(onPressed: onSave, child: Text("등록")),
        ],
      ),
    );
  } // build end
} // class end