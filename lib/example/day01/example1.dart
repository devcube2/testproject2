// Dart 언어
// 1. 주석
// 한줄 주석
/* 여러줄 주석 */

// 2. Dart 프로그램 진입점 함수 = main
// void main() {}

// 3. 콘솔 출력함수 = print();
void main() {
  print("Hello, World");

  // p.64
  // 1. 문자열 타입
  String name = '유재석';
  print(name);
  String name2 = "유재석";
  print(name2);
  String name3 = "이름 : $name";
  print(name3);

  // 2. 숫자 타입 , num : int/double 상위타입
  int year = 2023; // 정수
  print(year);
  double pi = 3.14159; // 실수
  print(pi);
  num year2 = 2023;
  print(year2);
  num pi2 = 3.14159;
  print(pi2);

  // 3. 불 타입 , bool
  bool darkMode = false;
  print(darkMode);

  // p.65 컬렉션
  List<String> fruits = ['사과', '딸기', '바나나', '샤인머스켓', '샤인머스켓'];
  print(fruits);
  Set<int> odds = {1, 3, 5, 7, 9, 9};
  print(odds); // Set 컬렉션은 인덱스 가 없다.

  Map<String, int> regionMap = {
    "서울": 0, "인천": 1, "대전": 2, "부산": 3,
    "대구": 4, "광주": 5, "울산": 6, "세종": 7
  };
  print(regionMap);
  print(regionMap['세종']);

  // p.65 기타
  // 1. Object : 모든 자료들을 Object(최상위타입) 저장
  Object a = 1;
  print(a);
  // 2. dynamic : 동적 타입으로 대입이 되는순간 타입 결정, 타입변환 필요 없다.
  dynamic a1 = 1;
  dynamic a2 = 3.14;
  dynamic a3 = "강호동";
  dynamic a4 = ['사과'];
  dynamic a5 = {1, 3, 4};
  dynamic a6 = {"name": "유재석", "age": 40};
  // 3. 타입? : null 이 될수 있는 타입 vs
  String? nickname = null;
  // print(nickname);

  // var : 처음에 할당된 값의 타입이 결정 , dynamic 선언된 변수는 모든 타입들이 들어올 수 있다.
}