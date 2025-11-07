import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("상세페이지 타이틀")),
      body: Center(
        child: Column(
          children: [
            Text("상세페이지 본문"),
            ElevatedButton(
              onPressed: (){
                // 최근 위젯으로 돌아가기
                Navigator.pop(context);
              },
              child: Text("뒤로가기")
            )
          ] // children end
        )
      )
    );
  } // build end
} // class end