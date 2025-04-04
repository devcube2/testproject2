// Dart 언어는 단일 스레드 기반

// 1. Dio 객체 생성 , java : new 클래스명 vs dart
import 'package:dio/dio.dart';

final dio = Dio(); // final : 상수키워드

void main() { // main 함수가 스레드를 갖고 코드 시작함
  print('dart start');
  postHttp();
  getHttp();
}

// 3. 비동기 통신
// dio.HTTP메소드명("URL")
void getHttp() async {
  try {
    final response = await dio.get("http://192.168.40.58:8080/day03/course");
    print(response);
  } catch (e) {
    print(e);
  }
}

void postHttp() async {
  // (1) 보내고자 하는 내용물 JSON(dart map)
  final sendData = {"과정명" : "영어회화"};

  await dio.post("http://192.168.40.58:8080/day03/course", data : sendData);
}