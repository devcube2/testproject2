import 'package:flutter/material.dart';
import 'package:testproject2/example/day04/todo/home.dart';
import 'package:testproject2/example/day04/todo/write.dart';
import 'package:testproject2/example/day04/todo/view.dart';
import 'package:testproject2/example/day04/todo/update.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/", // 앱이 실행했을때 초기 경로 설정
      routes: {
        "/": (context) => Home(),
        "/write": (context) => Write(),
        "/detail": (context) => Detail(),
        "/update": (context) => Update(),
      },
    );
  }
}