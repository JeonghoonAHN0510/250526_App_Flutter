import 'package:flutter/material.dart';

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("홈페이지 타이틀")),
      body: Center(
        child: ElevatedButton(
          onPressed: (){Navigator.pushNamed(context, "/detail");},
          child: Text("특정페이지로 이동")
        )
      )
    );
  } // build end
} // class end