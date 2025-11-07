import 'package:app_flutter/example/day110/pages/HomePage.dart';
import 'package:app_flutter/example/day110/pages/InfoPage.dart';
import 'package:app_flutter/example/day110/pages/SettingPage.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget{
  // StatefulWidget : 상태가 있는 위젯으로부터 상속받기

  @override
  MainPageState createState() => MainPageState();
} // class end

class MainPageState extends State<MainPage>{
  int currentPageIndex = 0;     // 현재 화면에 보이는 페이지 번호
  dynamic pages = [             // == List<Widget>
    HomePage(),                 // index 0 == 홈페이지
    Infopage(),                 // index 1 == 정보페이지
    SettingPage(),              // index 2 == 설정페이지
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentPageIndex,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        // 현재 선택된 버튼 번호 설정
        currentIndex: currentPageIndex,
        onTap: (index) => {setState(() {
          currentPageIndex = index;
        })},        // onTap : 바텀 메뉴의 하나의 탭을 눌렀을 때
        items: [    // items : 바텀 메뉴에 들어갈 위젯 버튼들
          BottomNavigationBarItem(    // 0번 index
            icon: Icon(Icons.home, size: 20),
            label: "홈"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info, size: 30),
            label: "정보"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings, size: 30, color: Colors.pink),
            label: "설정"
          )
        ] // items end
      ),
    );
  } // build end
} // class end