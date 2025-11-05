import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

final dio = Dio();

// [1]
void main(){
  runApp(MyApp());    // 최초로 실행할 위젯
} // main end

// [2] 최초 메인 위젯 만들기
// StatelessWidget : 상태가 없는 위젯
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: GoodsWidget()
    );
  } // build end
} // class end

// [3] 위젯 만들기
// StatefulWidget : 상태가 있는 위젯
class GoodsWidget extends StatefulWidget{
  // 상태 위젯 생성
  @override
  GoodsWidgetState createState() => GoodsWidgetState();
} // class end

// [4] 상태 하위 위젯 만들기
class GoodsWidgetState extends State<GoodsWidget>{
  // [4-1] 입력상자 컨트롤러 만들기
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController descController = TextEditingController();

  // [4-2] goodsSave() 함수 만들기
  void goodsSave() async {
    final obj = {"gname" : nameController.text, "gprice" : priceController.text, "gdesc" : descController.text};
    print(obj);
    try {
      // 주의할 점 : web(HTTP 존재 O), app(HTTP 존재 X)
      // mobile : 192.168.40.184만 가능
      final response = await dio.post(
        "http://192.168.40.184:8080/api/goods",
        data: obj
      );
      final data = response.data;
      print("[POST] 성공 : ${data}");
      // 저장 성공된 자료를 추가하여 재렌더링 || goodsGetAll 재호출
      setState(() {
        goodsList.add(data);
      });
      // goodsGetAll();
    } catch (error) {
      print("[POST] 실패 : ${error}");
    } // try-catch end
  } // func end

  // [4-3] GetAll 정의
  void goodsGetAll() async {
    try {
      final response = await dio.get("http://192.168.40.184:8080/api/goods");
      final data = response.data;
      print("[GET] 성공 : ${data}");
      // 통신 결과를 함수 밖 변수에 업데이트
      setState(() {
        goodsList = data;
      });
    } catch (error) {
      print("[GET] 실패 : ${error}");
    } // try-catch end
  } // func end

  // [4-4] initState() 함수 만들기 -> 오버라이딩을 통해
  // useEffect(()=>{},[])처럼 현재 위젯이 최초로 실행될 때, 1번 실행
  @override
  void initState() {
    goodsGetAll();
  } // func end

  // [4-5] goodsList 정의 - dio로 가져온 데이터를 저장하는 상태변수
  dynamic goodsList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("제품 현황"),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child:  Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: "제품명"),
              controller: nameController,
            ),
            SizedBox(height: 20),

            TextField(
              decoration: InputDecoration(labelText: "제품가격"),
              keyboardType: TextInputType.number,   // 모바일 환경에서 키보드 형식을 숫자패드로 지정
              controller: priceController,
            ),
            SizedBox(height: 20),

            TextField(
              decoration: InputDecoration(labelText: "제품설명"),
              controller: descController,
            ),
            SizedBox(height: 50),
            ElevatedButton(onPressed: goodsSave, child: Text("제품 등록")),
            
            Expanded(
                child: ListView.builder(
                    itemCount: goodsList.length,
                    itemBuilder: (context, index){
                      dynamic item = goodsList[index];
                      return Card(
                        child: ListTile(
                          title: Text(item["gname"]),       // 객체명['속성명']
                          subtitle: Text(item["gdesc"]),
                        ),
                      );
                    }
                )
            )
          ],
        )
      )
    );
  } // build end
} // class end