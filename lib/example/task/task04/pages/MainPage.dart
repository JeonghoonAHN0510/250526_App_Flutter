import 'package:app_flutter/example/task/task04/pages/FindAllPage.dart';
import 'package:app_flutter/example/task/task04/pages/HomePage.dart';
import 'package:app_flutter/example/task/task04/pages/SavePage.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget{

  MainPageState createState() => MainPageState();
} // class end

class MainPageState extends State<MainPage>{
  int currentPageIndex = 0;
  dynamic pages = [
    HomePage(),
    SavePage(),
    FindAllPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentPageIndex,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPageIndex,
        onTap: (index) => {setState(() {
          currentPageIndex = index;
        })},
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "홈"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.save),
            label: "등록"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.find_in_page),
            label: "조회"
          )
        ],
      ),
    );
  } // build end
} // class end