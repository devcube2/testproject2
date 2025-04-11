import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  // 1. 입력 컨트롤러 이용한 입력값들을 제어한다.
  // 2. 생성한 입력컨트롤러 객체를 대입한다.
  final TextEditingController controller1 = TextEditingController();
  final TextEditingController controller2 = TextEditingController();
  final TextEditingController controller3 = TextEditingController();
  // 3. 입력받은 값 추출
  void onEvent() {
    print(controller1.text);
    print(controller2.text);
    print(controller3.text);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("입력 화면")
        ),
        body: Center(
          child: Column(
            children: [
              SizedBox(height: 30),
              Text("아래 내용들을 입력해주세요."),
              SizedBox(height: 30),
              TextField(controller: controller1),
              SizedBox(height: 30),
              TextField(maxLength: 30, controller: controller2),
              SizedBox(height: 30),
              TextField(maxLines: 5, controller: controller3),
              SizedBox(height: 30),
              TextButton(
                  onPressed: onEvent,
                  child: Text("클릭시 입력값을 출력합니다.")
              )
            ],
          )
        )
      )
    );
  }
}