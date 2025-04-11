import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  // MyAppState createState() { return MyAppState(); }
  // MyAppState createState() => MyAppState();
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  String responseText = "테스트";
  Dio dio = Dio();
  List<dynamic> todoList = [];
  // dynamic todoList = [];

  void todoSend() async {
    try {
      final sendData = {
        "title": "운동하기",
        "content": "매일10분달리기",
        "done": "false",
      };
      final response = await dio.post(
        "http://localhost:8080/day04/todos",
        data: sendData,
      );
      final data = response.data;
      // 응답 결과를 상태에 저장
      setState(() {
        responseText = "응답 결과 : $data";
      });
    } catch (e) {
      print(e);
    }
  }

  void todoGet() async {
    try {
      final response = await dio.get("http://localhost:8080/day04/todos");
      final data = response.data;
      print(data);
      // 응답 결과를 상태에 저장
      setState(() {
        todoList = data;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    todoGet(); // 모든 할일 목록 가져오기 함수 실행
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            children: [
              Text(responseText),
              TextButton(onPressed: todoSend, child: Text("todoSend")),
              OutlinedButton(onPressed: todoGet, child: Text("todoGet")),
              Expanded(
                // 확장 위젯 : column 에서 남은 공간을 모두 차지
                child: ListView(
                  //children: [
                  // ListTile(title: Text("플러터"), subtitle: Text("123")),
                  // ListTile(title: Text("다트"), subtitle: Text("456")),
                  // ListTile(title: Text("파이썬"), subtitle: Text("789")),
                  // for (int index = 0; index < todoList.length; index++)
                  //   ListTile(title: Text(todoList[index]['title']))
                  //],
                  children:
                      todoList.map((todo) {
                        return ListTile(title: Text(todo['title']), subtitle: Text(todo['content']));
                      }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
