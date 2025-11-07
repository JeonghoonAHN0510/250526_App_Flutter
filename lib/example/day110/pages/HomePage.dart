import 'package:flutter/material.dart';

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("홈페이지 타이틀")),
      body: Text("홈페이지 본문")
    );
  } // build end
} // class end