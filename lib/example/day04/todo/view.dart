import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Detail extends StatefulWidget {
  @override
  _DetailState createState() {
    return _DetailState();
  }
}

class _DetailState extends State<Detail> {
  // * 1. 이전 화면 에서 arguments 값을 가져 오기
  // 전제조건 : Navigator.pushNamed(context, "/datail", arguments : {} )
  // ModalRoute.of(context)!.settings.arguments 인자값타입

  Dio dio = Dio();
  Map<String, dynamic> todo = {};

  // (1). initState() 해당 위젯이 최초로 열렸을때 딱 1번 실행 하는 함수 ( 위젯 생명주기 ), context 위젯트리를 제공 받을수 없다.
  // (2). didChangeDependencies()  부모 위젯이 변경 되었을때 실행되는 함수 ( 위젯 생명주기), context 위젯트리를 제공 받는다.

  @override
  void initState() {
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    int id = ModalRoute.of(context)!.settings.arguments as int;
    todoFindById(id);
  }

  void todoFindById(id) async {
    try {
      final response = await dio.get("https://different-silkworm-thejoeun-20dae9e2.koyeb.app/day04/todos/view?id=$id");
      setState(() {
        todo = response.data;
      });
      print('view todo: $todo');
    } catch(e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("상세 화면")),
      body: Center(
        child: Column(
          children: [
            Text("제목: ${todo['title']}", style: TextStyle(fontSize: 25)),
            SizedBox(height: 8),

            Text("내용: ${todo['content']}", style: TextStyle(fontSize: 20)),
            SizedBox(height: 8),

            Text("완료 여부: ${todo['done'] == true ? '완료' : '미완료'}", style: TextStyle(fontSize: 15)),
            SizedBox(height: 8),

            Text("할일 등록일: ${todo['createAt']}", style: TextStyle(fontSize: 15)),
            SizedBox(height: 8),
          ],
        )
      )
    );
  }
}