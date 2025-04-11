import 'package:flutter/material.dart';
import 'package:testproject2/task8/home.dart';
import 'package:testproject2/task8/write.dart';
import 'package:testproject2/task8/view.dart';
import 'package:testproject2/task8/update.dart';

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