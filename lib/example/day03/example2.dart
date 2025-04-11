import 'package:flutter/material.dart';

void main() {
  runApp(MyApp1());
}

// 1. 상태를 관리하는 클래스 선언
class MyApp1 extends StatefulWidget {
  @override
  MyApp1State createState() => MyApp1State();
}

// 2. 상태를 사용하는 클래스 선언
class MyApp1State extends State<MyApp1> {
  int count = 0;

  void increment() {
    // count++;
    // 상태 변화에 따른 재 랜더링
    setState(() {
      count++;
    });
  }

  @override
  void initState() {
    print("상태 위젯 최초 실행 1번 함수");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("상단바")),
        body: Center(
          child: Column(
            children: [
              Text("count: $count"),
              TextButton(
                  onPressed: increment,
                  child: Text("클릭하면 count 증가"))
            ]
          )
        )
      )
    );
  }
}