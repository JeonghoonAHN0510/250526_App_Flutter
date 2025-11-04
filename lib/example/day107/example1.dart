// Dart 기본 문법
void main(){  // main 스레드를 갖는 함수
  // [1] 기본 타입
  int age = 25;                 // 정수 int
  print("나이 : ${age}");        // 문자열 ${변수명}
  double height = 175.5;        // 실수 double
  bool isStudent = false;       // 논리 bool
  String name = "유재석";        // 문자열 String
  print( "이름 : ${name}, 키 : ${height}, 학생여부 : ${isStudent}");

  // [2] 주요 변수 및 상수
  var city = "서울";             // JS처럼 자동 타입 추론
  dynamic count = 123;          // 자동 타입 + 타입 변경 가능 -> Java의 Object 느낌
  count = "123명";
  const PI = 3.141592;          // JS처럼 const 상수    -> 런타임시 상수 처리
  final country = "대한민국";     // Java처럼 final 상수  -> 컴파일시 상수 처리

  // [3] List, Map, Set
  List<String> fruits = ["사과", "바나나", "포도"];
  fruits.add("딸기");
  print("과일목록 : ${fruits}");

  Map<String, int> scores = { "국어" : 90, "영어" : 85, "수학" : 100 };
  print("점수목록 : ${scores}");

  Set<int> numbers = {1, 2, 2, 3, 3};
  print("중복없는 집합 : ${numbers}");

  // [4] 함수
  int add(int a, int b){return a + b;}
  int result = add(3, 5);
  print(result);

  // 익명함수 const 함수명 = (){} : ->(화살표) 생략
  var multiply = (int x, int y){return x * y;};
  int result2 = multiply(3, 5);
  print(result2);

  // [5] 클래스, 객체
  Person p1 = new Person("유재석", 50);
  Person p2 = Person("박명수", 55);      // new 생략 가능
  print("${p1.name}, ${p1.age}");
  print("${p2.name}, ${p2.age}");

  // [6] null을 갖는 타입 -> 타입명 뒤에 ? 붙이기
  String? nickName;
  nickName = null;
  print("닉네임 : ${nickName ?? "미정"}");

  // [7] if, for는 자바와 동일
} // main end

// [5-1] 클래스 : class 클래스명{}
class Person{
  // 멤버변수
  String name;
  int age;
  // 생성자
  Person(this.name, this.age);
} // class end